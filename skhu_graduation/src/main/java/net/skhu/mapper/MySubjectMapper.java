package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.MySubject;
import net.skhu.dto.RequiredSubject;

@Mapper
public interface MySubjectMapper {
	List<MySubject> findAll(String userId);//학생이 수강한 전체 과목을 조회.
	int findAllCount(String userId);
	List<MySubject> findByYearAndSemester(String userId, String takeYear, String takeSemester);
	int findByYearAndSemesterCount(String userId, String takeYear, String takeSemester);
	MySubject findByOneSubject(String userId, String subjectCode);
	void majorAdmit(MySubject mySubject);
	List<MySubject> findBySubjectType(String userId,String completionDivision);
	void deleteById(String userId);

	List<MySubject> findMajor(String userId);//전필
	String findMajorCount(String userId);
	List<MySubject> findCultural(String userId);//교필
	List<MySubject> findSubMajor(String userId,String departmentId);//부/복수전공
	int findPray(String userId);//채플
	int findService(String userId);//사회봉사

	// 엑셀 업로드
	void insert(List<MySubject> mySubjects);
	List<String> requiredMySubject(String userId);
	List<String> requiredSubject(String departmentId, String admissionYear);
	String getSubjectName(String subjectCode, String year);

	//대체과목
	RequiredSubject findByOneRequiredSubject(String userId, String subjectCode); //대체 될 필수 과목 찾기
	void changeSubject(String beforeCode,String changeCode, String changeName, String userId);//대체과목 초수강 과목 코드, 이름 바꾸기
	void deleteSubject(String userId, String subjectCode); //재수강 대체과목 삭제하기
	void changeScore(String subjectCode, String score, String userId); //대체과목 재수강 성적 바꾸기
	List<String> mySubject(String userId);

	//전공인정
	List<String> findAllForMajorAdmit(String userId);
}
