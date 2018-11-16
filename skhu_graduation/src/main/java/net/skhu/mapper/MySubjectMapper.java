package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.MySubject;
import net.skhu.dto.ReplaceSubject;

@Mapper
public interface MySubjectMapper {
	List<MySubject> findAll(String userId);//학생이 수강한 전체 과목을 조회.
	int findAllCount(String userId);
	List<MySubject> findByYearAndSemester(String userId, String takeYear, String takeSemester);
	int findByYearAndSemesterCount(String userId, String takeYear, String takeSemester);
	MySubject findByOneSubject(String userId, String subjectCode);
	
	// 엑셀파일 업로드
	void insert(List<MySubject> mySubjects);
}
