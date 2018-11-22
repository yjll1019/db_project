package net.skhu.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import net.skhu.dto.Department;
import net.skhu.dto.MySubject;
import net.skhu.dto.ReplaceSubject;
import net.skhu.dto.SecondMajor;
import net.skhu.dto.Student;
import net.skhu.dto.Subject;
import net.skhu.dto.User;
import net.skhu.mapper.GraduationMapper;
import net.skhu.mapper.MySubjectMapper;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.ReplaceSubjectMapper;
import net.skhu.mapper.SecondMajorMapper;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.SubjectMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.model.Pagination;
import net.skhu.service.ExcelService;
import net.skhu.service.ReplaceSubjectService;
import net.skhu.util.EmailServiceImpl;
import net.skhu.util.FindUtil;
import net.skhu.util.SecurityUtil;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired UserMapper userMapper;
	@Autowired ReplaceSubjectMapper replaceSubjectMapper;
	@Autowired MySubjectMapper mySubjectMapper;
	@Autowired SubjectMapper subjectMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired SecondMajorMapper secondMajorMapper;
	@Autowired private EmailServiceImpl emailService;
	@Autowired ExcelService excelService;
	@Autowired GraduationMapper graduationMapper;
	@Autowired ReplaceSubjectService replaceService;

	//admin,professor 비밀번호 찾기 GET
	@RequestMapping(value="/admin_professor_forgot_password", method=RequestMethod.GET)
	public String sendPw(Model model) {
		User user = new User();
		model.addAttribute("user",user);
		//System.out.println("get방식 컨트롤러 들어옴");
		return "admin/admin_professor_forgot_password";
	}

	//admin,professor 비밀번호 찾기 POST
	@RequestMapping(value="/admin_professor_forgot_password", method=RequestMethod.POST)
	private String sendPw(Model model,User user) {

		User result = userMapper.login(user.getId());

		String url="";
		String alert="";
		String subject = "[성공회대학교] 임시 비밀번호 발급 안내";

		if(result == null) { //아이디 존재하지 않는 경우
			alert="-1";
			user.setId("");
			user.setEmail("");
			url = "admin/admin_professor_forgot_password"; // 비밀번호찾기 페이지로
		} else if(!result.getRole().equals("관리자") && !result.getRole().equals("교수")) {
			alert = "-2";
			url="admin/admin_professor_forgot_password";
		} else {
			if(!result.getEmail().equals(user.getEmail())) { // 이메일 일치하지 않으면
				alert = "0";
				url="admin/admin_professor_forgot_password"; // 비밀번호찾기 페이지로
			}
			else if(result.getEmail().equals(user.getEmail())) { // 이메일 같으면
				alert="1";

				SecurityUtil su = new SecurityUtil();
				String newPwd = FindUtil.getRandomPw(8); //8 자리수 임시비밀번호 생성
				String enPassword = su.encryptBySHA256(newPwd);

				userMapper.changePassword(user.getId(), enPassword); // 임시비밀번호로 디비 변경

				String msg=""; // message

				msg +=user.getId();
				msg +="님의 임시 비밀번호: ";
				msg +=newPwd;

				this.emailService.sendMessage(user.getEmail(), subject, msg);
				url="redirect:/user/login";//로그인 페이지로
			}
		}
		model.addAttribute("alert",alert);
		return url;
	}

	// AdminInfo Get
	@RequestMapping(value="/adminInfo",method=RequestMethod.GET)
	public String adminInfo(Model model, HttpSession session) {

		User user = (User) session.getAttribute("user");//user라는 객체를 가져옴.세션값을 가져와야 현재 접속한 아이디값을 얻을 수 있다.
		if(user.getId()==null) return "redirect:/user/login"; // 세션값에 아이디 없으면 로그인창으로
		model.addAttribute("user",user);

		return "admin/adminInfo";
	}

	// AdminInfo POST
	@RequestMapping(value="/adminInfo",method=RequestMethod.POST)
	public String adminInfo(Model model, User user, HttpSession session ) {

		User userGetId = (User) session.getAttribute("user");
		user.setId(userGetId.getId());
		user.setRole(userGetId.getRole());
		String alert="";
		String regex="([a-zA-Z].+[0-9])|([0-9].+[a-zA-Z])"; //영문+숫자

		if(user.getPassword().length() > 0) {

			//비밀번호 조건에 맞지 않을 떄
			if(!user.getPassword().matches(regex) || user.getPassword().length()<8) {
				alert="-1";
				model.addAttribute("user",user);
				model.addAttribute("alert",alert);
				return "admin/adminInfo";

			}
			// 비밀번호와 확인비밀번호가 다를 때
			if(!user.getConfirmPassword().equals(user.getPassword())) {
				alert="-2";
				model.addAttribute("user",user);
				model.addAttribute("alert",alert);
				return "admin/adminInfo";
			}
			SecurityUtil su = new SecurityUtil();
			String enPssword = su.encryptBySHA256(user.getPassword());// 암호화
			user.setPassword(enPssword);

		} else {
			user.setPassword(userGetId.getPassword());
		}

		userMapper.updateAdmin(user); // user테이블 update
		session.removeAttribute("user");
		session.setAttribute("user", user);

		return "redirect:admin_stu_search";
	}

	/*
	@RequestMapping(value="admin_stu_search")
	public String admin_stu_search(Model model) {
		List<User> users = userMapper.findByUser("");
		model.addAttribute("users", users);
		return "admin/admin_stu_search";
	}
	 */
	//관리자 학생 조회 페이지
	@RequestMapping(value="admin_stu_search", method=RequestMethod.GET)
	public String main(Model model, HttpSession session, @RequestParam("sbd") String sbd, @RequestParam("sbg") String sbg,
			@RequestParam("sbi") String sbi, @RequestParam("st") String st) {
		List<User> users;
		String where = "";
		System.out.println("sbd: " + sbd + " sbg: " + sbg + " sbi: " + sbi + " " + st);
		if(sbd.equals("0") && sbg.equals("0")){	// 전체
			if(sbi.equals("1"))
				where = "where u.id like '%" + st + "%' ";
			else if(sbi.equals("2"))
				where = "where u.userName like '%" + st +"%' ";
			else if(sbi.equals("3"))
				where = "where msj.subjectCode = '" + st + "' ";
			else if(sbi.equals("4")) {
				where = st.length() > 0 ? "where msj.subjectName like '%" + st + "%' " : "";
			}
		} else if(!sbd.equals("0") && sbg.equals("0")) { // 학과별
			if(sbi.equals("1"))
				where = "where s.departmentId = '" + sbd + "' and u.id like '%" + st + "%' ";
			else if(sbi.equals("2"))
				where = "where s.departmentId = '" + sbd + "' and u.userName like '%" + st +"%' ";
			else if(sbi.equals("3"))
				where = "where s.departmentId = '" + sbd + "' and msj.subjectCode = '" + st + "' ";
			else if(sbi.equals("4"))
				where = st.length() > 0 ? "where s.departmentId = '" + sbd + "' and msj.subjectName like '%" + st + "%' " : "where s.departmentId = '" + sbd + "' ";
				else
					where = "where s.departmentId = '" + sbd + "' ";
		} else if(sbd.equals("0") && !sbg.equals("0")) { // 학년별
			int grade = Integer.parseInt(sbg);
			if(sbi.equals("1"))
				where = "where s.stuSemester in('" + (grade*2-1) + "', '" + (grade*2) + "') and u.id like '%" + st + "%' ";
			else if(sbi.equals("2"))
				where = "where s.stuSemester in('" + (grade*2-1) + "', '" + (grade*2) + "') and u.userName like '%" + st +"%' ";
			else if(sbi.equals("3"))
				where = "where s.stuSemester in('" + (grade*2-1) + "', '" + (grade*2) + "') and msj.subjectCode = '" + st + "' ";
			else if(sbi.equals("4")) {
				where = st.length() > 0 ? "where s.stuSemester in('" + (grade*2-1) + "', '" + (grade*2) + "') and msj.subjectName like '%" + st + "%' "
						: "where s.stuSemester in('" + (grade*2-1) + "', '" + (grade*2) + "')";
			}
			else
				where = "where s.stuSemester in('" + (grade*2-1) + "', '" + (grade*2) + "')";
		} else {
			int grade = Integer.parseInt(sbg);
			if(sbi.equals("1"))
				where = "where s.departmentId = '" + sbd + "' and s.stuSemester in('" + (grade*2-1) + "', '" + (grade*2) + "') and u.id like '%" + st + "%' ";
			else if(sbi.equals("2"))
				where = "where s.departmentId = '" + sbd + "' and s.stuSemester in('" + (grade*2-1) + "', '" + (grade*2) + "') and u.userName like '%" + st +"%' ";
			else if(sbi.equals("3"))
				where = "where s.departmentId = '" + sbd + "' and s.stuSemester in('" + (grade*2-1) + "', '" + (grade*2) + "') and msj.subjectCode = '" + st + "' ";
			else if(sbi.equals("4"))
				where = st.length() > 0 ? "where s.departmentId = '" + sbd + "' and s.stuSemester in('" + (grade*2-1) + "', '" + (grade*2) + "') and msj.subjectName like '%" + st + "%' "
						: "where s.departmentId = '" + sbd + "' and s.stuSemester in('" + (grade*2-1) + "', '" + (grade*2) + "')";
				else
					where = "where s.departmentId = '" + sbd + "' and s.stuSemester in('" + (grade*2-1) + "', '" + (grade*2) + "')";
		}

		System.out.println("where: " + where);

		if(sbi.equals("3") || (sbi.equals("4") && st.length() > 0)) {
			users = userMapper.findBySubject(where);
		} else {
			users = userMapper.findByUser(where);
		}
		model.addAttribute("users", users);
		model.addAttribute("sbd", sbd);
		model.addAttribute("sbg", sbg);
		model.addAttribute("sbi", sbi);
		model.addAttribute("st", st);

		return "admin/admin_stu_search";
	}

	// 관리자 학생 상세 조회
	@RequestMapping(value="admin_stu_info", method=RequestMethod.GET)
	public String admin_stu_info(Model model, @RequestParam("id") String id,
			@RequestParam("sbd") String sbd, @RequestParam("sbg") String sbg, @RequestParam("sbi") String sbi, @RequestParam("st") String st) {
		User user = userMapper.findById(id);
		Student student = studentMapper.findOneWithUser(id);
		SecondMajor nullCheck = secondMajorMapper.findOneById(id);
		SecondMajor secondMajor = nullCheck == null ? new SecondMajor() : nullCheck;
		model.addAttribute("secondMajor", secondMajor);
		model.addAttribute("user", user);
		model.addAttribute("student", student);
		model.addAttribute("sbd", sbd);
		model.addAttribute("sbg", sbg);
		model.addAttribute("sbi", sbi);
		model.addAttribute("st", st);
		return "admin/admin_stu_info";
	}

	//관리자 학생 수강목록 조회 페이지
	@RequestMapping(value="admin_stu_subject", method=RequestMethod.GET)
	public String admin_stu_subject(Model model, @RequestParam("id") String id, HttpSession session) {

		int enterYear = Integer.parseInt(id.substring(0, 4));

		Calendar c = Calendar.getInstance();
		int currentYear = c.get(Calendar.YEAR);

		List<MySubject> mySubjectlist = mySubjectMapper.findAll(id);

		model.addAttribute("mySubjectlist", mySubjectlist);
		model.addAttribute("enterYear", enterYear);
		model.addAttribute("currentYear", currentYear);
		model.addAttribute("id", id);
		return "admin/admin_stu_subject";
	}
	
	@RequestMapping(value = "admin_stu_subject", method = RequestMethod.POST)
	public String stu_subject_list(Model model, HttpSession session,
			@RequestParam("subjectListYear") Object subjectListYear,
			@RequestParam("subjectListSemester") Object subjectListSemester,
			@RequestParam("id") String id) {
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

		return "admin/admin_stu_subject";
	}

	//관리자 전체과목 조회 페이지
	@RequestMapping(value="admin_all_subject", method=RequestMethod.GET)
	public String admin_all_search(Model model) {
		return "admin/admin_all_subject";
	}

	// 전체과목 조회 페이지 파일업로드
	@RequestMapping(value="subject_upload", method=RequestMethod.POST)
	public String subject_upload(Model model, @RequestParam("file") MultipartFile file) throws Exception{
		String r = "-1";
		if(!file.isEmpty()) {
			List<Subject> subjects = excelService.getSubjectList(file.getInputStream());
			subjectMapper.insert(subjects);
			r = "1";
		}
		return "redirect:admin_all_subject?r=" + r;
	}

	// 대체과목목록 조회 페이지
	@RequestMapping(value="admin_replace_list", method=RequestMethod.GET)
	public String admin_replace_list(Model model,Pagination pagination,HttpSession session) {
		User user = (User) session.getAttribute("user");//user라는 객체를 가져옴.세션값을 가져와야 현재 접속한 아이디값을 얻을 수 있다.
		//System.out.println(user.getRole());
		if(user.getId()==null) return "redirect:/user/login"; // 세션값에 아이디 없으면 로그인창으로
		if(!(user.getRole().equals("관리자"))) return "redirect:/user/login"; // 관리자 아니면 로그인창으로

		model.addAttribute("replace",replaceService.findByType(pagination));
		model.addAttribute("searchBy",replaceService.getSerachByOptions());
		return "admin/admin_replace_list";
	}

	// 폐지과목 신청 및 대체 과목 신청
	@RequestMapping(value="admin_replace_list", method=RequestMethod.POST)
	public String admin_replace_list(Model model, Subject subject,Pagination pagination, HttpSession session) {

		String alert="";

		//폐지 과목 정보 입력은 다 필수다.
		if((subject.getDeleteDepartmentId().equals("")) && (subject.getDeleteSemester().equals(""))
				&& (subject.getDeleteYear().equals("")) && (subject.getDeleteCode().equals(""))
				&& (subject.getDeleteSubjectName().equals(""))) {
			alert="0";
			model.addAttribute("alert",alert);
			model.addAttribute("replace",replaceService.findByType(pagination));
			model.addAttribute("searchBy",replaceService.getSerachByOptions());
			return "admin/admin_replace_list";
		}
		//대체 과목 학과/학부 정보 입력은 필수다.
		if((subject.getDepartmentId().equals(""))) {
			alert="1";
			model.addAttribute("alert",alert);
			model.addAttribute("replace",replaceService.findByType(pagination));
			model.addAttribute("searchBy",replaceService.getSerachByOptions());
			return "admin/admin_replace_list";
		}

		//입력한 폐지 과목 정보가 subject 테이블에 없다.
		if(subjectMapper.findDelete(subject)<=0) {
			alert="2";
			model.addAttribute("alert",alert);
			model.addAttribute("subject",subject);
			model.addAttribute("replace",replaceService.findByType(pagination));
			model.addAttribute("searchBy",replaceService.getSerachByOptions());
			return "admin/admin_replace_list";
		}
		//대체과목 - 과목 지정인 경우다. 이때는 과목코드와 과목명이 필수다.
		if(subject.getCompletionDivision().equals("")) {
			System.out.println("과목 지정인 경우입니다.");
			if((subject.getSubjectName().equals(""))&&(subject.getClass().equals(""))) { //과목 코드와 과목명 필수 입력해야 합니다.
				alert="3";
				model.addAttribute("alert",alert);
				model.addAttribute("subject",subject);
				model.addAttribute("replace",replaceService.findByType(pagination));
				model.addAttribute("searchBy",replaceService.getSerachByOptions());
				return "admin/admin_replace_list";
			}else if((subjectMapper.findReplace(subject)<=0)) {//과목 코드와 과목명 입력이 되었지만, 입력한 정보가 subject 테이블에 존재하지 않을 때
				alert="4";
				model.addAttribute("alert",alert);
				model.addAttribute("subject",subject);
				model.addAttribute("replace",replaceService.findByType(pagination));
				model.addAttribute("searchBy",replaceService.getSerachByOptions());
				return "admin/admin_replace_list";
			}else if(subjectMapper.findReplace(subject)>0){// 입력한 정보가 subject 테이블에 존재할 때
				replaceSubjectMapper.insertSubject(subject.getDeleteCode(),subject.getCode());
				System.out.println("폐지,대체과목 과목 지정인 경우저장 완료!");
				model.addAttribute("replace",replaceService.findByType(pagination));
				model.addAttribute("searchBy",replaceService.getSerachByOptions());
				return "admin/admin_replace_list";
			}
		}
		else if(!(subject.getCompletionDivision()==null)) {//대체과목 - 과목 지정이 아닌 경우다. 이때는 과목코드와 과목명은 필요 없다.
			replaceSubjectMapper.insertWithCompletionDivision(subject.getDeleteCode(),subject.getCompletionDivision());
			System.out.println("폐지, 대체과목 과목 지정 아닌 경우 저장 완료");
			model.addAttribute("replace",replaceService.findByType(pagination));
			model.addAttribute("searchBy",replaceService.getSerachByOptions());
			return "admin/admin_replace_list";
		}

		return "admin/admin_replace_list";
	}

	// 대체과목목록 조회 페이지 파일업로드
	@RequestMapping(value="replace_upload", method=RequestMethod.POST)
	public String replace_upload(Model model, @RequestParam("file") MultipartFile file) throws Exception{
		String r = "-1";
		if(!file.isEmpty()) {
			List<ReplaceSubject> replaceSubjects = excelService.getReplaceSubjectList(file.getInputStream());
			replaceSubjectMapper.insert(replaceSubjects);
			r = "1";
		}
		return "redirect:admin_replace_list?r=" + r;
	}


	@RequestMapping(value="admin_graduation_text", method=RequestMethod.GET)
	public String admin_graduation_text(Model model) {
		return "admin/admin_graduation_text";
	}


}
