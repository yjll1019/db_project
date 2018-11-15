package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Board;
import net.skhu.dto.UploadedFile;

@Mapper
public interface BoardMapper {
	Board findOne(int boardId);
	List<Board> findAll();
	List<Board> findByName(String userName);
	List<Board> findByTitle(String title);
	
	void insertNotice(Board board);
	void insertQuestion(Board board);
	void insertAnswer(Board board);
	
	void updateNotice(Board board);
	void updateQuestion(Board board);
	void updateAnswer(Board board);
	
	void deleteNotice(int boardId);
	void deleteQuestion(int boardId);
	void deleteAnswer(int boardId);
}
