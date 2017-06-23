package com.cupbob.persistance.mapper;

import com.cupbob.config.Mapper;
import com.cupbob.dto.Comment_infoDTO;

@Mapper("CommentMapper")
public interface CommentMapper {

	void createComment(Comment_infoDTO cDTO) throws Exception;

}
