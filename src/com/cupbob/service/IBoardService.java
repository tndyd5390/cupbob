package com.cupbob.service;

import java.util.List;

import com.cupbob.dto.User_boardDTO;

public interface IBoardService {
	public List<User_boardDTO> getBoardList() throws Exception;

	void insertBoard(User_boardDTO uDTO) throws Exception;
}
