package net.skhu.dto;

public class GraduationText {
	
	int textId;
	String departmentId;
	String division;
	String graduationContent;
	String graduationEtc;
	String name;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTextId() {
		return textId;
	}
	public void setTextId(int textId) {
		this.textId = textId;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getGraduationContent() {
		return graduationContent;
	}
	public void setGraduationContent(String graduationContent) {
		this.graduationContent = graduationContent;
	}
	public String getGraduationEtc() {
		return graduationEtc;
	}
	public void setGraduationEtc(String graduationEtc) {
		this.graduationEtc = graduationEtc;
	}
	

}
