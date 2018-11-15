package net.skhu.dto;

//학생 dto
public class Student {

	String userId; //학번
	String stuSemester; //학기
	String stuClass; //반
	int transferStudent; //편입 여부 >> 1이면 편입생
	int volunteerExemption; //사회봉사 면제여부 >> 1이면 면제
	String departmentId; //학과
	String howToGraduate; //전공기초, 심화
	String subMajor;
	
	
	public String getSubMajor() {
		return subMajor;
	}
	public void setSubMajor(String subMajor) {
		this.subMajor = subMajor;
	}
	User user;
	Department department;
	SecondMajor secondMajor;

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

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

	public int getTransferStudent() {
		return transferStudent;
	}
	public void setTransferStudent(int transferStudent) {
		this.transferStudent = transferStudent;
	}

	public int getVolunteerExemption() {
		return volunteerExemption;
	}
	public void setVolunteerExemption(int volunteerExemption) {
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
	public SecondMajor getSecondMajor() {
		return secondMajor;
	}
	public void setSecondMajor(SecondMajor secondMajor) {
		this.secondMajor = secondMajor;
	}


}
