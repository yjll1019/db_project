package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RequiredSubjectMapper {
	
	List<String> findByConditions(String admissionYear, String grade, String semester);
	int requiredCount(String admissionYear);
	int myRequiredCount(String admissionYear);
}
