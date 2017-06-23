package com.cupbob.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cupbob.dto.Comment_infoDTO;
import com.cupbob.persistance.mapper.CommentMapper;
import com.cupbob.service.ICommentService;

@Service("CommentService")
public class CommentService implements ICommentService{

	@Resource(name="CommentMapper")
	private CommentMapper commentMapper;
	
	@Override
	public void createComment(Comment_infoDTO cDTO) throws Exception {
		commentMapper.createComment(cDTO);
	}
}
