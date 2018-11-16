package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Subject;

@Mapper
public interface SubjectMapper {
	void insert(List<Subject> subjects);
	int findDelete(List<String> deleteSubject);
	int findReplace(List<String> replaceSubject);
}
