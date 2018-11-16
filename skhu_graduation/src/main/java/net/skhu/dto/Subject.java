package net.skhu.dto;

public class Subject {
	String year;
	String semester;
	String code;
	String divisionClass;
	String departmentId;
	String subjectName;
	String completionDivision;
	String credit;
	Department department;

	//폐지 과목 위함
	String DeleteYear;
	String DeleteSemester;
	String DeleteCode;
	String DeleteDepartmentId;
	String DeleteSubjectName;

	public Subject() {

	}

	public Subject(String year, String semester, String code, String divisionClass, String departmentId,
			String subjectName, String completionDivision, String credit) {
		this.year = year;
		this.semester = semester;
		this.code = code;
		this.divisionClass = divisionClass;
		this.departmentId = departmentId;
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

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
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

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public String getDeleteYear() {
		return DeleteYear;
	}

	public void setDeleteYear(String deleteYear) {
		DeleteYear = deleteYear;
	}

	public String getDeleteSemester() {
		return DeleteSemester;
	}

	public void setDeleteSemester(String deleteSemester) {
		DeleteSemester = deleteSemester;
	}

	public String getDeleteCode() {
		return DeleteCode;
	}

	public void setDeleteCode(String deleteCode) {
		DeleteCode = deleteCode;
	}

	public String getDeleteDepartmentId() {
		return DeleteDepartmentId;
	}

	public void setDeleteDepartmentId(String deleteDepartmentId) {
		DeleteDepartmentId = deleteDepartmentId;
	}

	public String getDeleteSubjectName() {
		return DeleteSubjectName;
	}

	public void setDeleteSubjectName(String deleteSubjectName) {
		DeleteSubjectName = deleteSubjectName;
	}


}
