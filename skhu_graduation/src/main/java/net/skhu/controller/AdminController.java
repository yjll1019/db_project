package net.skhu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.skhu.dto.User;

@Controller
@RequestMapping("/admin")
public class AdminController {

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
