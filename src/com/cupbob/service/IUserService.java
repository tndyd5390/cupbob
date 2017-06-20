package com.cupbob.service;

import java.util.List;

import com.cupbob.dto.User_infoDTO;

public interface IUserService {
	public List<User_infoDTO> getUserList()throws Exception;
}
