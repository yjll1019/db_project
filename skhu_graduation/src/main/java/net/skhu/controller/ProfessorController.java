package net.skhu.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.dto.Student;
import net.skhu.dto.User;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.util.SecurityUtil;

@Controller
@RequestMapping("/professor")
public class ProfessorController {

	@Autowired UserMapper userMapper;
	@Autowired StudentMapper studentMapper;
	static String[] searchIndex = {"s.userId, s.userName"};

	@RequestMapping("professor_stu_search")
	public String list1 (Model model) {
		model.addAttribute("students", studentMapper.findAllWithUser());
		return "professor/professor_stu_search";
	}


	//학생 검색
	@RequestMapping(value="professor_stu_search", method=RequestMethod.POST)
	public String list(Model model,  @RequestParam("searchIndex") int searchIndex, @RequestParam("searchText") String input) {
		System.out.println(Integer.toString(searchIndex));
		input= input+"%";

		Student student = new Student();
		List<Student> students = null;

		switch(searchIndex) {
		case 0:
		 students = studentMapper.findById(input);
		break;
		case 1:
		 students = studentMapper.findByName(input);
		break;

		}
		model.addAttribute("students", students);
		return "professor/professor_stu_search";
	}

	//professor_info GET
	@RequestMapping(value="/professor_info",method=RequestMethod.GET)
	public String professor_info(Model model,HttpSession session) {

		User user = (User) session.getAttribute("user");//user라는 객체를 가져옴.세션값을 가져와야 현재 접속한 아이디값을 얻을 수 있다.
		if(user.getId()==null) return "redirect:/user/login"; // 세션값에 아이디 없으면 로그인창으로
		model.addAttribute("user",user);

		return "professor/professor_info";
	}
	// professor_info POST
		@RequestMapping(value="/professor_info",method=RequestMethod.POST)
		public String professor_info(Model model,User user, HttpSession session ) {

			User userGetId = (User) session.getAttribute("user");
			user.setId(userGetId.getId());
			String alert="";
			String regex="([a-zA-Z].+[0-9])|([0-9].+[a-zA-Z])"; //영문+숫자

			//비밀번호 조건에 맞지 않을 떄
			if(!user.getPassword().matches(regex) || user.getPassword().length()<8) {
				alert="-1";
				model.addAttribute("user",user);
				model.addAttribute("alert",alert);
				return "professor/professor_info";

			}
			// 비밀번호와 확인비밀번호가 다를 때
			if(!user.getConfirmPassword().equals(user.getPassword())) {
				alert="-2";
				model.addAttribute("user",user);
				model.addAttribute("alert",alert);
				return "professor/professor_info";
			}

			SecurityUtil su = new SecurityUtil();
			String enPssword = su.encryptBySHA256(user.getPassword());// 암호화
			user.setPassword(enPssword);

			userMapper.updateProfessor(user); // user테이블 update


			return "redirect:/professor/professor_stu_search"; //학생 조회 페이지로
		}

}


