package net.skhu.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.skhu.dto.Department;
import net.skhu.dto.MySubject;
import net.skhu.dto.SecondMajor;
import net.skhu.dto.Student;
import net.skhu.dto.User;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.MySubjectMapper;
import net.skhu.mapper.SecondMajorMapper;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.service.OtpService;
import net.skhu.util.SecurityUtil;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired UserMapper userMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired SecondMajorMapper secondMajorMapper;
	@Autowired MySubjectMapper mySubjectMapper;
	@Autowired OtpService otpService;	 
	
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
	public String join(Model model, User user , @RequestParam("otp")String otp,RedirectAttributes redirectAttributes) throws IOException{
		int result = userMapper.findOne(user.getId());//아이디가 존재하지않으면 0 존재하면 1
		String regex="([a-zA-Z].+[0-9])|([0-9].+[a-zA-Z])"; //영문+숫자
		String emailRegex = "^[_a-zA-Z0-9]+@[a-zA-Z]+\\.[a-zA-Z]+$";
		String pinCode = otp.substring(0,4);
		String otpCode = otp.substring(4);
		
		String url="http://forest.skhu.ac.kr/Gate/OPEN/OTP/ForestOTPAuth.aspx?P1="+pinCode+"&P2="
				+otpCode+"&P3="+user.getId();
		String json = otpService.getHttpResponse(url);
		json =json.replaceAll("'", "\"");
		ObjectMapper mapper = new ObjectMapper();
	    Map<String, Object> map = new HashMap<String, Object>();
	    map = mapper.readValue(json, new TypeReference<Map<String, String>>(){});
		
			if (result == 0) {
				if (map.containsKey("STS")&&map.get("STS").equals("Y")) {
					System.out.println("오티피일치!");
				user.setRole("학생");

				if (!user.getPassword().matches(regex) || user.getPassword().length() < 8
						|| !user.getEmail().matches(emailRegex)) {
					// 비밀번호 조건(영어+숫자 8자리 이상)과 이메일 조건에 맞지 않을 때
					List<Department> departments = departmentMapper.findAll();
					model.addAttribute("departments", departments);
					model.addAttribute("user", user);
					if (!user.getEmail().matches(emailRegex)) {
						model.addAttribute("result", 3);// 이메일 조건에 맞지 않음.
					} else {
						model.addAttribute("result", 2);// 비밀번호 조건에 맞지 않음.
					}
					return "user/join";
				}

				if (user.getConfirmPassword().equals(user.getPassword())) {
					SecurityUtil su = new SecurityUtil();
					String enPassword = su.encryptBySHA256(user.getPassword()); // 암호화
					user.setPassword(enPassword);
					userMapper.insert(user); // user테이블 insert

					Student s = new Student();
					s.setUserId(user.getId());
					s.setStuSemester(user.getStuSemester());
					s.setStuClass(user.getStuClass());
					s.setTransferStudent(user.getTransferStudent());
					s.setVolunteerExemption(user.getVolunteerExemption());
					s.setDepartmentId(user.getDepartmentId());
					s.setHowToGraduate(user.getHowToGraduate());

					studentMapper.insert(s);// student테이블 insert

					if (user.getDoubleMajor() != null || user.getSubMajor() != null) {

						SecondMajor sm = new SecondMajor();
						sm.setUserId(user.getId());
						sm.setDepartmentId(user.getSecondMajorDepartmentId());
						if (user.getDoubleMajor() != null) {
							sm.setDivision("복수전공");
						} else {
							sm.setDivision("부전공");
						}
						secondMajorMapper.insert(sm);
					}

					redirectAttributes.addFlashAttribute("result", 0);
					return "redirect:login";
				} else {
					List<Department> departments = departmentMapper.findAll();
					model.addAttribute("departments", departments);
					model.addAttribute("user", user);
					model.addAttribute("result", 1); // 비밀번호와 확인비밀번호가 다름.
					return "user/join";
				}
			} else { //아이디 없고 otp불일치
				System.out.println("오티피불일치!");
				model.addAttribute("result", 4); 
				return "user/join";
			}
		}else {//아이디 존재
			redirectAttributes.addFlashAttribute("result", -1);
			return "redirect:login";
		}
	}
	
	// 로그인 화면
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "user/login";
	}

	// 로그인
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(Model model, User user, HttpSession session) {
		User result = userMapper.login(user.getId());
		String url;
		String alert;

		if(result == null) {	// 아이디가 존재하지 않는 경우
			alert = "-1";
			user.setId("");
			user.setPassword("");
			url = "user/login";
		}
		else {
			SecurityUtil su = new SecurityUtil();
			String enPassword = su.encryptBySHA256(user.getPassword());	// 암호화
			user.setPassword(enPassword);

			if(result.getPassword().equals(user.getPassword())) {	// 비밀번호가 일치하는 경우 (암호화된 비밀번호를 비교)
				alert = "1";
				session.setAttribute("user", result);
				String role = result.getRole();
				if(role.equals("학생"))
					url = "redirect:/student/stu_main";
				else if(role.equals("교수"))
					url = "redirect:/professor/professor_stu_search";
				else if(role.equals("관리자"))
					url = "redirect:/admin/admin_stu_search";
				else
					url = "redirect:/admin/superAdmin_manage";
			}
			else if(!result.getPassword().equals(user.getPassword())){	// 비밀번호가 일치하지 않는 경우
				alert = "0";
				user.setPassword("");
				url = "user/login";
			}
			else {
				alert = "";
				url = "user/login";
			}
		}
		model.addAttribute("alert", alert);
		return url;
	}

	@RequestMapping(value="logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "user/logout";
	}

	// 개인정보 수정 전 비밀번호 확인 페이지 GET
	@RequestMapping(value="/check_password",method=RequestMethod.GET)
	public String checkPassword(Model model,HttpSession session) {

		User user = (User) session.getAttribute("user");//user라는 객체를 가져옴.세션값을 가져와야 현재 접속한 아이디값을 얻을 수 있다.
		if(user.getId()==null) return "redirect:/user/login"; // 세션값에 아이디 없으면 로그인창으로
		model.addAttribute("user",user);
		return "user/check_password";
	}

	// 개인정보 수정 전 비밀번호 확인 페이지 POST
	@RequestMapping(value="/check_password",method=RequestMethod.POST)
	public String checkPassword(Model model, User user, HttpSession session) {

		User getUser = (User) session.getAttribute("user");
		User result = userMapper.login(getUser.getId());

		SecurityUtil su = new SecurityUtil();
		String enPassword = su.encryptBySHA256(user.getPassword());

		String alert="";
		String url="";

		//비밀번호 불일치
		if(!result.getPassword().equals(enPassword)) {
			alert="-1";
			url="user/check_password";
		}else if(result.getPassword().equals(enPassword)) {
			alert="1"; //비밀번호 일치
			if(getUser.getRole().equals("관리자")) {
				url="redirect:/admin/adminInfo";// 관리자 개인정보변경 페이지로
			}else if(getUser.getRole().equals("교수")) {
				url="redirect:/professor/professor_info";// 교수 개인정보변경 페이지로
			}
			else if(getUser.getRole().equals("학생")) {
				url="redirect:/student/stu_info";// 교수 개인정보변경 페이지로
			}

		}
		model.addAttribute("alert",alert);
		return url;
	}

	// 관리자/교수 학생 상세 조회
	@RequestMapping(value="detail_stu_info", method=RequestMethod.GET)
	public String admin_stu_info(Model model, HttpSession session, @RequestParam("id") String id) {
		User role = (User) session.getAttribute("user");
		User user = userMapper.findById(id);
		Student student = studentMapper.findOneWithUser(id);
		SecondMajor nullCheck = secondMajorMapper.findOneById(id);
		SecondMajor secondMajor = nullCheck == null ? new SecondMajor() : nullCheck;

		model.addAttribute("secondMajor", secondMajor);
		model.addAttribute("user", user);
		model.addAttribute("student", student);
		model.addAttribute("role", role.getRole());
		model.addAttribute("id", id);

		return "user/detail_stu_info";
	}

	// 수강 과목 조회를 위한 메소드
	@RequestMapping(value = "stu_info_subject", method = RequestMethod.GET)
	public String stu_info_subject(Model model, HttpSession session, @RequestParam("id") String id) {
		int enterYear = Integer.parseInt(id.substring(0, 4));

		Calendar c = Calendar.getInstance();
		int currentYear = c.get(Calendar.YEAR);

		List<MySubject> mySubjectlist = mySubjectMapper.findAll(id);
		List<String> majorAdmitList = mySubjectMapper.findAllForMajorAdmit(id);

		model.addAttribute("mySubjectlist", mySubjectlist);
		model.addAttribute("majorAdmitList", majorAdmitList);
		model.addAttribute("enterYear", enterYear);
		model.addAttribute("currentYear", currentYear);
		model.addAttribute("id", id);

		return "user/stu_info_subject";
	}

	@RequestMapping(value = "stu_info_subject", method = RequestMethod.POST)
	public String stu_info_subject(Model model, HttpSession session,
			@RequestParam("id") String id,
			@RequestParam("subjectListYear") Object subjectListYear,
			@RequestParam("subjectListSemester") Object subjectListSemester) {
		int enterYear = Integer.parseInt(id.substring(0, 4));
		Calendar c = Calendar.getInstance();
		int currentYear = c.get(Calendar.YEAR);

		List<MySubject> mySubjectlist;

		int year = Integer.parseInt((String) subjectListYear);
		int semester = Integer.parseInt((String) subjectListSemester);
		if (year == 0) {// 전체조회
			mySubjectlist = mySubjectMapper.findAll(id);
		} else {// 수강년도, 수강학기 조회
			mySubjectlist = mySubjectMapper.findByYearAndSemester(id, (String) subjectListYear,
					(String) subjectListSemester + "학기");
		}
		List<String> majorAdmitList = mySubjectMapper.findAllForMajorAdmit(id);
		model.addAttribute("mySubjectlist", mySubjectlist);
		model.addAttribute("majorAdmitList", majorAdmitList);
		model.addAttribute("enterYear", enterYear);
		model.addAttribute("currentYear", currentYear);
		model.addAttribute("year", year);
		model.addAttribute("semester", semester);

		return "user/stu_info_subject";
	}

	@RequestMapping(value = "detail_stu_info", method = RequestMethod.POST)
	public String stu_subject_list(Model model, HttpSession session, @RequestParam("id") String id
			/*, @RequestParam("subjectListYear") Object subjectListYear,
				@RequestParam("subjectListSemester") Object subjectListSemester*/) {
		User role = (User) session.getAttribute("user");
		User user = userMapper.findById(id);
		Student student = studentMapper.findOneWithUser(id);
		SecondMajor nullCheck = secondMajorMapper.findOneById(id);
		SecondMajor secondMajor = nullCheck == null ? new SecondMajor() : nullCheck;

		model.addAttribute("role", role.getRole());
		model.addAttribute("secondMajor", secondMajor);
		model.addAttribute("user", user);
		model.addAttribute("student", student);
		/*
			int enterYear = Integer.parseInt(id.substring(0, 4));
			Calendar c = Calendar.getInstance();
			int currentYear = c.get(Calendar.YEAR);

			List<MySubject> mySubjectlist;

			int year = Integer.parseInt((String) subjectListYear);
			int semester = Integer.parseInt((String) subjectListSemester);
			System.out.println(subjectListYear + " " + subjectListSemester);
			if (year == 0) {// 전체조회
				mySubjectlist = mySubjectMapper.findAll(id);
			} else {// 수강년도, 수강학기 조회
				mySubjectlist = mySubjectMapper.findByYearAndSemester(id, (String) subjectListYear,
						(String) subjectListSemester + "%");
			}
			model.addAttribute("mySubjectlist", mySubjectlist);
			model.addAttribute("enterYear", enterYear);
			model.addAttribute("currentYear", currentYear);
			model.addAttribute("year", year);
			model.addAttribute("semester", semester);
			model.addAttribute("id", id);
		 */
		return "user/detail_stu_info";
	}

}
