package com.cupbob.service;

import java.util.List;

import com.cupbob.dto.User_infoDTO;

public interface IUserService {
	public List getUserList();
	
	
	public User_infoDTO login(User_infoDTO uDTO);
	
}
