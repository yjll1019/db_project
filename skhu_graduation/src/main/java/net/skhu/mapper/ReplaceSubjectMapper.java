package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.AdminReplaceListDTO;
import net.skhu.dto.ReplaceSubject;
import net.skhu.model.Option;
import net.skhu.model.Pagination;

/*
 * 검색 조건을 지정하기 위한 select 태그의 option 태그를 뷰에서 출력하기 위한 데이터이다.

   화면에서 선택된 검색 조건 값은 Pagination 모델 객체의 sb 멤버 변수에 담겨서

   액션 메소드에 전달된다.

 */
@Mapper
public interface ReplaceSubjectMapper {
	void insert(List<ReplaceSubject> replaceSubjects);
	void insertSubject(String deleteCode, String replaceCode);
	void insertWithCompletionDivision(String deleteCode, String completionDivision);
	void deleteSubject(String deleteCode, String replaceCode);
	void deleteWithCompletionDivision(String deleteCode, String completionDivision);
	void deleteReplace(String subjectCode);
	void deleteReplaceSubject(String subjectCode, String replaceSubject);
	int count(Pagination pagination);
	List<ReplaceSubject> findAll();
	List<AdminReplaceListDTO> findByType(Pagination pagination);
	List<ReplaceSubject> findByDepartment(int id);
	List<String> replaceSubject();
	List<ReplaceSubject> findReplaceSub();
	ReplaceSubject findOneSubject(String code);

	Option[] searchBy = { new Option(0,"검색 조건"), new Option(1,"과목코드"),
							new Option(2,"과목명")};


}
