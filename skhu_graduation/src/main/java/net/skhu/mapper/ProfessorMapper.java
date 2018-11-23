package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Professor;

@Mapper
public interface ProfessorMapper {
	List<Professor> findOneWithUser(String userId);
	String findName(String userId);
	void updateProfessor(Professor p);
	Professor findOne(String userId);
}
