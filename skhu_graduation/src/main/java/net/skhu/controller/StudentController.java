package net.skhu.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.skhu.dto.Department;
import net.skhu.dto.GraduationInput;
import net.skhu.dto.GraduationText;
import net.skhu.dto.MySubject;
import net.skhu.dto.ReplaceSubject;
import net.skhu.dto.RequiredSubject;
import net.skhu.dto.SecondMajor;
import net.skhu.dto.Student;
import net.skhu.dto.User;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.GraduationMapper;
import net.skhu.mapper.MySubjectMapper;
import net.skhu.mapper.ProfessorMapper;
import net.skhu.mapper.ReplaceSubjectMapper;
import net.skhu.mapper.RequiredSubjectMapper;
import net.skhu.mapper.SecondMajorMapper;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.model.Pagination;
import net.skhu.service.ExcelService;
import net.skhu.service.OtpService;
import net.skhu.service.ReplaceSubjectService;
import net.skhu.util.SecurityUtil;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	UserMapper userMapper;
	@Autowired
	MySubjectMapper mySubjectMapper;
	@Autowired
	StudentMapper studentMapper;
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	SecondMajorMapper secondMajorMapper;
	@Autowired
	GraduationMapper graduationMapper;
	@Autowired ExcelService excelService;
	@Autowired ReplaceSubjectService replaceService;
	@Autowired ProfessorMapper professorMapper;
	@Autowired RequiredSubjectMapper requiredSubjectMapper;
	@Autowired ReplaceSubjectMapper replaceSubjectMapper;
	@Autowired OtpService otpService;

	@RequestMapping(value = "stu_main", method = RequestMethod.GET)
	public String main(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");//user라는 객체를 가져옴.세션값을 가져와야 현재 접속한 아이디값을 얻을 수 있다.

		if(mySubjectMapper.findAllCount(user.getId()) <= 0) {
			return "redirect:stu_noData";
		}

		if(secondMajorMapper.findOneById(user.getId())==null) {//부/복수전공 없을떄
			Student student = studentMapper.findOneWithUser(user.getId());
			Student professor = studentMapper.findOneWithProfessor(student.getUserId());
			student.setpName(professorMapper.findName(professor.getpId()));

			List<MySubject> mySubjectMajor = mySubjectMapper.findMajor(user.getId());
			List<MySubject> mySubjectCultural = mySubjectMapper.findCultural(user.getId());

			int service = mySubjectMapper.findService(user.getId()); //사회봉사
			int pray = mySubjectMapper.findPray(user.getId()); //채플
			int major = 0;//전공
			int cultural = 0;//교필
			int value=0;//부/복수전공

			//계산
			for(int i=0; i<mySubjectMajor.size();++i) {
				major+=Integer.parseInt(mySubjectMajor.get(i).getCredit());
			}
			for(int i=0; i<mySubjectCultural.size(); ++i) {
				cultural+=Integer.parseInt(mySubjectCultural.get(i).getCredit());
			}

			student.setMajor(major);
			student.setCultural(cultural);
			student.setPray(pray);
			student.setService(service);

			model.addAttribute("user", user);
			model.addAttribute("student",student);

			//졸업 시뮬레이션
			String year=user.getId().substring(0,4); //입학년도
			System.out.println("년도"+year);
			String transferStudent = (studentMapper.stuInfo(user.getId())).getTransferStudent();//편입생

			String howToGraduate =(studentMapper.stuInfo(user.getId())).getHowToGraduate();//전공기초 or 전공심화

			if(year.equals("2018")) {
				year="2017";
			}
			if(transferStudent.equals("0")) {//편입생 아님.
				GraduationInput graduation = new GraduationInput();
				graduation.setCredit(graduationMapper.findCredit("0","0", year, (studentMapper.stuInfo(user.getId())).getDepartmentId()));
				if(howToGraduate.equals("전공심화")) {
					graduation.setCredit("75");
				}
				model.addAttribute("graduation",graduation);
			}
			if(transferStudent.equals("1")) {// 편입생임.

				GraduationInput graduation = new GraduationInput();
				graduation.setCredit(graduationMapper.findCredit("3","0", year, (studentMapper.stuInfo(user.getId())).getDepartmentId()));
				if(howToGraduate.equals("전공심화")) {
					graduation.setCredit("75");
				}
				model.addAttribute("graduation",graduation);

			}

		}else if(secondMajorMapper.findOneById(user.getId())!=null) {
			Student student = studentMapper.findOneWithUser(user.getId());
			Student professor = studentMapper.findOneWithProfessor(student.getUserId());
			student.setpName(professorMapper.findName(professor.getpId()));
			student.setSecondMajorName(secondMajorMapper.findSecondMajor(user.getId()));

			List<MySubject> mySubjectMajor = mySubjectMapper.findMajor(user.getId());
			List<MySubject> mySubjectCultural = mySubjectMapper.findCultural(user.getId());
			List<MySubject> mySubjectSubMajor = mySubjectMapper.findSubMajor(user.getId(),secondMajorMapper.findGraduation(user.getId()).getSeDepartmentId());

			int service = mySubjectMapper.findService(user.getId()); //사회봉사
			int pray = mySubjectMapper.findPray(user.getId()); //채플
			int major = 0;//전공
			int cultural = 0;//교필
			int value=0;//부/복수전공

			//계산
			for(int i=0; i<mySubjectMajor.size();++i) {
				major+=Integer.parseInt(mySubjectMajor.get(i).getCredit());
			}
			for(int i=0; i<mySubjectCultural.size(); ++i) {
				cultural+=Integer.parseInt(mySubjectCultural.get(i).getCredit());
			}
			for(int i=0; i<mySubjectSubMajor.size(); ++i) {
				value+=Integer.parseInt(mySubjectSubMajor.get(i).getCredit());
			}

			student.setMajor(major);
			student.setCultural(cultural);
			student.setPray(pray);
			student.setService(service);
			student.setValue(value);

			//System.out.println(student.toString());
			model.addAttribute("user", user);
			model.addAttribute("student",student);

			//졸업 시뮬레이션
			String year=secondMajorMapper.findYear(user.getId()); //입학년도
			String SedepartmentId=(secondMajorMapper.findGraduation(user.getId())).getSeDepartmentId();//부/복수전공의 학과
			String transferStudent = (studentMapper.stuInfo(user.getId())).getTransferStudent();//편입생
			String division=(secondMajorMapper.findGraduation(user.getId())).getSeDivision();//부전공 or 복수전공
			String howToGraduate =(studentMapper.stuInfo(user.getId())).getHowToGraduate();//전공기초 or 전공심화

			if(year.equals("2018")) {
				year="2017";
			}
			if((secondMajorMapper.findAllCount(user.getId())==0) && transferStudent.equals("0")) {//전공만인 경우. 편입생 아님.
				GraduationInput graduation = new GraduationInput();
				graduation.setDivision(division);
				graduation.setCredit(graduationMapper.findCredit("0","0", year, (studentMapper.stuInfo(user.getId())).getDepartmentId()));
				if(howToGraduate.equals("전공심화")) {
					graduation.setCredit("75");
				}
				model.addAttribute("graduation",graduation);
			}
			if((secondMajorMapper.findAllCount(user.getId())==0) && transferStudent.equals("1")) {//전공만인 경우. 편입생임.

				GraduationInput graduation = new GraduationInput();
				graduation.setDivision(division);
				graduation.setCredit(graduationMapper.findCredit("3","0", year, (studentMapper.stuInfo(user.getId())).getDepartmentId()));
				if(howToGraduate.equals("전공심화")) {
					graduation.setCredit("75");
				}
				model.addAttribute("graduation",graduation);

			}
			if((secondMajorMapper.findAllCount(user.getId())>0)) {//부/복수전공하는 경우.

				GraduationInput graduation = new GraduationInput();
				if(division.equals("복수전공")) {

					graduation.setDivision(division);
					graduation.setCredit(graduationMapper.findCredit("1","0", year, (studentMapper.stuInfo(user.getId())).getDepartmentId()));//전공그래프
					graduation.setSeCredit(graduationMapper.findCredit("4","0", year, SedepartmentId));//복수전공 그래프
					if(howToGraduate.equals("전공심화")) {
						graduation.setCredit("75");
					}
					model.addAttribute("graduation",graduation);
					model.addAttribute("secredit",graduation.getSeCredit());

				}
				if(division.equals("부전공")) {

					graduation.setDivision(division);
					graduation.setCredit(graduationMapper.findCredit("2","0", year, (studentMapper.stuInfo(user.getId())).getDepartmentId()));//전공그래프
					graduation.setSeCredit(graduationMapper.findCredit("5","0", year, SedepartmentId));//부전공 그래프

					if(howToGraduate.equals("전공심화")) {
						graduation.setCredit("75");
					}
					model.addAttribute("graduation",graduation);
					model.addAttribute("secredit",graduation.getSeCredit());
				}
			}

		}

		//필수과목 table을 위한 코드
		String admissionYear = user.getId().substring(0,4);//년도

		List<String> list[] = new ArrayList[9];

		for(int i=0; i<list.length; ++i) {
			list[i] = new ArrayList<String>();
		}
		int z = 0;
		for(int i=1; i<=4; ++i) {//학년
			for(int j=1; j<=2; ++j) {//학기
				list[z++] = requiredSubjectMapper.findByConditions(admissionYear, String.valueOf(i), String.valueOf(j));
			}
		}
		
		if(user.getId().substring(0,4).equals("2018")) {
			List<String> freshManList = requiredSubjectMapper.findByConditionsForFreshman("2018", String.valueOf(5), String.valueOf(1)); //교양 필수 과목
			List<String> subjectNameList = new ArrayList<String>();
			for(int i=0; i<freshManList.size(); ++i) {
				subjectNameList.add(requiredSubjectMapper.findBySubjectName(freshManList.get(i)));
			}
			list[z++] = subjectNameList;
		}else {
			list[z++] = requiredSubjectMapper.findByConditions(admissionYear, String.valueOf(5), String.valueOf(1)); //교양 필수 과목
		}
		for(int i=1; i<=list.length; ++i) {
			model.addAttribute("list"+i, list[i-1]);
		}

		List<String> requiredMySubject = mySubjectMapper.requiredMySubject(user.getId());//필수과목 중 수강한 과목 리스트
		model.addAttribute("requiredMySubject", requiredMySubject);
		model.addAttribute("admissionYear", admissionYear);

		return "student/stu_main";
	}

	//stu_main.jsp에서 데이터 입력 후 학점 조회 눌렀을 때
	@RequestMapping(value = "stu_main", method = RequestMethod.POST)
	public String main(Model model, RedirectAttributes redirectAttributes, @RequestParam("beforeSemester") String beforeSemester, @RequestParam("saveCredit") String saveCredit,
			@RequestParam("allCredit") String allCredit, @RequestParam("goalCredit") String goalCredit) {
		User user = new User();
		model.addAttribute("user", user);

		Map<String, Integer> map = new LinkedHashMap<String,Integer>();
		String s;
		int x = Integer.parseInt(saveCredit);
		int i = Integer.parseInt(beforeSemester) + 1;
		int j =1;
		while(x != 0) {
			int value = 0;
			if(x-19 > 0) {
				value = 19;
				x -= 19;
			}else {
				value = x;
				x -= x;

				if(i % 2 == 1) {
					s = (i + 1)/2 + "학년1학기";
				}else {
					s = (i)/2 + "학년2학기";
				}
				map.put(s, value);//(학기, 그 학기에 들어야하는 학점)
				break;
			}
			if(i % 2 == 1) {
				s = (i + 1)/2 + "학년1학기";
			}else {
				s = (i)/2 + "학년2학기";
			}
			i++;
			j++;
			map.put(s, value);//(학기, 그 학기에 들어야하는 학점)
		}
		double score = Math.round((((Double.parseDouble(goalCredit)*(map.size()+1))-Double.parseDouble(allCredit))/map.size())*10)/10.0; //소수 첫째짜리까지 출력
		if(score>4.5) { //학기당 취득해야하는 학점이 4.5이상일 때 받을 수 있는 최고학점을 보여주기 위해
			score = 4.5;
			String b = String.valueOf(Math.round(((4.5*j)+Double.parseDouble(allCredit))/(j+1)*10)/10.0);
			goalCredit = b;
		}
		redirectAttributes.addFlashAttribute("map", map);//학년, 학점
		redirectAttributes.addAttribute("score", score);//취득해야하는 학점
		redirectAttributes.addAttribute("goalCredit", goalCredit);//목표 학점

		return "redirect:/student/stu_goalCredit";
	}

	@RequestMapping("stu_noData")
	public String stu_noData() {
		return "student/stu_noData";
	}

	//목표학점 결과 보여주는 페이지
	@RequestMapping(value = "stu_goalCredit", method = RequestMethod.GET)
	public String stu_goalCredit(Model model, HttpServletRequest request,@RequestParam("score") double score, @RequestParam("goalCredit") String goalCredit) {
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		model.addAttribute("map", flashMap.get("map"));
		model.addAttribute("score", score);
		model.addAttribute("goalCredit", goalCredit);
		return "student/stu_goalCredit";
	}

	// 학생 비밀번호 찾기를 위한 OTP검사
	@RequestMapping(value = "stu_forgot_password", method = RequestMethod.GET)
	public String stu_forgot_password(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "student/stu_forgot_password";
	}

	@RequestMapping(value = "stu_forgot_password", method = RequestMethod.POST)
	public String stu_forgot_password(Model model, User user, @RequestParam("otp")String otp, RedirectAttributes redirectAttributes) throws JsonParseException, JsonMappingException, IOException {
		boolean result = true;

		String pinCode = otp.substring(0,4);
		String otpCode = otp.substring(4);

		String url="http://forest.skhu.ac.kr/Gate/OPEN/OTP/ForestOTPAuth.aspx?P1="+pinCode+"&P2="
				+otpCode+"&P3="+user.getId();
		String json = otpService.getHttpResponse(url);
		json =json.replaceAll("'", "\"");
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = new HashMap<String, Object>();
		map = mapper.readValue(json, new TypeReference<Map<String, String>>(){});

		String id = user.getId();

		int resultId = userMapper.findOne(id);// 아이디가 존재하지않으면 0 존재하면 1

		if (resultId == 1) { // 아이디가 존재하면
			if (map.containsKey("STS")&&map.get("STS").equals("Y")) {
				System.out.println("오티피일치!"); // 학생 인증(OTP) 성공 -> 학생이 직접 비번을 바꿀 수 있도록
				redirectAttributes.addAttribute("id", id);
				return "redirect:change_password";
			} else { // 학생 인증(OTP) 실패
				System.out.println("오티피불일치!");
				model.addAttribute("result", -1);
				return "student/stu_forgot_password";
			}
		} else { // 아이디가 존재하지 않으면
			model.addAttribute("result", -2);
			return "student/stu_forgot_password";
		}
	}

	// 학생 비밀번호 변경
	@RequestMapping(value = "change_password", method = RequestMethod.GET)
	public String change_password(Model model, @RequestParam("id") String id) {
		User user = new User();
		user.setId(id);
		model.addAttribute("user", user);
		return "student/change_password";
	}

	@RequestMapping(value = "change_password", method = RequestMethod.POST)
	public String change_password(Model model, User user) {
		String regex = "([a-zA-Z].+[0-9])|([0-9].+[a-zA-Z])"; // 영문+숫자

		if (user.getPassword().equals(user.getConfirmPassword())) {
			if (!user.getPassword().matches(regex) || user.getPassword().length() < 8) {
				user.setPassword("");
				user.setConfirmPassword("");
				model.addAttribute("user", user);
				model.addAttribute("result", -2); // 비밀번호가 조건에 맞지 않을 때
			} else {
				SecurityUtil su = new SecurityUtil();
				String enPassword = su.encryptBySHA256(user.getPassword()); // 암호화
				user.setPassword(enPassword);
				userMapper.changePassword(user.getId(), user.getPassword());
				model.addAttribute("result", 1);
			}
		} else {
			model.addAttribute("result", -1); // 비밀번호와 확인 비밀번호가 일치하지 않을 때
		}
		return "student/change_password";
	}

	// 수강 과목 조회를 위한 메소드
	@RequestMapping(value = "stu_subject_list", method = RequestMethod.GET)
	public String stu_subject_list(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");

		int enterYear = Integer.parseInt(user.getId().substring(0, 4));

		Calendar c = Calendar.getInstance();
		int currentYear = c.get(Calendar.YEAR);

		List<MySubject> mySubjectlist = mySubjectMapper.findAll(user.getId());
		List<String> majorAdmitList = mySubjectMapper.findAllForMajorAdmit(user.getId());

		model.addAttribute("mySubjectlist", mySubjectlist);
		model.addAttribute("majorAdmitList", majorAdmitList);
		model.addAttribute("enterYear", enterYear);
		model.addAttribute("currentYear", currentYear);

		return "student/stu_subject_list";
	}

	@RequestMapping(value = "stu_subject_list", method = RequestMethod.POST)
	public String stu_subject_list(Model model, HttpSession session,
			@RequestParam("subjectListYear") Object subjectListYear,
			@RequestParam("subjectListSemester") Object subjectListSemester) {
		User user = (User) session.getAttribute("user");
		int enterYear = Integer.parseInt(user.getId().substring(0, 4));
		Calendar c = Calendar.getInstance();
		int currentYear = c.get(Calendar.YEAR);

		List<MySubject> mySubjectlist;

		int year = Integer.parseInt((String) subjectListYear);
		String semester = ((String) subjectListSemester);
		if (year == 0) {// 전체조회
			mySubjectlist = mySubjectMapper.findAll(user.getId());
		} else {// 수강년도, 수강학기 조회
			mySubjectlist = mySubjectMapper.findByYearAndSemester(user.getId(), (String) subjectListYear,
					(String) subjectListSemester);
		}
		List<String> majorAdmitList = mySubjectMapper.findAllForMajorAdmit(user.getId());
		model.addAttribute("mySubjectlist", mySubjectlist);
		model.addAttribute("majorAdmitList", majorAdmitList);
		model.addAttribute("enterYear", enterYear);
		model.addAttribute("currentYear", currentYear);
		model.addAttribute("year", year);
		model.addAttribute("semester", semester);

		return "student/stu_subject_list";
	}

	// stu_info GET
	@RequestMapping("stu_info")
	public String stu_info(Model model, HttpSession session) {
		User getUser = (User) session.getAttribute("user");

		User user = userMapper.findById(getUser.getId());

		model.addAttribute("user", user);

		Student student = studentMapper.findOneWithUser(getUser.getId());
		model.addAttribute("student", student);

		SecondMajor nullCheck = secondMajorMapper.findOneForInfo(getUser.getId());
		SecondMajor secondMajor = nullCheck == null ? new SecondMajor() : nullCheck;
		model.addAttribute("secondMajor", secondMajor);
		//System.out.println(secondMajor.toString());

		return "student/stu_info";
	}

	// stu_info POST
	@Transactional
	@RequestMapping(value = "stu_info", method = RequestMethod.POST)
	public String stu_info(Model model, User user, Student student, SecondMajor secondMajor,
			HttpSession session) {

		User userGetId = (User) session.getAttribute("user");
		user.setId(userGetId.getId());
		user.setRole(userGetId.getRole());
		System.out.println(user.toString());

		student.setUserId(user.getId());
		student.setStuSemester(user.getStuSemester());
		student.setStuClass(user.getStuClass());
		student.setTransferStudent(user.getTransferStudent() != null ? "1" : "0");
		student.setVolunteerExemption(user.getVolunteerExemption() != null ? "1" : "0");
		student.setDepartmentId(user.getDepartmentId());
		student.setHowToGraduate(user.getHowToGraduate());
		System.out.println(student.toString());

		secondMajor.setUserId(user.getId());
		secondMajor.setDivision(user.getDivision());
		secondMajor.setDepartmentId(user.getSecondMajorDepartmentId());
		System.out.println(secondMajor.toString());

		String alert = "";
		String regex = "([a-zA-Z].+[0-9])|([0-9].+[a-zA-Z])"; // 영문+숫자

		if(user.getPassword().length() > 0) {

			// 비밀번호 조건에 맞지 않을 떄
			if (!user.getPassword().matches(regex) || user.getPassword().length() < 8) {
				alert = "-1";
				model.addAttribute("user",user);
				model.addAttribute("student",student);
				model.addAttribute("alert", alert);
				return "student/stu_info";

			}
			// 비밀번호와 확인비밀번호가 다를 때
			if (!user.getConfirmPassword().equals(user.getPassword())) {
				alert = "-2";
				model.addAttribute("user",user);
				model.addAttribute("student",student);
				model.addAttribute("secondMajor",secondMajor);
				model.addAttribute("alert", alert);
				return "student/stu_info";
			}

			SecurityUtil su = new SecurityUtil();
			String enPssword = su.encryptBySHA256(user.getPassword());// 암호화
			user.setPassword(enPssword);

		} else {
			user.setPassword(userGetId.getPassword());
		}

		userMapper.updateStudent(user); //user 테이블 update
		studentMapper.updateForInfo(student); //student 테이블 update

		SecondMajor isEmpty = secondMajorMapper.findOneById(user.getId());
		System.out.println(isEmpty == null ? "null" : "not null");
		String nullCheck = secondMajor.getDivision();
		System.out.println(nullCheck);

		if (nullCheck != null) {
			if(secondMajor.getDepartmentId().equals("0")) {
				alert = "-3"; // 부복수전공 division 값은 있지만 departmentId 값이 없는 경우
				model.addAttribute("alert", alert);
				return "student/stu_info";
			} else {
				secondMajorMapper.insert(secondMajor);
			}
		} else if(isEmpty != null && nullCheck == null) {
			secondMajorMapper.deleteById(user.getId());
		}

		session.removeAttribute("user");
		session.setAttribute("user", user);

		return "redirect:stu_main"; // 학생 조회 페이지로
	}

	// 학생 전공인정
	@RequestMapping(value = "stu_major_admit", method = RequestMethod.GET)
	public String stu_major_admit(Model model, HttpSession session, @RequestParam("subjectCode") String subjectCode) {
		User user = (User) session.getAttribute("user");
		MySubject mySubject = mySubjectMapper.findByOneSubject(user.getId(), subjectCode);
		model.addAttribute("mySubject", mySubject);
		String completionDivision;
		if (mySubject.getCompletionDivision().contains("교")) {
			completionDivision = "교선";
			model.addAttribute("completionDivision", completionDivision);
		} else {
			completionDivision = "전선";
			model.addAttribute("completionDivision", completionDivision);
		}
		return "student/stu_major_admit";
	}

	@RequestMapping(value = "stu_major_admit", method = RequestMethod.POST) // completionDivision 0이면 교선 1이면 전선
	public String stu_major_admit(Model model, HttpSession session, RedirectAttributes redirectAttributes,
			MySubject mySubject, @RequestParam("completionDivision") int completionDivision) {

		User user = (User) session.getAttribute("user");

		mySubject.setUserId(user.getId());

		if (completionDivision == 0) {// 교선으로 바꿀 때
			mySubject.setCompletionDivision("교선");
			mySubject.setChangeComplete("전선");// 원래 있던 값을 저장
			redirectAttributes.addAttribute("result", "0");
		} else {// 전선으로 바꿀 때
			mySubject.setCompletionDivision("전선");
			mySubject.setChangeComplete("교선");// 원래 있던 값을 저장
			redirectAttributes.addAttribute("result", "1");
		}
		mySubjectMapper.majorAdmit(mySubject);
		redirectAttributes.addAttribute("subjectCode", mySubject.getSubjectCode());
		redirectAttributes.addAttribute("completionDivision", mySubject.getCompletionDivision());
		return "redirect:/student/stu_major_admit";
	}

	// 수강한 목록 엑셀 업로드
	@RequestMapping(value="mySubject_upload", method=RequestMethod.POST)
	public String replace_upload(Model model, @RequestParam("file") MultipartFile file,
			HttpSession session) throws Exception{
		User user = (User) session.getAttribute("user");

		if(!file.isEmpty()) {
			List<MySubject> mySubjects = excelService.getMySubjectList(file.getInputStream(), user.getId());
			mySubjectMapper.deleteById(user.getId());
			mySubjectMapper.insert(mySubjects);
			return "redirect:stu_subject_list";
		} else {
			return "redirect:stu_info?r=-1";
		}
	}

	//대체과목 재수강 get
	@RequestMapping(value = "stu_replace_repeat", method = RequestMethod.GET)
	public String stu_replace_repeat(Model model, HttpSession session, @RequestParam("subjectCode") String subjectCode) {
		User user = (User) session.getAttribute("user");


		MySubject mySubject = mySubjectMapper.findByOneSubject(user.getId(), subjectCode); //바꿀 과목 정보를 가져옴
		model.addAttribute("mySubject", mySubject);

		List<ReplaceSubject> list = replaceSubjectMapper.findReplaceSub();

		model.addAttribute("list", list);
		return "student/stu_replace_repeat";
	}


	//대체과목 재수강  post
	@RequestMapping(value = "stu_replace_repeat", method = RequestMethod.POST) // completionDivision 0이면 교선 1이면 전선
	public String stu_replace_repeat(Model model, HttpSession session, RedirectAttributes redirectAttributes,
			MySubject mySubject, @RequestParam("changeSubjectCode") String changeSubjectCode) {

		User user = (User) session.getAttribute("user");

		mySubject.setUserId(user.getId());
		mySubject = mySubjectMapper.findByOneSubject(user.getId(), mySubject.getSubjectCode()); //바꾸기 전 과목
		MySubject changeSubject = mySubjectMapper.findByOneSubject(user.getId(), changeSubjectCode); //바꿀 과목
		String score=changeSubject.getScore();

		mySubjectMapper.changeScore(mySubject.getSubjectCode(), score, user.getId());
		mySubjectMapper.deleteSubject(user.getId(), changeSubjectCode);




		redirectAttributes.addAttribute("result", "0");
		return "redirect:/student/stu_subject_list";
	}

	// 대체과목목록 조회 페이지
	@RequestMapping(value="stu_replace_list", method=RequestMethod.GET)
	public String stu_replace_list(Model model,Pagination pagination) {//,HttpSession session
		//User user = (User) session.getAttribute("user");//user라는 객체를 가져옴.세션값을 가져와야 현재 접속한 아이디값을 얻을 수 있다.
		//System.out.println(user.getRole());
		//if(user.getId()==null) return "redirect:/user/login"; // 세션값에 아이디 없으면 로그인창으로
		//if(!(user.getRole().equals("학생"))) return "redirect:/user/login"; // 관리자 아니면 로그인창으로

		model.addAttribute("replace",replaceService.findByType(pagination));
		model.addAttribute("searchBy",replaceService.getSerachByOptions());
		return "student/stu_replace_list";
	}

	//학생 졸업요건 조회
	@RequestMapping(value = "stu_allSearch", method = RequestMethod.GET)
	public String stu_allSearch(Model model, HttpSession session)
	{
		User user = (User) session.getAttribute("user");

		User users = userMapper.findById(user.getId());
		model.addAttribute("users", users);

		Student student = studentMapper.findOneWithUser(user.getId());
		model.addAttribute("student", student);


		List<Department> departments = departmentMapper.findAll();
		model.addAttribute("departments", departments);
		String departmentId = student.getDepartmentId();


		Department department = departmentMapper.findOne(student.getDepartmentId());
		model.addAttribute("department", department);

		GraduationText list0 = graduationMapper.findByDepartmentId(departmentId, "0");
		model.addAttribute("list0", list0);

		GraduationText list1 = graduationMapper.findByDepartmentId(departmentId, "1");
		model.addAttribute("list1", list1);

		GraduationText list2 = graduationMapper.findByDepartmentId(departmentId, "2");
		model.addAttribute("list2", list2);

		GraduationText list3 = graduationMapper.findByDepartmentId(departmentId, "3");
		model.addAttribute("list3", list3);

		GraduationText list4 = graduationMapper.findByDepartmentId(departmentId, "4");
		model.addAttribute("list4", list4);

		GraduationText list5 = graduationMapper.findByDepartmentId(departmentId, "5");
		model.addAttribute("list5", list5);

		return "student/stu_allSearch";
	}

	@RequestMapping(value = "stu_allSearch", method = RequestMethod.POST)
	public String stu_allSearch(Model model, HttpSession session,  @RequestParam("departmentId") String departmentId)
	{
		User user = (User) session.getAttribute("user");

		User users = userMapper.findById(user.getId());
		model.addAttribute("users", users);

		Student student = studentMapper.findOneWithUser(user.getId());
		student.setDepartmentId(departmentId);
		model.addAttribute("student", student);

		List<Department> departments = departmentMapper.findAll();
		model.addAttribute("departments", departments);

		Department department = departmentMapper.findOne(departmentId);
		model.addAttribute("department", department);

		GraduationText list0 = graduationMapper.findByDepartmentId(departmentId, "0");
		model.addAttribute("list0", list0);

		GraduationText list1 = graduationMapper.findByDepartmentId(departmentId, "1");
		model.addAttribute("list1", list1);

		GraduationText list2 = graduationMapper.findByDepartmentId(departmentId, "2");
		model.addAttribute("list2", list2);

		GraduationText list3 = graduationMapper.findByDepartmentId(departmentId, "3");
		model.addAttribute("list3", list3);

		GraduationText list4 = graduationMapper.findByDepartmentId(departmentId, "4");
		model.addAttribute("list4", list4);

		GraduationText list5 = graduationMapper.findByDepartmentId(departmentId, "5");
		model.addAttribute("list5", list5);

		model.addAttribute("departmentId", departmentId);

		return "student/stu_allSearch";
	}

	//비회원 졸업요건 조회
	@RequestMapping(value = "nonmember_page", method = RequestMethod.GET)
	public String nonmember_page(Model model, HttpSession session)
	{

		List<Department> departments = departmentMapper.findAll();
		model.addAttribute("departments", departments);

		return "student/nonmember_page";
	}

	@RequestMapping(value = "nonmember_page", method = RequestMethod.POST)
	public String nonmember_page(Model model, HttpSession session,  @RequestParam("departmentId") String departmentId)
	{

		List<Department> departments = departmentMapper.findAll();
		model.addAttribute("departments", departments);

		Department department = departmentMapper.findOne(departmentId);
		model.addAttribute("department", department);

		GraduationText list0 = graduationMapper.findByDepartmentId(departmentId, "0");
		model.addAttribute("list0", list0);

		GraduationText list1 = graduationMapper.findByDepartmentId(departmentId, "1");
		model.addAttribute("list1", list1);

		GraduationText list2 = graduationMapper.findByDepartmentId(departmentId, "2");
		model.addAttribute("list2", list2);

		GraduationText list3 = graduationMapper.findByDepartmentId(departmentId, "3");
		model.addAttribute("list3", list3);

		GraduationText list4 = graduationMapper.findByDepartmentId(departmentId, "4");
		model.addAttribute("list4", list4);

		GraduationText list5 = graduationMapper.findByDepartmentId(departmentId, "5");
		model.addAttribute("list5", list5);


		return "student/nonmember_page";
	}


	//대체과목 초수강 get
	@RequestMapping(value = "stu_replace_first", method = RequestMethod.GET)
	public String stu_replace_first(Model model, HttpSession session, @RequestParam("subjectCode") String subjectCode) {
		User user = (User) session.getAttribute("user");
		User oneUser= new User();






		MySubject mySubject = mySubjectMapper.findByOneSubject(user.getId(), subjectCode); //바꿀 과목 정보를 가져옴
		model.addAttribute("mySubject", mySubject);

		List<ReplaceSubject> list = replaceSubjectMapper.findReplaceSub();

		model.addAttribute("list", list);


		return "student/stu_replace_first";
	}

	//대체과목 초수강  post 안들은 과목 -> 들은 과목 처리
	@RequestMapping(value = "stu_replace_first", method = RequestMethod.POST) // completionDivision 0이면 교선 1이면 전선
	public String stu_replace_first(Model model, HttpSession session, RedirectAttributes redirectAttributes,
			MySubject mySubject, @RequestParam("changeSubjectCode") String changeSubjectCode) {

		User user = (User) session.getAttribute("user");

		mySubject.setUserId(user.getId());
		mySubject = mySubjectMapper.findByOneSubject(mySubject.getUserId(), mySubject.getSubjectCode()); //바꾸기 전 과목
		RequiredSubject changeSubject = mySubjectMapper.findByOneRequiredSubject(user.getId(), changeSubjectCode); //바꿀 과목

		String selectResult = null;

		if (mySubject.getCompletionDivision().contains("필")) {
			selectResult="0";//필수과목은 필수과목으로 대체될 수 없습니다.

		} else if(mySubject.getCompletionDivision().contains("교")) {
			selectResult="1";;//교양은 전공필수 과목으로 대체될 수 없습니다.
		} else if(mySubject.getCompletionDivision().contains("전선")) {
			mySubjectMapper.changeSubject(mySubject.getSubjectCode(),changeSubject.getSubjectCode(), changeSubject.getName(),user.getId()); //이름, 과목코드만 바뀌면 됌
			selectResult="2";//대체과목 변경이 완료되었습니다.
		}

		redirectAttributes.addAttribute("subjectCode", mySubject.getSubjectCode());
		redirectAttributes.addAttribute("subjectName", mySubject.getSubjectName());
		redirectAttributes.addAttribute("result", selectResult);
		return "redirect:/student/stu_replace_first";
	}

}

