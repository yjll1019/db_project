package net.skhu.dto;

//User(학생, 교수, 관리자) dto
public class User {
	String id;
	String password;
	String userName;
	String email;
	String phone;
	String role; //학생, 교수, 관리자

	//
	String confirmPassword;
	String secondMajorDepartmentId;
	String doubleMajor;
	String subMajor;
	
	String division;

	//밑으로는 student 테이블 추가를 위한 변수들
	String stuSemester; //학기
	String stuClass; //반
	String transferStudent; //편입 여부 >> 1이면 편입생
	String volunteerExemption; //사회봉사 면제여부 >> 1이면 면제
	String departmentId; //학과
	String howToGraduate; //전공기초, 심화

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

	//student테이블 추가를 위한 get/set
	public String getStuSemester() {
		return stuSemester;
	}
	public void setStuSemester(String stuSemester) {
		this.stuSemester = stuSemester;
	}
	public String getStuClass() {
		return stuClass;
	}
	public void setStuClass(String stuClass) {
		this.stuClass = stuClass;
	}
	public String getTransferStudent() {
		return transferStudent;
	}
	public void setTransferStudent(String transferStudent) {
		this.transferStudent = transferStudent;
	}
	public String getVolunteerExemption() {
		return volunteerExemption;
	}
	public void setVolunteerExemption(String volunteerExemption) {
		this.volunteerExemption = volunteerExemption;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public String getHowToGraduate() {
		return howToGraduate;
	}
	public void setHowToGraduate(String howToGraduate) {
		this.howToGraduate = howToGraduate;
	}

	//
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getSecondMajorDepartmentId() {
		return secondMajorDepartmentId;
	}
	public void setSecondMajorDepartmentId(String secondMajorDepartmentId) {
		this.secondMajorDepartmentId = secondMajorDepartmentId;
	}
	public String getDoubleMajor() {
		return doubleMajor;
	}
	public void setDoubleMajor(String doubleMajor) {
		this.doubleMajor = doubleMajor;
	}
	public String getSubMajor() {
		return subMajor;
	}
	public void setSubMajor(String subMajor) {
		this.subMajor = subMajor;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", userName=" + userName + ", email=" + email + ", phone="
				+ phone + ", role=" + role + ", confirmPassword=" + confirmPassword + ", secondMajorDepartmentId="
				+ secondMajorDepartmentId + ", doubleMajor=" + doubleMajor + ", subMajor=" + subMajor + ", division="
				+ division + ", stuSemester=" + stuSemester + ", stuClass=" + stuClass + ", transferStudent="
				+ transferStudent + ", volunteerExemption=" + volunteerExemption + ", departmentId=" + departmentId
				+ ", howToGraduate=" + howToGraduate + "]";
	}
	
}
