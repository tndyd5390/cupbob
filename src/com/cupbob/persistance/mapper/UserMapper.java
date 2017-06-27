package com.cupbob.persistance.mapper;

import java.util.List;
import com.cupbob.config.Mapper;
import com.cupbob.dto.User_infoDTO;


@Mapper("UserMapper")
public interface UserMapper {
	public List<User_infoDTO> getUserList() throws Exception;

	public User_infoDTO login(User_infoDTO uDTO);

	public void join(User_infoDTO uDTO);

	public int overlapEmail(User_infoDTO uDTO);
	public User_infoDTO getUserDetail(User_infoDTO udto);
	
	public int userDelete(User_infoDTO udto);

	public int updateUserDetail(User_infoDTO uDTO);

	public int deleteUserAllChecked(User_infoDTO uDTO) throws Exception;

	public List<User_infoDTO> userSearch(User_infoDTO uDTO) throws Exception;
}
