package com.cupbob.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.cupbob.dto.User_infoDTO;
import com.cupbob.persistance.mapper.UserMapper;
import com.cupbob.service.IUserService;


@Service("UserService")
public class UserService implements IUserService {
	@Resource(name="UserMapper")
	private UserMapper userMapper;

	@Override
	public List<User_infoDTO> getUserList() throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getUserList();
	}

	@Override
	public User_infoDTO login(User_infoDTO uDTO) {
		System.out.println(uDTO.getUser_id());
		return userMapper.login(uDTO);
	}
	
	
}
