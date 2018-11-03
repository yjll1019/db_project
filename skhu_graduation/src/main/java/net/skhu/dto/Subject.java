package net.skhu.dto;

public class Subject {
	String year;
	String semester;
	String code;
	String divisionClass;
	String departmentCode;
	String subjectName;
	String completionDivision;
	String credit;

	public Subject(String year, String semester, String code, String divisionClass, String departmentCode,
			String subjectName, String completionDivision, String credit) {
		this.year = year;
		this.semester = semester;
		this.code = code;
		this.divisionClass = divisionClass;
		this.departmentCode = departmentCode;
		this.subjectName = subjectName;
		this.completionDivision = completionDivision;
		this.credit = credit;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDivisionClass() {
		return divisionClass;
	}

	public void setDivisionClass(String divisionClass) {
		this.divisionClass = divisionClass;
	}

	public String getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getCompletionDivision() {
		return completionDivision;
	}

	public void setCompletionDivision(String completionDivision) {
		this.completionDivision = completionDivision;
	}

	public String getCredit() {
		return credit;
	}

	public void setCredit(String credit) {
		this.credit = credit;
	}

}
