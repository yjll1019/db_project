package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.SecondMajor;
@Mapper
public interface SecondMajorMapper {
	SecondMajor findOneById(String userId);
	void insert(SecondMajor sm);
	List<SecondMajor> findAll();
	void update(SecondMajor sm);
}
