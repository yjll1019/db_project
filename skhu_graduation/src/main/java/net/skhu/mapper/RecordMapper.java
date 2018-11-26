package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Record;

@Mapper
public interface RecordMapper {

	void update(Record r);
	String findContent(String stuId);
}
