package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.MySubject;

@Mapper
public interface MySubjectMapper {
	List<MySubject> findAll(String userId);//학생이 수강한 전체 과목을 조회.
	int findAllCount(String userId);
	List<MySubject> findByYearAndSemester(String userId, String takeYear, String takeSemester);
	int findByYearAndSemesterCount(String userId, String takeYear, String takeSemester);
	MySubject findByOneSubject(String userId, String subjectCode);
	void majorAdmit(MySubject mySubject);
	List<MySubject> findBySubjectType(String userId,String completionDivision);
	void deleteSubject(String userId, String subjectCode);
	void deleteById(String userId);
	void changeScore(String subjectCode, String score, String userId);
	
	List<MySubject> findMajor(String userId);//전필
	List<MySubject> findCultural(String userId);//교필
	int findPray(String userId);//채플
	int findService(String userId);//사회봉사
	
	// 엑셀 업로드
	void insert(List<MySubject> mySubjects);
	List<String> requiredMySubject(String userId);
	List<String> requiredSubject(String departmentId, String admissionYear);
	String getSubjectName(String subjectCode, String year);

}
