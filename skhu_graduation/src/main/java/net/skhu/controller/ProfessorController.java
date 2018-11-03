package net.skhu.controller;


import java.util.List;

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
}
			

