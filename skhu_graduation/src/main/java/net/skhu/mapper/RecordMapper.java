package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Record;

@Mapper
public interface RecordMapper {
	void insert(Record r);
	void update(Record r);
	String findContent(String stuId);
}
