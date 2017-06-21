package com.cupbob.persistance.mapper;

import java.util.List;

import com.cupbob.config.Mapper;
import com.cupbob.dto.Tmp_boardDTO;
import com.cupbob.dto.User_boardDTO;

@Mapper("BoardMapper")
public interface BoardMapper {
	public List<User_boardDTO> getBoardList() throws Exception;
	public User_boardDTO getBoardDetail(User_boardDTO bdto) throws Exception;
	public int deleteBoartDetailDelete(User_boardDTO bdto) throws Exception;
	public int updateBoard(User_boardDTO uDTO) throws Exception;
	public int deleteBoardAllCheck(User_boardDTO bdto) throws Exception;
	void insertBoard(User_boardDTO bDTO) throws Exception;
}
