package com.cupbob.persistance.mapper;

import java.util.List;
import com.cupbob.config.Mapper;
import com.cupbob.dto.User_boardDTO;
import com.cupbob.dto.User_infoDTO;


@Mapper("UserMapper")
public interface UserMapper {
	public List<User_infoDTO> getUserList() throws Exception;
}
