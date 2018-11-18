package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Subject;

@Mapper
public interface SubjectMapper {
	void insert(List<Subject> subjects);
	int findDelete(Subject deleteSubject); //폐지과목 정보 여부 확인
	int findReplace(Subject replaceSubject);//대체과목 정보 여부 확인
}
