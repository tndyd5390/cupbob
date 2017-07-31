package com.cupbob.service.impl;

import java.util.List;

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

	@Override
	public List<Comment_infoDTO> getCommentList(Comment_infoDTO cDTO) throws Exception {
		return commentMapper.getCommentList(cDTO);
	}

	@Override
	public void deleteComment(Comment_infoDTO cDTO) throws Exception {
		commentMapper.deleteComment(cDTO);
	}

	@Override
	public void updateComment(Comment_infoDTO cDTO) throws Exception {
		commentMapper.updateComment(cDTO);
	}
}
