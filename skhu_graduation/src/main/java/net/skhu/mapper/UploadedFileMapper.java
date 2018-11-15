package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.UploadedFile;

@Mapper
public interface UploadedFileMapper {
	UploadedFile findOne(int id);
	List<UploadedFile> findByBoardId(int boardId);
	
	void insert(UploadedFile file);
	
	void deleteById(int id);
	void deleteByBoardId(int boardId);
}
