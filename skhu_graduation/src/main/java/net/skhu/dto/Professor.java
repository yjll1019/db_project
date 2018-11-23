package net.skhu.dto;

public class Professor {
	String userId;
	String departmentId; //소속학과
	String grade; // 담당 학년
	String group; // 담당 반. 원래는 class임.

	//department
	Department department;

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	@Override
	public String toString() {
		return "Professor [userId=" + userId + ", departmentId=" + departmentId + ", grade=" + grade + ", group="
				+ group + ", department=" + department + "]";
	}


}
