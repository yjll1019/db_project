package net.skhu.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.UserMapper;

@Controller
@RequestMapping("/professor")
public class ProfessorController {

	@Autowired UserMapper userMapper;
	@Autowired StudentMapper studentMapper;

	static String[] grade= {"1", "2", "3", "4"};


	@RequestMapping("professor_stu_search")
	public String list1 (Model model) {
		model.addAttribute("students", studentMapper.findAllWithUser());
		return "professor/professor_stu_search";
	}






}
