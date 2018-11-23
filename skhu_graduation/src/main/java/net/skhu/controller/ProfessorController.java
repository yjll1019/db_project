package net.skhu.controller;


import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.dto.Department;
import net.skhu.dto.GraduationText;
import net.skhu.dto.Professor;
import net.skhu.dto.SecondMajor;
import net.skhu.dto.Student;
import net.skhu.dto.User;
import net.skhu.mapper.CounselMapper;
import net.skhu.mapper.ProfessorMapper;
import net.skhu.mapper.SecondMajorMapper;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.GraduationMapper;
import net.skhu.util.SecurityUtil;

@Controller
@RequestMapping("/professor")
public class ProfessorController {

	@Autowired UserMapper userMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired SecondMajorMapper secondMajorMapper;
	@Autowired CounselMapper counselMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired GraduationMapper graduationMapper;

	static String[] searchIndex = {"s.userId, s.userName"};

	@RequestMapping("professor_stu_search")
	public String list1 (Model model) {
		
		model.addAttribute("students", studentMapper.findAllWithUser());
		return "professor/professor_stu_search";
	}

	//학생 검색
	@RequestMapping(value="professor_stu_search", method=RequestMethod.POST)
	public String list(Model model,  @RequestParam("searchIndex") int searchIndex,  @RequestParam("grade") int grade,
			@RequestParam("searchText") String input) {
		System.out.println(Integer.toString(searchIndex));
		input= "%" + input + "%";
		System.out.println(input);

		//Student student = new Student();
		List<Student> students = null;
		
		
		if(grade != 0) {
			switch(grade) {
			case 1:
				students = studentMapper.findByGrade("1", "2");
				break;
			case 2:
				students = studentMapper.findByGrade("3", "4");
				break;
			case 3:
				students = studentMapper.findByGrade("5", "6");
				break;
			case 4:
				students = studentMapper.findByGrade("7", "8");
				break;
		}
			
		}
		else {
			students = studentMapper.findAllWithUser();
			
		}
		
		if(searchIndex!=0) {
		switch(searchIndex) {
		case 1:
			students = studentMapper.findById(input);
			break;
		case 2:
			students = studentMapper.findByName(input);
			break;

		}
	}
		model.addAttribute("students", students);
		return "professor/professor_stu_search";
	}

	//professor_info GET
	@RequestMapping(value="/professor_info",method=RequestMethod.GET)
	public String professor_info(Model model, HttpSession session) {

		User user = (User) session.getAttribute("user");//user라는 객체를 가져옴.세션값을 가져와야 현재 접속한 아이디값을 얻을 수 있다.
		if(user.getId() == null) return "redirect:/user/login"; // 세션값에 아이디 없으면 로그인창으로
		Professor professor = professorMapper.findOneWithUser(user.getId()).get(0);
		System.out.println("this" + professor.getDepartmentId());
		model.addAttribute("user", user);
		model.addAttribute("professor", professor);

		return "professor/professor_info";
	}
	
	// professor_info POST
	@Transactional
	@RequestMapping(value="/professor_info",method=RequestMethod.POST)
	public String professor_info(Model model,User user, Professor professor, HttpSession session ) {

		User userGetId = (User) session.getAttribute("user");
		user.setId(userGetId.getId());
		user.setRole(userGetId.getRole());
		professor.setUserId(userGetId.getId());

		String alert="";
		String regex="([a-zA-Z].+[0-9])|([0-9].+[a-zA-Z])"; //영문+숫자

		if(user.getPassword().length() > 0) {
			//비밀번호 조건에 맞지 않을 떄
			if(!user.getPassword().matches(regex) || user.getPassword().length()<8) {
				alert="-1";
				model.addAttribute("user",user);
				model.addAttribute("professor",professor);
				model.addAttribute("alert",alert);
				return "professor/professor_info";

			}
			// 비밀번호와 확인비밀번호가 다를 때
			if(!user.getConfirmPassword().equals(user.getPassword())) {
				alert="-2";
				model.addAttribute("user",user);
				model.addAttribute("professor",professor);
				model.addAttribute("alert",alert);
				return "professor/professor_info";
			}

			SecurityUtil su = new SecurityUtil();
			String enPssword = su.encryptBySHA256(user.getPassword());// 암호화
			user.setPassword(enPssword);
			
		} else {
			user.setPassword(userGetId.getPassword());
		}

		userMapper.updateProfessor(user); // user테이블 update
		professorMapper.updateProfessor(professor); // professor 테이블 update

		session.removeAttribute("user");
		session.setAttribute("user", user);

		return "redirect:professor_stu_search";
	}

	//professor_stu_info GET
	@RequestMapping(value="/professor_stu_info",method=RequestMethod.GET)
	public String professor_stu_info(Model model,@RequestParam("id") String id,HttpSession session) {

		User user = (User) session.getAttribute("user");//user라는 객체를 가져옴.세션값을 가져와야 현재 접속한 아이디값을 얻을 수 있다.
		if(user.getId()==null) return "redirect:/user/login"; // 세션값에 아이디 없으면 로그인창으로
		Student student = studentMapper.findOneWithUser(id);
		SecondMajor secondMajor = secondMajorMapper.findOneById(id);
		model.addAttribute("user",user);
		model.addAttribute("student",student);
		model.addAttribute("secondMajor",secondMajor);
		return "professor/professor_stu_info";
	}
	//professor_momo GET
	@RequestMapping(value="/professor_memo",method=RequestMethod.GET)
	public String professor_memo(Model model,@RequestParam("id") String id,HttpSession session) {

		User user = (User) session.getAttribute("user");//user라는 객체를 가져옴.세션값을 가져와야 현재 접속한 아이디값을 얻을 수 있다.
		if(user.getId()==null) return "redirect:/user/login"; // 세션값에 아이디 없으면 로그인창으로
		//Counsel counsel = counselMapper.findAll(id);
		//model.addAttribute("counsel",counsel);
		model.addAttribute("user",user);
		return "professor/professor_memo";
	}
	
	
	//교수 졸업요건 조회
	@RequestMapping(value = "professor_allSearch", method = RequestMethod.GET)
	public String professor_allSearch(Model model, HttpSession session)
	{
		User user = (User) session.getAttribute("user");

		User users = userMapper.findById(user.getId());
		model.addAttribute("users", users);

		Professor professor= professorMapper.findOne(user.getId());
		model.addAttribute("professor", professor);
		

		List<Department> departments = departmentMapper.findAll();
		model.addAttribute("departments", departments);
		String departmentId = professor.getDepartmentId();
		
		
		Department department = departmentMapper.findOne(professor.getDepartmentId());
		model.addAttribute("department", department);

		GraduationText list0 = graduationMapper.findByDepartmentId(departmentId, "0");
		model.addAttribute("list0", list0);
		
		GraduationText list1 = graduationMapper.findByDepartmentId(departmentId, "1");
		model.addAttribute("list1", list1);
		
		GraduationText list2 = graduationMapper.findByDepartmentId(departmentId, "2");
		model.addAttribute("list2", list2);
		
		GraduationText list3 = graduationMapper.findByDepartmentId(departmentId, "3");
		model.addAttribute("list3", list3);
		
		GraduationText list4 = graduationMapper.findByDepartmentId(departmentId, "4");
		model.addAttribute("list4", list4);
		
		GraduationText list5 = graduationMapper.findByDepartmentId(departmentId, "5");
		model.addAttribute("list5", list5);

		return "professor/professor_allSearch";
	}

	@RequestMapping(value = "professor_allSearch", method = RequestMethod.POST)
	public String professor_allSearchh(Model model, HttpSession session,  @RequestParam("departmentId") String departmentId)
	{
		User user = (User) session.getAttribute("user");

		User users = userMapper.findById(user.getId());
		model.addAttribute("users", users);

		Student student = studentMapper.findOneWithUser(user.getId());
		student.setDepartmentId(departmentId);
		model.addAttribute("student", student);

		List<Department> departments = departmentMapper.findAll();
		model.addAttribute("departments", departments);
		
		Department department = departmentMapper.findOne(departmentId);
		model.addAttribute("department", department);

		GraduationText list0 = graduationMapper.findByDepartmentId(departmentId, "0");
		model.addAttribute("list0", list0);
		
		GraduationText list1 = graduationMapper.findByDepartmentId(departmentId, "1");
		model.addAttribute("list1", list1);
		
		GraduationText list2 = graduationMapper.findByDepartmentId(departmentId, "2");
		model.addAttribute("list2", list2);
		
		GraduationText list3 = graduationMapper.findByDepartmentId(departmentId, "3");
		model.addAttribute("list3", list3);
		
		GraduationText list4 = graduationMapper.findByDepartmentId(departmentId, "4");
		model.addAttribute("list4", list4);
		
		GraduationText list5 = graduationMapper.findByDepartmentId(departmentId, "5");
		model.addAttribute("list5", list5);
		

		return "professor/professor_allSearch";
	}

}


