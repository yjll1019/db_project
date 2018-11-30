package net.skhu.dto;

public class GraduationInput {
	String departmentId;
	String admissionYear;//입학년도
	String division;//0~5까지 구분
	String creditDivision; //전공or전필
	String credit; //학점

	//SecondMajor
	String userId;
	String SeDivision;
	String SeDepartmentId;
	String SeCredit;//부/복수전공 학점

	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public String getAdmissionYear() {
		return admissionYear;
	}
	public void setAdmissionYear(String admissionYear) {
		this.admissionYear = admissionYear;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getCreditDivision() {
		return creditDivision;
	}
	public void setCreditDivision(String creditDivision) {
		this.creditDivision = creditDivision;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}


	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSeDivision() {
		return SeDivision;
	}
	public void setSeDivision(String seDivision) {
		SeDivision = seDivision;
	}
	public String getSeDepartmentId() {
		return SeDepartmentId;
	}
	public void setSeDepartmentId(String seDepartmentId) {
		SeDepartmentId = seDepartmentId;
	}

	public String getSeCredit() {
		return SeCredit;
	}
	public void setSeCredit(String seCredit) {
		SeCredit = seCredit;
	}
	@Override
	public String toString() {
		return "GraduationInput [departmentId=" + departmentId + ", admissionYear=" + admissionYear + ", division="
				+ division + ", creditDivision=" + creditDivision + ", credit=" + credit + ", userId=" + userId
				+ ", SeDivision=" + SeDivision + ", SeDepartmentId=" + SeDepartmentId + ", SeCredit=" + SeCredit + "]";
	}
}
