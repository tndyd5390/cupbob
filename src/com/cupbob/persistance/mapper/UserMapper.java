package com.cupbob.persistance.mapper;

import java.util.List;
import com.cupbob.config.Mapper;
import com.cupbob.dto.MilHistoryDTO;
import com.cupbob.dto.Product_infoDTO;
import com.cupbob.dto.User_infoDTO;


@Mapper("UserMapper")
public interface UserMapper {
	public List<User_infoDTO> getUserList() throws Exception;

	public User_infoDTO login(User_infoDTO uDTO)throws Exception;

	public void join(User_infoDTO uDTO)throws Exception;

	public int overlapEmail(User_infoDTO uDTO)throws Exception;
	
	public User_infoDTO getUserDetail(User_infoDTO udto)throws Exception;
	
	public int userDelete(User_infoDTO udto)throws Exception;

	public int updateUserDetail(User_infoDTO uDTO);
	
	public void updatePassword(User_infoDTO uDTO);
	
	public User_infoDTO userUpdateCheck(User_infoDTO uDTO);

	public int deleteUserAllChecked(User_infoDTO uDTO) throws Exception;

	public User_infoDTO getUserFindEmail(User_infoDTO uDTO) throws Exception;
	
	public User_infoDTO userFindEmail(User_infoDTO uDTO) throws Exception;
	
	public User_infoDTO getUserFindPw(User_infoDTO uDTO) throws Exception;
	
	public User_infoDTO userFindPw(User_infoDTO uDTO) throws Exception;
	
	public void updateTempPw(User_infoDTO tempdto) throws Exception;
	
	public List<User_infoDTO> userSearch(User_infoDTO uDTO) throws Exception;
	
	public List<Product_infoDTO> getUserMenuList() throws Exception;


	public List<MilHistoryDTO> getUserMileage(User_infoDTO uDTO) throws Exception;
}
