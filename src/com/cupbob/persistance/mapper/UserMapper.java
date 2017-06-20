package com.cupbob.persistance.mapper;

import java.util.List;
import com.cupbob.config.Mapper;
<<<<<<< HEAD
import com.cupbob.dto.User_boardDTO;
=======
>>>>>>> refs/remotes/origin/moon
import com.cupbob.dto.User_infoDTO;


@Mapper("UserMapper")
public interface UserMapper {
	public List<User_infoDTO> getUserList() throws Exception;

	public User_infoDTO login(User_infoDTO uDTO);
}
