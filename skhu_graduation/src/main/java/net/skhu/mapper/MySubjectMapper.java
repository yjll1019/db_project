package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.MySubject;

@Mapper
public interface MySubjectMapper {
	List<MySubject> findAll(String userId);//학생이 수강한 전체 과목을 조회.
	List<MySubject> findByMajorEssential(String userId);//학생이 수강한 전체 과목 중 전공필수과목을  조회.
	List<MySubject> findByMajorSelect(String userId);//학생이 수강한 전체 과목 중 전공선택과목을  조회.
	List<MySubject> findByRefinementEssential(String userId);//학생이 수강한 전체 과목 중 교양필수과목을  조회.
	List<MySubject> findByRefinementSelect(String userId);//학생이 수강한 전체 과목 중 교양선택과목을  조회.
}
