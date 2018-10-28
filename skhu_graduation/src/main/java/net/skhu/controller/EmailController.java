package net.skhu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.skhu.dto.FindUtil;
import net.skhu.dto.User;
import net.skhu.mapper.EmailServiceImpl;
import net.skhu.mapper.UserMapper;

@Controller
@RequestMapping("/admin")
public class EmailController {

	@Autowired
	private EmailServiceImpl emailService;

	@Autowired UserMapper userMapper;

	@RequestMapping(value="/admin_professor_forgot_password", method=RequestMethod.GET)
	public String sendPw(Model model) {
		User user = new User();
		model.addAttribute("user",user);
		//System.out.println("get방식 컨트롤러 들어옴");
		return "admin/admin_professor_forgot_password";
	}

	@RequestMapping(value="/admin_professor_forgot_password", method=RequestMethod.POST)
	private String sendPw(Model model,User user) {

		User result = userMapper.login(user.getId());

		String url="";
		String alert="";
		String subject = "[성공회대학교] 임시 비밀번호 발급 안내";

		if(result==null) { //아이디 존재하지 않는 경우
			alert="-1";
			user.setId("");
			user.setEmail("");
			url = "admin/admin_professor_forgot_password"; // 비밀번호찾기 페이지로
		}
		else {
			if(!result.getEmail().equals(user.getEmail())) { // 이메일 일치하지 않으면
				alert = "0";
				url="admin/admin_professor_forgot_password"; // 비밀번호찾기 페이지로
			}
			else if(result.getEmail().equals(user.getEmail())) { // 이메일 같으면
				alert="1";

				String newPwd = FindUtil.getRandomPw(8); //8 자리수 임시비밀번호 생성

				userMapper.changePassword(user.getId(), newPwd); // 임시비밀번호로 디비 변경

				String msg=""; // message

				msg +=user.getId();
				msg +="님의 임시 비밀번호: ";
				msg +=newPwd;

				this.emailService.sendMessage(user.getEmail(), subject, msg);
				url="user/login";//로그인 페이지로
			}
		}
		model.addAttribute("alert",alert);
		return url;
	}
}
