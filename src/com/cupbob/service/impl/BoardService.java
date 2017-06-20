package com.cupbob.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.cupbob.dto.Tmp_boardDTO;
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
}