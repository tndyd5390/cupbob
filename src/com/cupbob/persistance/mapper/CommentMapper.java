package com.cupbob.persistance.mapper;

import java.util.List;

import com.cupbob.config.Mapper;
import com.cupbob.dto.Comment_infoDTO;

@Mapper("CommentMapper")
public interface CommentMapper {

	void createComment(Comment_infoDTO cDTO) throws Exception;

	List<Comment_infoDTO> getCommentList(Comment_infoDTO cDTO) throws Exception;

	void deleteComment(Comment_infoDTO cDTO) throws Exception;

}
