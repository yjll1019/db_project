package net.skhu.controller;

import java.util.List;

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
		String reString;
		int result = userMapper.findOne(user.getId());//아이디가 존재하지않으면 0 존재하면 1
		if(result==0) {
			user.setRole("학생");

			if(user.getConfirmPassword().equals(user.getPassword())) {
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
				reString = "user/login";
			}else {
				List<Department> departments = departmentMapper.findAll();
				model.addAttribute("departments", departments);
				model.addAttribute("user", user);
				model.addAttribute("result", 1); //비밀번호와 확인비밀번호가 다름.
				reString = "user/join";
			}
		}else { //아이디가 존재할 때 > 로그인창으로 
			model.addAttribute("result", -1);
			reString = "user/login";
		}
		return reString; 
	}
	
}
