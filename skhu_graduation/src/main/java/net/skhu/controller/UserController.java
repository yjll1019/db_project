package net.skhu.controller;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.skhu.dto.Department;
import net.skhu.dto.Student;
import net.skhu.dto.User;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.UserMapper;

@Controller
@RequestMapping("/user")
public class UserController {
		
	@Autowired UserMapper userMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired DepartmentMapper departmentMapper;
	
	//회원가입창
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String join(Model model){
		System.out.println("컨트롤러왔당");
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
		if(result==0) {
			user.setRole("학생");
			userMapper.insert(user); //user테이블 insert
			System.out.println("학과찍기"+user.getDepartmentId());
			System.out.println("유저완료");
			Student s = new Student();
			s.setUserId(user.getId());
			s.setStuSemester(user.getStuSemester());
			s.setStuClass(user.getStuClass());
			s.setTransferStudent(user.getTransferStudent());
			s.setVolunteerExemption(user.getVolunteerExemption());
			s.setDepartmentId(user.getDepartmentId());
			s.setHowToGraduate(user.getHowToGraduate());
		
			studentMapper.insert(s);//student테이블 insert
			System.out.println("학생완료");
			model.addAttribute("result", 0);
		}else {
			model.addAttribute("result", 1);
		}
		return "user/login"; //아이디가 존재할 때 팝업창에 알림 후 로그인 페이지로 이동
	}
	
}
