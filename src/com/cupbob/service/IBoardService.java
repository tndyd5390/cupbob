package com.cupbob.service;

import java.util.List;

import com.cupbob.dto.User_boardDTO;

public interface IBoardService {
	public List<User_boardDTO> getAdminBoardList() throws Exception;
	public User_boardDTO getAdminBoardDetail(User_boardDTO bdto) throws Exception;
	public int deleteAdminBoardDetailDelete(User_boardDTO bdto) throws Exception;
	public int updateAdminBoard(User_boardDTO bdto) throws Exception;
	public void insertAdminBoard(User_boardDTO bDTO) throws Exception;
	public boolean deleteAdminAllCheck(User_boardDTO bdto) throws Exception;
	public List<User_boardDTO> boardTitleSearch(User_boardDTO bDTO) throws Exception;
	public List<User_boardDTO> boardNameSearch(User_boardDTO bDTO) throws Exception;
	public List<User_boardDTO> boardContentSearch(User_boardDTO bDTO) throws Exception;
	public List<User_boardDTO> getReadMoreList(User_boardDTO uDTO) throws Exception;
	public boolean updateUserBoard(User_boardDTO uDTO) throws Exception;
}
