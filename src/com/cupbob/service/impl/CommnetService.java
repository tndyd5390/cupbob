package com.cupbob.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cupbob.persistance.mapper.CommentMapper;
import com.cupbob.service.ICommentService;

@Service("CommentService")
public class CommnetService implements ICommentService{
	@Resource(name="CommentMapper")
	private CommentMapper commentMapper;
}
