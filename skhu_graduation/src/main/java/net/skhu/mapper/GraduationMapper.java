package net.skhu.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.GraduationText;

@Mapper
public interface GraduationMapper {
	List<GraduationText> findByDepartment(String departmentId);

}
