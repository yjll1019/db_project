package net.skhu.dto;

//학생 dto
public class Student {

	String userId; //학번
	String stuSemester; //학기
	String stuClass; //반
	String transferStudent; //편입 여부 >> 1이면 편입생
	String volunteerExemption; //사회봉사 면제여부 >> 1이면 면제
	String departmentId; //학과
	String howToGraduate; //전공기초, 심화
	String subMajor;

	String pId;// 지도교수Id
	String pName;//지도교수 Name
	String secondMajorName;

	int major;//전필
	int cultural;//교필
	int value;//부/복수전공
	int pray;//채플
	int service;//사회봉사

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
	public SecondMajor getSecondMajor() {
		return secondMajor;
	}
	public void setSecondMajor(SecondMajor secondMajor) {
		this.secondMajor = secondMajor;
	}

	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getSubMajor() {
		return subMajor;
	}
	public void setSubMajor(String subMajor) {
		this.subMajor = subMajor;
	}

	public String getSecondMajorName() {
		return secondMajorName;
	}
	public void setSecondMajorName(String secondMajorName) {
		this.secondMajorName = secondMajorName;
	}

	public int getMajor() {
		return major;
	}
	public void setMajor(int major) {
		this.major = major;
	}
	public int getCultural() {
		return cultural;
	}
	public void setCultural(int cultural) {
		this.cultural = cultural;
	}
	public int getPray() {
		return pray;
	}
	public void setPray(int pray) {
		this.pray = pray;
	}

	public int getService() {
		return service;
	}
	public void setService(int service) {
		this.service = service;
	}

	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "Student [userId=" + userId + ", stuSemester=" + stuSemester + ", stuClass=" + stuClass
				+ ", transferStudent=" + transferStudent + ", volunteerExemption=" + volunteerExemption
				+ ", departmentId=" + departmentId + ", howToGraduate=" + howToGraduate + ", subMajor=" + subMajor
				+ ", user=" + user + ", secondMajor=" + secondMajor + "]";
	}

}
