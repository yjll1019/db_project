package net.skhu.mapper;
import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.GraduationText;

@Mapper
public interface GraduationMapper {
	GraduationText findByDepartmentId(String departmentId, String division);
	String findCredit(String d, String cd, String year, String departmentId);
}
