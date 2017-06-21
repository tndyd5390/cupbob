package com.cupbob.service;

import java.util.List;

import com.cupbob.dto.User_boardDTO;

public interface IBoardService {
	public List<User_boardDTO> getBoardList() throws Exception;
	public User_boardDTO getBoardDetail(User_boardDTO bdto) throws Exception;
	public int deleteBoardDetailDelete(User_boardDTO bdto) throws Exception;

	void insertBoard(User_boardDTO uDTO) throws Exception;
	public void updateBoard(User_boardDTO bdto) throws Exception;
}
