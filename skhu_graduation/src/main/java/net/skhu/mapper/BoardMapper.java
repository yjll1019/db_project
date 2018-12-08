package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Board;
import net.skhu.dto.Uploadedfile;
import net.skhu.model.Pagination;

@Mapper
public interface BoardMapper {
	Board findOne(int boardId);
	List<Board> findAll();
	List<Board> findByName(String userName);
	List<Board> findByTitle(String title);

	int lastBoardId();

	void insertNotice(Board board);
	void insertQuestion(Board board);
	void insertAnswer(Board board);

	void updateNotice(Board board);
	void updateQuestion(Board board);
	void updateAnswer(Board board);

	void deleteNotice(int boardId);
	void deleteQuestion(int boardId);
	void deleteAnswer(int boardId);

	//file upload
	Uploadedfile findOneById(int id);
	List<Uploadedfile> findAllByboardId(int boardId);
	void insert(Uploadedfile uploadedFile);
	void delete(int id);
	void deleteByBoardId(int boardId);

	//pagination
	List<Board> findByType(Pagination pagination);
	int count(Pagination pagination);
}
