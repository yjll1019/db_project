package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.RequiredSubject;

@Mapper
public interface RequiredSubjectMapper {
	
	List<String> findByConditions(String admissionYear, String grade, String semester);
	List<String> findByConditionsForFreshman(String admissionYear, String grade, String semester);
	String findBySubjectName(String subjectCode);
	int requiredCount(String admissionYear);
	int myRequiredCount(String admissionYear);
	List<RequiredSubject> findByReSub(String departmentId, String year, String grade);
	void insert(String departmentId, String year, String grade, String semester, String subjectCode);
	void delete(String departmentId, String year, String grade, String semester, String subjectCode);
}
