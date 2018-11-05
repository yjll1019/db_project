package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.SecondMajor;
@Mapper
public interface SecondMajorMapper {
	SecondMajor findOneById(String userId);
	void insert(SecondMajor sm);
}
