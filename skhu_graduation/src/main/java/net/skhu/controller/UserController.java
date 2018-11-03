package net.skhu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.skhu.dto.Department;
import net.skhu.dto.SecondMajor;
import net.skhu.dto.Student;
import net.skhu.dto.User;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.SecondMajorMapper;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.util.SecurityUtil;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired UserMapper userMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired SecondMajorMapper secondMajorMapper;

	//회원가입창
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String join(Model model){
		User user = new User();
		List<Department> departments = departmentMapper.findAll();
		model.addAttribute("departments", departments);
		model.addAttribute("user", user);
		return "user/join";
	}

	//학생 회원가입
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(Model model, User user){
		int result = userMapper.findOne(user.getId());//아이디가 존재하지않으면 0 존재하면 1
		String regex="([a-zA-Z].+[0-9])|([0-9].+[a-zA-Z])"; //영문+숫자
		String emailRegex = "^[_a-zA-Z0-9]+@[a-zA-Z]+\\.[a-zA-Z]+$";

		if(result==0) {
			user.setRole("학생");

			if(!user.getPassword().matches(regex) || user.getPassword().length()<8 || !user.getEmail().matches(emailRegex)) {
				//비밀번호 조건(영어+숫자 8자리 이상)과 이메일 조건에 맞지 않을 때
				List<Department> departments = departmentMapper.findAll();
				model.addAttribute("departments", departments);
				model.addAttribute("user", user);
				if(!user.getEmail().matches(emailRegex)) {
					model.addAttribute("result", 3);//이메일 조건에 맞지 않음.
				}else {
					model.addAttribute("result", 2);//비밀번호 조건에 맞지 않음.
				}
				return "user/join";
			}

			if(user.getConfirmPassword().equals(user.getPassword())) {
				SecurityUtil su = new SecurityUtil();
				String enPassword = su.encryptBySHA256(user.getPassword());	// 암호화
				user.setPassword(enPassword);
				userMapper.insert(user); //user테이블 insert

				Student s = new Student();
				s.setUserId(user.getId());
				s.setStuSemester(user.getStuSemester());
				s.setStuClass(user.getStuClass());
				s.setTransferStudent(user.getTransferStudent());
				s.setVolunteerExemption(user.getVolunteerExemption());
				s.setDepartmentId(user.getDepartmentId());
				s.setHowToGraduate(user.getHowToGraduate());

				studentMapper.insert(s);//student테이블 insert

				if(user.getDoubleMajor()!=null || user.getSubMajor()!=null) {

					SecondMajor sm = new SecondMajor();
					sm.setUserId(user.getId());
					sm.setDepartmentId(user.getSecondMajorDepartmentId());
					if(user.getDoubleMajor()!=null) {
						sm.setDivision("복수전공");
					}else {
						sm.setDivision("부전공");
					}
					secondMajorMapper.insert(sm);
				}

				model.addAttribute("result", 0);
				return "redirect:login";
			} else {
				List<Department> departments = departmentMapper.findAll();
				model.addAttribute("departments", departments);
				model.addAttribute("user", user);
				model.addAttribute("result", 1); //비밀번호와 확인비밀번호가 다름.
				return "user/join";
			}
		}else { //아이디가 존재할 때 > 로그인창으로
			model.addAttribute("result", -1);
			return "redirect:login";
		}
	}

	// 로그인 화면
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "user/login";
	}

	// 로그인
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(Model model, User user, HttpSession session) {
		User result = userMapper.login(user.getId());
		String url;
		String alert;

		if(result == null) {	// 아이디가 존재하지 않는 경우
			alert = "-1";
			user.setId("");
			user.setPassword("");
			url = "user/login";
		}
		else {
			SecurityUtil su = new SecurityUtil();
			String enPassword = su.encryptBySHA256(user.getPassword());	// 암호화
			user.setPassword(enPassword);

			if(result.getPassword().equals(user.getPassword())) {	// 비밀번호가 일치하는 경우 (암호화된 비밀번호를 비교)
				alert = "1";
				session.setAttribute("user", result);
				String role = result.getRole();
				if(role.equals("학생"))
					url = "redirect:/student/stu_main";
				else if(role.equals("교수"))
					url = "redirect:/professor/professor_stu_search";
				else if(role.equals("관리자"))
					url = "redirect:/admin/admin_stu_search";
				else
					url = "redirect:/admin/superAdmin";
			}
			else if(!result.getPassword().equals(user.getPassword())){	// 비밀번호가 일치하지 않는 경우
				alert = "0";
				user.setPassword("");
				url = "user/login";
			}
			else {
				alert = "";
				url = "user/login";
			}
		}
		model.addAttribute("alert", alert);
		return url;
	}

	@RequestMapping(value="logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "user/logout";
	}

	// 개인정보 수정 전 비밀번호 확인 페이지 GET
	@RequestMapping(value="/check_password",method=RequestMethod.GET)
	public String checkPassword(Model model,HttpSession session) {

		User user = (User) session.getAttribute("user");//user라는 객체를 가져옴.세션값을 가져와야 현재 접속한 아이디값을 얻을 수 있다.
		if(user.getId()==null) return "redirect:/user/login"; // 세션값에 아이디 없으면 로그인창으로
		model.addAttribute("user",user);
		return "user/check_password";
	}
	// 개인정보 수정 전 비밀번호 확인 페이지 POST
	@RequestMapping(value="/check_password",method=RequestMethod.POST)
	public String checkPassword(Model model, User user, HttpSession session) {

		User getUser = (User) session.getAttribute("user");
		User result = userMapper.login(getUser.getId());

		SecurityUtil su = new SecurityUtil();
		String enPassword = su.encryptBySHA256(user.getPassword());

		//System.out.println("세션 비번 값:"+ result.getPassword());
		//System.out.println("비번 입력값:"+user.getPassword());
		//System.out.println("비번 암호화값:"+enPassword);

		String alert="";
		String url="";

		//비밀번호 불일치
		if(!result.getPassword().equals(enPassword)) {
			alert="-1";
			url="user/check_password";
		}else if(result.getPassword().equals(enPassword)) {
			alert="1"; //비밀번호 일치
			url="redirect:/admin/adminInfo";// 관리자 개인정보변경 페이지로
		}
		model.addAttribute("alert",alert);
		return url;
	}

}
