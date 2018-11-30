package net.skhu.dto;

public class Counsel {

	String professorId;
	String studentId;
	String content;

	public String getProfessorId() {
		return professorId;
	}
	public void setProfessorId(String professorId) {
		this.professorId = professorId;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Counsel [professorId=" + professorId + ", studentId=" + studentId + ", content=" + content + "]";
	}


}
