package com.cupbob.service;

import java.util.List;

import com.cupbob.dto.Comment_infoDTO;

public interface ICommentService {

	public void createComment(Comment_infoDTO cDTO) throws Exception;

	public List<Comment_infoDTO> getCommentList(Comment_infoDTO cDTO) throws Exception;

	public void deleteComment(Comment_infoDTO cDTO) throws Exception;

	public void updateComment(Comment_infoDTO cDTO) throws Exception;

}
