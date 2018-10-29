package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.User;

@Mapper
public interface UserMapper {

	int findOne(String id); //존재하지 않으면 0
	User login(String id); // null이면 존재하지 않는 id, 매개변수로 넘어온 id 값의 비밀번호를 가져옴
	void insert(User u);
	void changePassword(String id, String password);
	void updateAdmin(User u);
	User findById(String userId);
}
