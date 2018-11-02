package net.skhu.dto;

public class MySubject {
	String takeYear;
	String takeSemester;
	String subjectCode;
	String subjectName;
	String completionDivision;
	String credit; // 과목 학점
	String score; // 성적
	int id;
	String userId;
	String changeComplete;

	public MySubject(String takeYear, String takeSemester, String subjectCode, String subjectName,
			String completionDivision, String credit, String score, String userId) {
		this.takeYear = takeYear;
		this.takeSemester = takeSemester;
		this.subjectCode = subjectCode;
		this.subjectName = subjectName;
		this.completionDivision = completionDivision;
		this.credit = credit;
		this.score = score;
		this.userId = userId;
	}

	public String getTakeYear() {
		return takeYear;
	}
	public void setTakeYear(String takeYear) {
		this.takeYear = takeYear;
	}
	public String getTakeSemester() {
		return takeSemester;
	}
	public void setTakeSemester(String takeSemester) {
		this.takeSemester = takeSemester;
	}
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
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
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getChangeComplete() {
		return changeComplete;
	}
	public void setChangeComplete(String changeComplete) {
		this.changeComplete = changeComplete;
	}

}
