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
		boardMapper.updateViewCNT(bdto);
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
		System.out.println(bdto.getPost_no());
		System.out.println(bdto.getAllCheck().length);
		int result = boardMapper.deleteAdminBoardAllCheck(bdto);
		if(result != 0){
			return true;
		}else{
			return false;
		}
	}
	
	@Override
	public List<User_boardDTO> boardTitleSearch(User_boardDTO bDTO) throws Exception{
		return boardMapper.boardTitleSearch(bDTO);
	}
	@Override
	public List<User_boardDTO> boardNameSearch(User_boardDTO bDTO) throws Exception{
		return boardMapper.boardNameSearch(bDTO);
	}
	@Override
	public List<User_boardDTO> boardContentSearch(User_boardDTO bDTO) throws Exception{
		return boardMapper.boardContentSearch(bDTO);
	}
	@Override
	public List<User_boardDTO> getReadMoreList(User_boardDTO bDTO) throws Exception{
		System.out.println(bDTO.getReadmore());
		return boardMapper.getReadMoreList(bDTO);
	}
	@Override
	public boolean updateUserBoard(User_boardDTO uDTO) throws Exception {
		boolean result = false;
		int resultInt = 0;
		resultInt = boardMapper.updateUserBoard(uDTO);
		if(resultInt != 0){
			result = true;
		}
		return result;
	}
	
}