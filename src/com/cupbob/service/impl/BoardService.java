package com.cupbob.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.cupbob.persistance.mapper.BoardMapper;
import com.cupbob.service.IBoardService;

@Service("BoardService")
public class BoardService implements IBoardService {
	@Resource(name="BoardMapper")
	private BoardMapper boardMapper;
}
