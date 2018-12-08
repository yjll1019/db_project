package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Subject;
import net.skhu.model.Option;
import net.skhu.model.Pagination;

@Mapper
public interface SubjectMapper {
	void insert(List<Subject> subjects);
	int findDelete(Subject deleteSubject); //폐지과목 정보 여부 확인
	int findReplace(Subject replaceSubject);//대체과목 정보 여부 확인
	List<Subject>findByType(Pagination pagination);//전체과목 조회
	int count(Pagination pagination);
	Option[] searchBy = { new Option(0,"검색 조건"), new Option(1,"과목코드"),
			new Option(2,"과목명")};
}
