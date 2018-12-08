package net.skhu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.skhu.dto.Counsel;
import net.skhu.dto.Department;
import net.skhu.dto.GraduationText;
import net.skhu.dto.Record;
import net.skhu.dto.ReplaceSubject;
import net.skhu.dto.Student;
import net.skhu.dto.Subject;
import net.skhu.dto.User;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.GraduationMapper;
import net.skhu.mapper.MySubjectMapper;
import net.skhu.mapper.RecordMapper;
import net.skhu.mapper.ReplaceSubjectMapper;
import net.skhu.mapper.RequiredSubjectMapper;
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
	@Autowired RecordMapper recordMapper;
	@Autowired RequiredSubjectMapper requiredSubjectMapper;

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

	@RequestMapping(value="admin_stu_search")
	public String admin_stu_search(Model model,HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<User> users = userMapper.findByUser("");
		model.addAttribute("user",user);
		model.addAttribute("users", users);
		return "admin/admin_stu_search";
	}

	//관리자 학생 조회 페이지
	@RequestMapping(value="admin_stu_search", method=RequestMethod.POST)
	public String main(Model model, HttpSession session, HttpServletRequest request, @RequestParam("sbd") String sbd, @RequestParam("sbg") String sbg,
			@RequestParam("sbi") String sbi, @RequestParam("st") String st) {
		User user = (User) session.getAttribute("user");
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
		model.addAttribute("user",user);
		model.addAttribute("users", users);
		request.setAttribute("sbd", sbd);
		request.setAttribute("sbg", sbg);
		request.setAttribute("sbi", sbi);
		request.setAttribute("st", st);

		return "admin/admin_stu_search";
	}

	@RequestMapping(value="admin_frustrated_list", method=RequestMethod.GET)
	public String frustrated_list(Model model) {
		List<Student> students = studentMapper.frustratedStudent();
		List<Student> list = new ArrayList<Student>(students);
		for(Student s : list) {
			String secondMajor = secondMajorMapper.findSecondMajor(s.getUserId());
			int majorCredit = 0;
			int myMajorCredit = Integer.parseInt(mySubjectMapper.findMajorCount(s.getUserId()));
			if(secondMajor != null) {	// 부전공 혹은 복수전공 해당학생의 전공필수 학점 검사
				if(secondMajor.equals("부전공")) {	// 부전공
					majorCredit = Integer.parseInt(graduationMapper.findCredit("2", "1", s.getUserId().substring(0, 4), "12"));
					if(myMajorCredit < majorCredit) {
						continue;
					}
				} else {	// 복수전공
					majorCredit = Integer.parseInt(graduationMapper.findCredit("1", "1", s.getUserId().substring(0, 4), "12"));
					if(myMajorCredit < majorCredit) {
						continue;
					}
				}
			} else {	// 부전공 또는 복수전공에 해당하지 않는 학생
				if(s.getTransferStudent().equals("1")) { // 편입생인 경우
					majorCredit = Integer.parseInt(graduationMapper.findCredit("3", "1", s.getUserId().substring(0, 4), "12"));
					if(myMajorCredit < majorCredit) {
						continue;
					}
				} else {
					majorCredit = Integer.parseInt(graduationMapper.findCredit("0", "1", s.getUserId().substring(0, 4), "12"));
					if(myMajorCredit < majorCredit) {
						continue;
					}
				}
			} // 전공필수 끝
			int allMajorCredit = 0;
			int myAllMajorCredit = mySubjectMapper.findMajor(s.getUserId()).size();
			if(secondMajor != null) {	// 부전공 혹은 복수전공 해당학생의 전공학점 검사
				if(secondMajor.equals("부전공")) {	// 부전공
					allMajorCredit = Integer.parseInt(graduationMapper.findCredit("2", "0", s.getUserId().substring(0, 4), "12"));
					if(myAllMajorCredit < allMajorCredit) {
						continue;
					}
				} else {	// 복수전공
					allMajorCredit = Integer.parseInt(graduationMapper.findCredit("1", "0", s.getUserId().substring(0, 4), "12"));
					if(myAllMajorCredit < allMajorCredit) {
						continue;
					}
				}
			} else {	// 부전공 또는 복수전공에 해당하지 않는 학생
				if(s.getTransferStudent().equals("1")) { // 편입생인 경우
					allMajorCredit = Integer.parseInt(graduationMapper.findCredit("3", "0", s.getUserId().substring(0, 4), "12"));
					if(myAllMajorCredit < allMajorCredit) {
						continue;
					}
				} else {
					allMajorCredit = Integer.parseInt(graduationMapper.findCredit("0", "0", s.getUserId().substring(0, 4), "12"));
					if(s.getHowToGraduate().equals("전공심화")) allMajorCredit += 15; // 전공심화 졸업예정일경우
					if(myAllMajorCredit < allMajorCredit) {
						continue;
					}
				}
			} // 전공학점 끝
			int culturalCredit = 0;
			int myCulturalCredit = mySubjectMapper.findCultural(s.getUserId()).size();
			if(secondMajor == null && s.getTransferStudent().equals("0")) {
				if(myCulturalCredit < culturalCredit) {
					continue;
				}
			}// 교양학점 끝
			int requiredSubject = requiredSubjectMapper.requiredCount(s.getUserId().substring(0, 4));
			int myRequiredSubject = requiredSubjectMapper.myRequiredCount(s.getUserId().substring(0, 4));
			if(myRequiredSubject < requiredSubject) {
				continue;
			} // 전공필수 과목 끝
			int pray = mySubjectMapper.findPray(s.getUserId());
			if(pray < 2) {
				continue;
			}	//채플 끝
			if(s.getVolunteerExemption().equals("0")) {
				int volunteer = mySubjectMapper.findService(s.getUserId());
				if(volunteer < 1) {
					continue;
				}
			} // 사회봉사 끝
			int sumCredit = mySubjectMapper.sumCredit(s.getUserId());
			if(sumCredit < 130) {
				continue;
			}
			students.remove(s);
		}
		model.addAttribute("students", students);
		return "admin/admin_frustrated_list";
	}

	@RequestMapping(value="admin_frustrated_list", method=RequestMethod.POST)
	public String frustrated_list(Model model, HttpServletRequest request, @RequestParam("sbd") String sbd,
			@RequestParam("sbi") String sbi, @RequestParam("st") String st) {
		List<Student> students;
		if(sbi.equals("1")) {
			students = studentMapper.frustratedStudentByUserId("%" + st + "%");
		} else {
			students = studentMapper.frustratedStudent();
		}
		List<Student> list = new ArrayList<Student>(students);
		for(Student s : list) {
			String secondMajor = secondMajorMapper.findSecondMajor(s.getUserId());
			int majorCredit = 0;
			int myMajorCredit = Integer.parseInt(mySubjectMapper.findMajorCount(s.getUserId()));
			if(secondMajor != null) {	// 부전공 혹은 복수전공 해당학생의 전공필수 학점 검사
				if(secondMajor.equals("부전공")) {	// 부전공
					majorCredit = Integer.parseInt(graduationMapper.findCredit("2", "1", s.getUserId().substring(0, 4), "12"));
					if(myMajorCredit < majorCredit) {
						continue;
					}
				} else {	// 복수전공
					majorCredit = Integer.parseInt(graduationMapper.findCredit("1", "1", s.getUserId().substring(0, 4), "12"));
					if(myMajorCredit < majorCredit) {
						continue;
					}
				}
			} else {	// 부전공 또는 복수전공에 해당하지 않는 학생
				if(s.getTransferStudent().equals("1")) { // 편입생인 경우
					majorCredit = Integer.parseInt(graduationMapper.findCredit("3", "1", s.getUserId().substring(0, 4), "12"));
					if(myMajorCredit < majorCredit) {
						continue;
					}
				} else {
					majorCredit = Integer.parseInt(graduationMapper.findCredit("0", "1", s.getUserId().substring(0, 4), "12"));
					if(myMajorCredit < majorCredit) {
						continue;
					}
				}
			} // 전공필수 끝
			int allMajorCredit = 0;
			int myAllMajorCredit = mySubjectMapper.findMajor(s.getUserId()).size();
			if(secondMajor != null) {	// 부전공 혹은 복수전공 해당학생의 전공학점 검사
				if(secondMajor.equals("부전공")) {	// 부전공
					allMajorCredit = Integer.parseInt(graduationMapper.findCredit("2", "0", s.getUserId().substring(0, 4), "12"));
					if(myAllMajorCredit < allMajorCredit) {
						continue;
					}
				} else {	// 복수전공
					allMajorCredit = Integer.parseInt(graduationMapper.findCredit("1", "0", s.getUserId().substring(0, 4), "12"));
					if(myAllMajorCredit < allMajorCredit) {
						continue;
					}
				}
			} else {	// 부전공 또는 복수전공에 해당하지 않는 학생
				if(s.getTransferStudent().equals("1")) { // 편입생인 경우
					allMajorCredit = Integer.parseInt(graduationMapper.findCredit("3", "0", s.getUserId().substring(0, 4), "12"));
					if(myAllMajorCredit < allMajorCredit) {
						continue;
					}
				} else {
					allMajorCredit = Integer.parseInt(graduationMapper.findCredit("0", "0", s.getUserId().substring(0, 4), "12"));
					if(s.getHowToGraduate().equals("전공심화")) allMajorCredit += 15; // 전공심화 졸업예정일경우
					if(myAllMajorCredit < allMajorCredit) {
						continue;
					}
				}
			} // 전공학점 끝
			int culturalCredit = 0;
			int myCulturalCredit = mySubjectMapper.findCultural(s.getUserId()).size();
			if(secondMajor == null && s.getTransferStudent().equals("0")) {
				if(myCulturalCredit < culturalCredit) {
					continue;
				}
			}// 교양학점 끝
			int requiredSubject = requiredSubjectMapper.requiredCount(s.getUserId().substring(0, 4));
			int myRequiredSubject = requiredSubjectMapper.myRequiredCount(s.getUserId().substring(0, 4));
			if(myRequiredSubject < requiredSubject) {
				continue;
			} // 전공필수 과목 끝
			int pray = mySubjectMapper.findPray(s.getUserId());
			if(pray < 2) {
				continue;
			}	//채플 끝
			if(s.getVolunteerExemption().equals("0")) {
				int volunteer = mySubjectMapper.findService(s.getUserId());
				if(volunteer < 1) {
					continue;
				}
			} // 사회봉사 끝
			int sumCredit = mySubjectMapper.sumCredit(s.getUserId());
			if(sumCredit < 130) {
				continue;
			}
			students.remove(s);
		}
		model.addAttribute("students", students);
		request.setAttribute("sbd", sbd);
		request.setAttribute("sbi", sbi);
		request.setAttribute("st", st);
		return "admin/admin_frustrated_list";
	}

	//관리자 전체과목 조회 페이지
	@RequestMapping(value="admin_all_subject", method=RequestMethod.GET)
	public String admin_all_search(Model model,Pagination pagination,HttpSession session) {
		User user = (User) session.getAttribute("user");
		int count = subjectMapper.count(pagination);
		pagination.setRecordCount(count);
		model.addAttribute("user",user);
		model.addAttribute("subjectlist",subjectMapper.findByType(pagination));
		model.addAttribute("searchBy",subjectMapper.searchBy);
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
		System.out.println(pagination.getRecordCount());
		User user = (User) session.getAttribute("user");//user라는 객체를 가져옴.세션값을 가져와야 현재 접속한 아이디값을 얻을 수 있다.
		//System.out.println(user.getRole());
		//if(user.getId()==null) return "redirect:/user/login"; // 세션값에 아이디 없으면 로그인창으로
		//if(!(user.getRole().equals("관리자"))) return "redirect:/user/login"; // 관리자 아니면 로그인창으로
		model.addAttribute("user",user);
		model.addAttribute("replace",replaceService.findByType(pagination));
		model.addAttribute("searchBy",replaceService.getSerachByOptions());
		return "admin/admin_replace_list";
	}

	// 폐지과목 신청 및 대체 과목 신청
	@RequestMapping(value="admin_replace_list", method=RequestMethod.POST)
	public String admin_replace_list(Model model, Subject subject,Pagination pagination, HttpSession session) {
		User user = (User) session.getAttribute("user");
		String alert="";

		//폐지 과목 정보 입력은 다 필수다.
		if((subject.getDeleteDepartmentId().equals("")) && (subject.getDeleteSemester().equals(""))
				&& (subject.getDeleteYear().equals("")) && (subject.getDeleteCode().equals(""))
				&& (subject.getDeleteSubjectName().equals(""))) {
			alert="0";
			model.addAttribute("alert",alert);
			model.addAttribute("user",user);
			model.addAttribute("replace",replaceService.findByType(pagination));
			model.addAttribute("searchBy",replaceService.getSerachByOptions());
			return "admin/admin_replace_list";
		}
		//대체 과목 학과/학부 정보 입력은 필수다.
		if((subject.getDepartmentId().equals(""))) {
			alert="1";
			model.addAttribute("alert",alert);
			model.addAttribute("user",user);
			model.addAttribute("replace",replaceService.findByType(pagination));
			model.addAttribute("searchBy",replaceService.getSerachByOptions());
			return "admin/admin_replace_list";
		}

		//입력한 폐지 과목 정보가 subject 테이블에 없다.
		if(subjectMapper.findDelete(subject)<=0) {
			alert="2";
			model.addAttribute("alert",alert);
			model.addAttribute("user",user);
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
				model.addAttribute("user",user);
				model.addAttribute("subject",subject);
				model.addAttribute("replace",replaceService.findByType(pagination));
				model.addAttribute("searchBy",replaceService.getSerachByOptions());
				return "admin/admin_replace_list";
			}else if((subjectMapper.findReplace(subject)<=0)) {//과목 코드와 과목명 입력이 되었지만, 입력한 정보가 subject 테이블에 존재하지 않을 때
				alert="4";
				model.addAttribute("alert",alert);
				model.addAttribute("user",user);
				model.addAttribute("subject",subject);
				model.addAttribute("replace",replaceService.findByType(pagination));
				model.addAttribute("searchBy",replaceService.getSerachByOptions());
				return "admin/admin_replace_list";
			}else if(subjectMapper.findReplace(subject)>0){// 입력한 정보가 subject 테이블에 존재할 때
				replaceSubjectMapper.insertSubject(subject.getDeleteCode(),subject.getCode());
				System.out.println("폐지,대체과목 과목 지정인 경우저장 완료!");
				model.addAttribute("user",user);
				model.addAttribute("replace",replaceService.findByType(pagination));
				model.addAttribute("searchBy",replaceService.getSerachByOptions());
				return "admin/admin_replace_list";
			}
		}
		else if(!(subject.getCompletionDivision()==null)) {//대체과목 - 과목 지정이 아닌 경우다. 이때는 과목코드와 과목명은 필요 없다.
			replaceSubjectMapper.insertWithCompletionDivision(subject.getDeleteCode(),subject.getCompletionDivision());
			System.out.println("폐지, 대체과목 과목 지정 아닌 경우 저장 완료");
			model.addAttribute("user",user);
			model.addAttribute("replace",replaceService.findByType(pagination));
			model.addAttribute("searchBy",replaceService.getSerachByOptions());
			return "admin/admin_replace_list";
		}

		return "admin/admin_replace_list";
	}

	//대체과목 삭제
	@RequestMapping(value="replaceDelete")
	public String replaceDelete(Model model,@RequestParam("subjectCode") String subjectCode, @RequestParam("replaceSubject") String replaceSubject,
			Pagination pagination, HttpSession session) {
		User user = (User) session.getAttribute("user");

		if(replaceSubject.equals("")&& !(subjectCode.equals(""))) {
			replaceSubjectMapper.deleteReplace(subjectCode);
			model.addAttribute("user",user);
			model.addAttribute("replace",replaceService.findByType(pagination));
			model.addAttribute("searchBy",replaceService.getSerachByOptions());
			return "admin/admin_replace_list";
		}else if(!(replaceSubject.equals("") && subjectCode.equals(""))) {
			replaceSubjectMapper.deleteReplaceSubject(subjectCode,replaceSubject);
			model.addAttribute("user",user);
			model.addAttribute("replace",replaceService.findByType(pagination));
			model.addAttribute("searchBy",replaceService.getSerachByOptions());
		}

		String alert="";


		model.addAttribute("user",user);
		model.addAttribute("replace",replaceService.findByType(pagination));
		model.addAttribute("searchBy",replaceService.getSerachByOptions());
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


	@RequestMapping(value="admin_allSearchEdit", method=RequestMethod.GET)
	public String admin_graduation_text(Model model,HttpSession session) {

		User user = (User) session.getAttribute("user");
		List<Department> departments = departmentMapper.findAll();
		model.addAttribute("departments", departments);
		model.addAttribute("user",user);
		return "admin/admin_allSearchEdit";
	}

	@RequestMapping("select")
	public String select(Model model , @RequestParam("departmentId") String departmentId,
			RedirectAttributes redirectAttributes) {


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

		return "admin/admin_allSearchEdit";
	}

	@RequestMapping(value="edit",method=RequestMethod.POST)
	public String edit(Model model , @RequestParam("departmentId") String departmentId,RedirectAttributes redirectAttributes,
			@RequestParam("content0") String content0, @RequestParam("content1") String content1,@RequestParam("content2") String content2,
			@RequestParam("content3") String content3,@RequestParam("content4") String content4,@RequestParam("content5") String content5,
			@RequestParam("etc0") String etc0,@RequestParam("etc1") String etc1,@RequestParam("etc2") String etc2,
			@RequestParam("etc3") String etc3,@RequestParam("etc4") String etc4,@RequestParam("etc5") String etc5
			) {
		List<Department> departments = departmentMapper.findAll();
		model.addAttribute("departments", departments);
		Department department = departmentMapper.findOne(departmentId);
		model.addAttribute("department", department);

		System.out.println(etc4);

		graduationMapper.updateText(content0, etc0, departmentId, "0");
		graduationMapper.updateText(content1, etc1, departmentId, "1");
		graduationMapper.updateText(content2, etc2, departmentId, "2");
		graduationMapper.updateText(content3, etc3, departmentId, "3");
		graduationMapper.updateText(content4, etc4, departmentId, "4");
		graduationMapper.updateText(content5, etc5, departmentId, "5");

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

		return "admin/admin_allSearchEdit";
	}

	//달력 일정 관리
	@RequestMapping(value="admin_calenderEdit", method=RequestMethod.GET)
	public String admin_calenderEdit(Model model ,HttpSession session) {
		User user = (User) session.getAttribute("user");//user라는 객체를 가져옴.세션값을 가져와야 현재 접속한 아이디값을 얻을 수 있다.

		if(user.getId()==null) return "redirect:/user/login"; // 세션값에 아이디 없으면 로그인창으로
		if(!(user.getRole().equals("관리자")||user.getRole().equals("슈퍼관리자"))) return "redirect:/user/login"; // 관리자 아니면 로그인창으로
		model.addAttribute("user",user);
		return "admin/admin_calenderEdit";
	}

	//admin_memo GET
	@RequestMapping(value="/admin_memo",method=RequestMethod.GET)
	public String admin_memo(Model model,@RequestParam("id") String id,HttpSession session) {

		User user = (User) session.getAttribute("user");//user라는 객체를 가져옴.세션값을 가져와야 현재 접속한 아이디값을 얻을 수 있다.
		if(user.getId()==null) return "redirect:/user/login"; // 세션값에 아이디 없으면 로그인창으로

		String record = recordMapper.findContent(id);
		if(record==null||record.length()==0) {
			return "admin/admin_memo";
		}
		model.addAttribute("user",user);
		model.addAttribute("record",record);
		model.addAttribute("stuId",id);
		return "admin/admin_memo";
	}

	//admin_memo POST
	@RequestMapping(value="/admin_memo",method=RequestMethod.POST)
	public String admin_memo(Model model,Counsel counsel,@RequestParam("stuId") String stuId,HttpSession session) {

		User user = (User) session.getAttribute("user");//user라는 객체를 가져옴.세션값을 가져와야 현재 접속한 아이디값을 얻을 수 있다.
		if(user.getId()==null) return "redirect:/user/login"; // 세션값에 아이디 없으면 로그인창으로

		Record re = new Record();

		re.setStudentId(stuId);
		re.setContent(counsel.getContent());
		recordMapper.update(re);

		String record = recordMapper.findContent(stuId);
		model.addAttribute("record",record);
		model.addAttribute("user",user);
		return "admin/admin_memo";
	}

	//superAdmin_manage GET
	@RequestMapping("superAdmin_manage")
	public String superAdmin_manage (Model model,HttpSession session) {
		User user = (User) session.getAttribute("user");//user라는 객체를 가져옴.세션값을 가져와야 현재 접속한 아이디값을 얻을 수 있다.

		model.addAttribute("list",userMapper.findByRole());
		model.addAttribute("user",user);

		return "admin/superAdmin_manage";
	}

	//superAdmin_create GET
	@RequestMapping(value="superAdmin_create", method=RequestMethod.GET)
	public String superAdmin_create (Model model, HttpSession session) {

		return "admin/superAdmin_create";
	}
	//superAdmin_create POST
	@RequestMapping(value="superAdmin_create", method=RequestMethod.POST)
	public String superAdmin_create (Model model,User user, HttpSession session) {
		User u = new User();
		u.setId(user.getId());
		u.setUserName(user.getUserName());
		u.setPassword(user.getPassword());
		u.setPhone(user.getPhone());
		u.setEmail(user.getEmail());
		u.setRole(user.getRole());
		userMapper.insert(u);
		return "admin/superAdmin_create";
	}

	//필수과목 수정 페이지
	@RequestMapping(value="admin_changeGraduation", method=RequestMethod.GET)
	public String admin_changeGraduation (Model model, HttpSession session) {

		return "admin_changeGraduation";
	}



}
