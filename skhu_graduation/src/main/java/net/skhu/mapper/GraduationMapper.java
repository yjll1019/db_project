package net.skhu.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.GraduationInput;
import net.skhu.dto.GraduationText;

@Mapper
public interface GraduationMapper {
	GraduationText findByDepartmentId(String departmentId, String division);
	String findCredit(String d, String cd, String year, String departmentId);
	void updateText(String content, String etc,String departmentId, String division);//졸업요건 표 수정 
	void updateInput(String departmentId, String year, String creditDivision, String division, String credit);
	
	List<GraduationInput> findByInput(String departmentId, String year, String creditDivision);
}
