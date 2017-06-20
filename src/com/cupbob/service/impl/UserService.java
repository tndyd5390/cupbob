package com.cupbob.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.cupbob.persistance.mapper.UserMapper;
import com.cupbob.service.IUserService;


@Service("UserService")
public class UserService implements IUserService {
	@Resource(name="UserMapper")
	private UserMapper userMapper;

	@Override
	public List getUserList() {
		return userMapper.getUserList();
	}
	
	
}
