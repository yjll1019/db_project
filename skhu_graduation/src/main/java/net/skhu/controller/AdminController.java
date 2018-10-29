package net.skhu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.skhu.dto.User;
import net.skhu.mapper.UserMapper;
import net.skhu.util.SecurityUtil;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired UserMapper userMapper;

	// 내 정보 페이지 Get
	@RequestMapping(value="adminInfo",method=RequestMethod.GET)
	public String adminInfo(Model model) {//HttpSession session 파라미터값으로 잇어야함...

		/* 세션값이 없어서 실행할 수 없음..
		User user = (User) session.getAttribute("user");//user라는 객체를 가져옴.세션값을 가져와야 현재 접속한 아이디값을 얻을 수 있다.
		if(user.getId()==null) return "user/login"; // 세션값에 아이디 없으면 로그인창으로
		model.addAttribute("user",user);
		*/
		User user = new User();
		model.addAttribute("user",user);
		return "admin/adminInfo";
	}
	// 내 정보 페이지 POST
	@RequestMapping(value="adminInfo",method=RequestMethod.POST)
	public String adminInfo(Model model,User user, HttpSession session ) {

		User getUser = (User) session.getAttribute("user");
		User result = userMapper.login(getUser.getId());
		String alert="";
		String regex="([a-zA-Z].+[0-9])|([0-9].+[a-zA-Z])"; //영문+숫자

		//비밀번호 조건에 맞지 않을 떄
		if(!user.getPassword().matches(regex) || user.getPassword().length()<8) {
			alert="-1";
			model.addAttribute("user",user);
			model.addAttribute("alert",alert);
			return "admin/adminInfo";

		}
		// 비밀번호와 확인비밀번호가 다를 때
		if(!user.getConfirmPassword().equals(user.getPassword())) {
			alert="-2";
			model.addAttribute("user",user);
			model.addAttribute("alert",alert);
			return "admin/adminInfo";
		}

		SecurityUtil su = new SecurityUtil();
		String enPssword = su.encryptBySHA256(user.getPassword());// 암호화
		user.setPassword(enPssword);

		userMapper.updateAdmin(user); // user테이블 update
		alert="1"; // update 성공
		model.addAttribute("alert",alert);
		return "admin/admin_stu_search"; //학생 조회 페이지로
	}
	@RequestMapping(value="admin_stu_search", method=RequestMethod.GET)
	public String main(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "admin/admin_stu_search";
	}

	@RequestMapping(value="admin_professor_forgot_password", method=RequestMethod.GET)
	public String forgotPassword(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "admin/admin_professor_forgot_password";
	}
}
