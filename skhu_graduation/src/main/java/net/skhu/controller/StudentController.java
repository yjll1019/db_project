package net.skhu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.skhu.dto.MySubject;
import net.skhu.dto.User;
import net.skhu.mapper.MySubjectMapper;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.util.SecurityUtil;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired UserMapper userMapper;
	@Autowired MySubjectMapper mySubjectMapper;
	@Autowired StudentMapper studentMapper;
	
	@RequestMapping(value="stu_main", method=RequestMethod.GET)
	public String main(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "student/stu_main";
	}

	// 학생 비밀번호 찾기를 위한 OTP검사
	@RequestMapping(value="stu_forgot_password", method=RequestMethod.GET)
	public String stu_forgot_password(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "student/stu_forgot_password";
	}
	
	@RequestMapping(value = "stu_forgot_password", method = RequestMethod.POST)
	public String stu_forgot_password(Model model, User user, RedirectAttributes redirectAttributes) {
		boolean result = true;

		String id = user.getId();
		
		int resultId = userMapper.findOne(id);// 아이디가 존재하지않으면 0 존재하면 1

		if (resultId == 1) { // 아이디가 존재하면
			if (result) { // 학생 인증(OTP) 성공 -> 학생이 직접 비번을 바꿀 수 있도록 
				redirectAttributes.addAttribute("id", id);
				return "redirect:change_password";
			} else { // 학생 인증(OTP) 실패
				model.addAttribute("result", -1);
				return "student/stu_forgot_password";
			}
		} else { // 아이디가 존재하지 않으면
			model.addAttribute("result", -2);
			return "student/stu_forgot_password";
		}
	}
	
	//학생 비밀번호 변경
	@RequestMapping(value="change_password", method=RequestMethod.GET)
	public String change_password(Model model, @RequestParam("id") String id) {
		User user = new User();
		user.setId(id);
		model.addAttribute("user", user);
		return "student/change_password";
	}
	
	@RequestMapping(value="change_password", method=RequestMethod.POST)
	public String change_password(Model model, User user) {
		String regex="([a-zA-Z].+[0-9])|([0-9].+[a-zA-Z])"; //영문+숫자

		if(user.getPassword().equals(user.getConfirmPassword())) {
			if(!user.getPassword().matches(regex) || user.getPassword().length()<8) {
				user.setPassword("");
				user.setConfirmPassword("");
				model.addAttribute("user", user);
				model.addAttribute("result", -2); //비밀번호가 조건에 맞지 않을 때
			}else {
				SecurityUtil su = new SecurityUtil();
				String enPassword = su.encryptBySHA256(user.getPassword());	// 암호화
				user.setPassword(enPassword);
				userMapper.changePassword(user.getId(), user.getPassword());
				model.addAttribute("result", 1);
			}
		}else {
			model.addAttribute("result", -1); //비밀번호와 확인 비밀번호가 일치하지 않을 때
		}
		return "student/change_password";
	}

	
	//수강 과목 조회를 위한 메소드
	@RequestMapping(value="stu_subject_list", method=RequestMethod.GET)
	public String stu_subject_list(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<MySubject> mySubjectlist = mySubjectMapper.findAll(user.getId());
		model.addAttribute("mySubjectlist", mySubjectlist);
		return "student/stu_subject_list";
	}
	
	@RequestMapping(value="stu_subject_list", method=RequestMethod.POST)
	public String stu_subject_list(Model model, HttpSession session, @RequestParam("subjectListId") int subjectListId) {
		User user = (User) session.getAttribute("user");
		List<MySubject> mySubjectlist;
		System.out.println("subjectListId는"+subjectListId);
		if(subjectListId==0) {//전체조회
			mySubjectlist = mySubjectMapper.findAll(user.getId());
		}else if(subjectListId==1){//전공필수
			mySubjectlist = mySubjectMapper.findByMajorEssential(user.getId());
		}else if(subjectListId==2){//전공선택
			mySubjectlist = mySubjectMapper.findByMajorSelect(user.getId());
		}else if(subjectListId==3){//교양필수
			mySubjectlist = mySubjectMapper.findByRefinementEssential(user.getId());
		}else {//교양선택
			mySubjectlist = mySubjectMapper.findByRefinementSelect(user.getId());
		}
		model.addAttribute("mySubjectlist", mySubjectlist);
		model.addAttribute("subjectListId", subjectListId);
		return "student/stu_subject_list";
	}
	
	//professor_info GET
		@RequestMapping(value="stu_info",method=RequestMethod.GET)
		public String stu_info(Model model,HttpSession session) {

			User user = (User) session.getAttribute("user");//user라는 객체를 가져옴.세션값을 가져와야 현재 접속한 아이디값을 얻을 수 있다.
			if(user.getId()==null) return "redirect:/user/login"; // 세션값에 아이디 없으면 로그인창으로
			model.addAttribute("user",user);

			return "student/stu_info";
		}
		// professor_info POST
			@RequestMapping(value="stu_info",method=RequestMethod.POST)
			public String stu_info(Model model,User user, HttpSession session ) {

				User userGetId = (User) session.getAttribute("user");
				user.setId(userGetId.getId());
				String alert="";
				String regex="([a-zA-Z].+[0-9])|([0-9].+[a-zA-Z])"; //영문+숫자

				//비밀번호 조건에 맞지 않을 떄
				if(!user.getPassword().matches(regex) || user.getPassword().length()<8) {
					alert="-1";
					model.addAttribute("user",user);
					model.addAttribute("alert",alert);
					return "student/stu_info";

				}
				// 비밀번호와 확인비밀번호가 다를 때
				if(!user.getConfirmPassword().equals(user.getPassword())) {
					alert="-2";
					model.addAttribute("user",user);
					model.addAttribute("alert",alert);
					return "student/stu_info";
				}

				SecurityUtil su = new SecurityUtil();
				String enPssword = su.encryptBySHA256(user.getPassword());// 암호화
				user.setPassword(enPssword);




				return "redirect:/student/stu_main"; //학생 조회 페이지로
			}

}
