package com.cupbob.service;

import com.cupbob.dto.Comment_infoDTO;

public interface ICommentService {

	public void createComment(Comment_infoDTO cDTO) throws Exception;

}
