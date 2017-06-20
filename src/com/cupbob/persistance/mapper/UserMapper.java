package com.cupbob.persistance.mapper;

import java.util.List;
import com.cupbob.config.Mapper;
import com.cupbob.dto.User_infoDTO;


@Mapper("UserMapper")
public interface UserMapper {
	public List getUserList();

	public User_infoDTO login(User_infoDTO uDTO);
}
