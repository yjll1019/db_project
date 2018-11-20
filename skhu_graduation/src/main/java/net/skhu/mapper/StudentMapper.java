package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Student;

@Mapper
public interface StudentMapper {

	void insert(Student s); //회원가입 조건 충족 시 insert
	void update(Student s);
	void updateForInfo(Student s);
	Student stuInfo(String userId);
	Student findOneWithUser(String userId);
	Student findOneWithProfessor(String userId);
	List<Student> findAllWithUser();
	List<Student> findById(String userId);
	List<Student> findByName(String userName);
	List<Student> findByGrade(String semester1, String semester2);
}
