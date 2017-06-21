package com.cupbob.service;

import java.util.List;

import com.cupbob.dto.User_infoDTO;

public interface IUserService {
	public List<User_infoDTO> getUserList()throws Exception;
	
	
	public User_infoDTO login(User_infoDTO uDTO) throws Exception;


	public void join(User_infoDTO uDTO) throws Exception;


	public int overlapEmail(User_infoDTO uDTO) throws Exception;
	
}
