package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.ReplaceSubject;

@Mapper
public interface ReplaceSubjectMapper {
	void insert(List<ReplaceSubject> replaceSubjects);
	List<ReplaceSubject> findAll();
	List<ReplaceSubject> findByDepartment(int id);
}
