package com.cupbob.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.cupbob.dto.User_boardDTO;
import com.cupbob.persistance.mapper.BoardMapper;
import com.cupbob.service.IBoardService;

@Service("BoardService")
public class BoardService implements IBoardService {
	@Resource(name="BoardMapper")
	private BoardMapper boardMapper;
	@Override
	public List<User_boardDTO> getAdminBoardList() throws Exception {
		return boardMapper.getAdminBoardList();
	}
	@Override
	public User_boardDTO getAdminBoardDetail(User_boardDTO bdto) throws Exception {
		return boardMapper.getAdminBoardDetail(bdto);
	}
	@Override
	public int deleteAdminBoardDetailDelete(User_boardDTO bdto) throws Exception {
		return boardMapper.deleteAdminBoartDetailDelete(bdto);
	}
	
	@Override
	public void insertAdminBoard(User_boardDTO uDTO) throws Exception {
		boardMapper.insertAdminBoard(uDTO);
	}
	
	@Override
	public int updateAdminBoard(User_boardDTO uDTO) throws Exception {
		return boardMapper.updateAdminBoard(uDTO);
	}
	@Override
	public boolean deleteAdminAllCheck(User_boardDTO bdto) throws Exception{
		int result = boardMapper.deleteAdminBoardAllCheck(bdto);
		if(result != 0){
			return true;
		}else{
			return false;
		}
	}
}