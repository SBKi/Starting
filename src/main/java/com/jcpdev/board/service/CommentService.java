package com.jcpdev.board.service;

import com.jcpdev.board.entity.CommentEntity;
import com.jcpdev.board.model.Comment;

public interface CommentService {
	
	default CommentEntity toEntity(Comment dto) {
		return CommentEntity.builder().comment_no(dto.getCommentboard_no())
				.comment_id(dto.getComment_id()).commentboard_no(dto.getComment_no())
				.comment_content(dto.getComment_content()).build();
	}
	
	default Comment toDto(CommentEntity entity) {
		return Comment.builder().comment_no(entity.getCommentboard_no())
				.comment_id(entity.getComment_id()).commentboard_no(entity.getComment_no())
				.comment_content(entity.getComment_content()).build();
	}

}
