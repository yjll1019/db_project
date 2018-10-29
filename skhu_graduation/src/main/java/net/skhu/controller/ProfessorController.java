package net.skhu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.skhu.dto.User;

@Controller
@RequestMapping("/professor")
public class ProfessorController {

	@RequestMapping(value="professor_stu_search", method=RequestMethod.GET)
	public String login(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "professor/professor_stu_search";
	}
}
