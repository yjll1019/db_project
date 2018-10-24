package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.User;

@Mapper
public interface UserMapper {
	
	int findOne(String id);//존재하지 않으면 0
	void insert(User u);

}
