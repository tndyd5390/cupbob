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
		return userMapper.getUserList();
	}

	@Override
	public User_infoDTO login(User_infoDTO uDTO) throws Exception{
		return userMapper.login(uDTO);
	}
	@Override
	public void join(User_infoDTO uDTO) throws Exception{
		userMapper.join(uDTO);
	}

	@Override
	public User_infoDTO getUserDetail(User_infoDTO udto) throws Exception {
		return userMapper.getUserDetail(udto);
	}

	@Override
	public int userDelete(User_infoDTO udto) throws Exception {
		return userMapper.userDelete(udto);
	}
	
	@Override
	public int overlapEmail(User_infoDTO uDTO) throws Exception {
		return userMapper.overlapEmail(uDTO);
	}

	@Override
	public void updateUserDetail(User_infoDTO uDTO) {
		userMapper.updateUserDetail(uDTO);
	}
	
}
