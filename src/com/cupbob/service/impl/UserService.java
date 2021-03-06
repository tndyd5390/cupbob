package com.cupbob.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.cupbob.dto.MilHistoryDTO;
import com.cupbob.dto.Product_infoDTO;
import com.cupbob.dto.User_infoDTO;
import com.cupbob.persistance.mapper.UserMapper;
import com.cupbob.service.IUserService;
import com.cupbob.util.CmmUtil;


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
	public User_infoDTO userUpdateCheck(User_infoDTO uDTO) throws Exception{
		return userMapper.userUpdateCheck(uDTO);
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
	public int updateUserDetail(User_infoDTO uDTO){
		if(!CmmUtil.nvl(uDTO.getPassword()).equals("")){
			userMapper.updatePassword(uDTO);
		}
		return userMapper.updateUserDetail(uDTO);
	}
	
	
	
	@Override
	public boolean deleteUserAllChecked(User_infoDTO uDTO) throws Exception{
		System.out.println(uDTO.getAllCheck().length);
		System.out.println(uDTO.getUser_no());
		int result = userMapper.deleteUserAllChecked(uDTO);
		if(result != 0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public User_infoDTO getUserFindEmail(User_infoDTO udto) throws Exception{
		System.out.println(udto.getGender());
		if(udto.getGender()==null){
			return userMapper.getUserFindEmail(udto);
		}else{
			return userMapper.userFindEmail(udto);
		}
	}

	@Override
	public User_infoDTO getUserFindPw(User_infoDTO udto) throws Exception {
		// TODO Auto-generated method stub
		User_infoDTO userDTO = null;
		if(udto.getGender()==null){
			userDTO = userMapper.getUserFindPw(udto);
		}else{
			userDTO = userMapper.userFindPw(udto);
		}
		
		if(userDTO != null){
			long temp_Pw = (long)(Math.random()*9000000000l) + 1000000000l;
			String temp_password = Long.toHexString(temp_Pw);
			
			User_infoDTO tempdto = new User_infoDTO();
			tempdto.setUser_name(udto.getUser_name());
			tempdto.setEmail(udto.getEmail());
			tempdto.setBirthday(udto.getBirthday());
			tempdto.setTemp_pw(temp_password);
			
			userMapper.updateTempPw(tempdto);
			
			userDTO.setPassword(temp_password);
			return userDTO;
		}else{
			return null;
		}
	}
	
	@Override
	public List<User_infoDTO> userSearch(User_infoDTO uDTO) throws Exception{
		return userMapper.userSearch(uDTO);
	}

	@Override
	public List<MilHistoryDTO> getUserMileage(User_infoDTO uDTO) throws Exception {
		return userMapper.getUserMileage(uDTO);
	}
}
