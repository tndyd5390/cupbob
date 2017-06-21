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
	public List<User_boardDTO> getBoardList() throws Exception {
		return boardMapper.getBoardList();
	}
	@Override
	public User_boardDTO getBoardDetail(User_boardDTO bdto) throws Exception {
		return boardMapper.getBoardDetail(bdto);
	}
	@Override
	public int deleteBoardDetailDelete(User_boardDTO bdto) throws Exception {
		return boardMapper.deleteBoartDetailDelete(bdto);
	}
	
	@Override
	public void insertBoard(User_boardDTO uDTO) throws Exception {
		boardMapper.insertBoard(uDTO);
	}
	
	@Override
	public int updateBoard(User_boardDTO uDTO) throws Exception {
		return boardMapper.updateBoard(uDTO);
	}
	@Override
	public boolean deleteAllCheck(User_boardDTO bdto) throws Exception{
		int result = boardMapper.deleteBoardAllCheck(bdto);
		if(result != 0){
			return true;
		}else{
			return false;
		}
	}
}