package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Counsel;

@Mapper
public interface CounselMapper {
	void insert(Counsel c);
	void update(Counsel c);
	String findContent(String proId, String stuId);

}
