package com.jcpdev.board.service;

import com.jcpdev.board.entity.CommentEntity;
import com.jcpdev.board.entity.WhiteboardEntity;
import com.jcpdev.board.model.Comment;

public interface CommentService {
	
	default CommentEntity toEntity(Comment dto) {
		WhiteboardEntity whiteboard = WhiteboardEntity.builder().whiteboard_no(dto.getComment_whiteboard_no()).build();
		return CommentEntity.builder().comment_no(dto.getComment_no())
				.comment_id(dto.getComment_id()).comment(whiteboard)
				.comment_content(dto.getComment_content()).build();
	}
	
	default Comment toDto(CommentEntity entity) {
		return Comment.builder().comment_no(entity.getComment_no())
				.comment_id(entity.getComment_id()).comment_whiteboard_no(entity.getComment().getWhiteboard_no())
				.comment_content(entity.getComment_content()).build();
	}

}
