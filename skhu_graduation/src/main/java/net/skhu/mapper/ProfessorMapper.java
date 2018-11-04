package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Professor;

@Mapper
public interface ProfessorMapper {

	Professor findById(String userId);
	void updateProfessor(Professor p);
}
