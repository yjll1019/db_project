package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Counsel;

@Mapper
public interface CounselMapper {

	Counsel findAll(String id);

}
