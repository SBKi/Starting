package com.jcpdev.board.service;

import com.jcpdev.board.entity.ClientEntity;
import com.jcpdev.board.entity.HeartEntity;
import com.jcpdev.board.entity.WhiteboardEntity;
import com.jcpdev.board.model.Heart;

public interface HeartService {
	default HeartEntity toEntity(Heart dto) {
		ClientEntity client = ClientEntity.builder().client_id(dto.getC_heart_client_id()).build();
		WhiteboardEntity whiteboard = WhiteboardEntity.builder().whiteboard_no(dto.getW_heart_whiteboard_no()).build();
		return HeartEntity.builder()
				.heart_no(dto.getHeart_no())
				.w_heart(whiteboard)
				.c_heart(client).build();
	}

	default Heart toDto(HeartEntity entity) {
		return Heart.builder().heart_no(entity.getHeart_no())
				.c_heart_client_id(entity.getC_heart().getClient_id())
				.w_heart_whiteboard_no(entity.getW_heart().getWhiteboard_no()).build();
	}
}
