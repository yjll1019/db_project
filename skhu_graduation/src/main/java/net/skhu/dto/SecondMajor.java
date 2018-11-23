package net.skhu.dto;

public class SecondMajor {

	String userId;
	String division;
	String departmentId;
	Department department;

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	@Override
	public String toString() {
		return "SecondMajor [userId=" + userId + ", division=" + division + ", departmentId=" + departmentId + "]";
	}

}
