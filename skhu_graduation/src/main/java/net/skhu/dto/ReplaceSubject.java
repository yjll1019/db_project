package net.skhu.dto;

public class ReplaceSubject {
	int id;
	String subjectCode;
	String replaceSubject;
	String replaceSubjectName;//대체과목 이름 join
	Subject subject;
	Department department;
	String name;

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	String completionDivision;
	/* 과목코드가 아닌 경우
	 *  전공선택과목 또는 교양선택과목으로 대체
	*/
	public ReplaceSubject() {

	}

	
	public ReplaceSubject(String subjectCode, String replaceSubject, String completionDivision) {
		this.subjectCode = subjectCode;
		this.replaceSubject = replaceSubject;
		this.completionDivision = completionDivision;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getReplaceSubject() {
		return replaceSubject;
	}

	public void setReplaceSubject(String replaceSubject) {
		this.replaceSubject = replaceSubject;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public String getReplaceSubjectName() {
		return replaceSubjectName;
	}

	public void setReplaceSubjectName(String replaceSubjectName) {
		this.replaceSubjectName = replaceSubjectName;
	}

	public String getCompletionDivision() {
		return completionDivision;
	}

	public void setCompletionDivision(String completionDivision) {
		this.completionDivision = completionDivision;
	}


}
