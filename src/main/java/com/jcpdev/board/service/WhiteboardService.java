package com.jcpdev.board.service;

import com.jcpdev.board.entity.ClientEntity;
import com.jcpdev.board.entity.WhiteboardEntity;
import com.jcpdev.board.model.Whiteboard;

public interface WhiteboardService {
	default WhiteboardEntity toEntity(Whiteboard dto) {
		ClientEntity client = ClientEntity.builder().client_id(dto.getWhiteboard_client_id()).build();
		return WhiteboardEntity.builder().whiteboard_no(dto.getWhiteboard_no()).whiteboard(client)
				.whiteboard_img1(dto.getWhiteboard_img1()).whiteboard_img2(dto.getWhiteboard_img2())
				.whiteboard_img3(dto.getWhiteboard_img3()).whiteboard_content(dto.getWhiteboard_content())
				.whiteboard_date(dto.getWhiteboard_date()).whiteboard_count(dto.getWhiteboard_count())
				.whiteboard_like(dto.getWhiteboard_like()).build();
	}

	default Whiteboard toDto(WhiteboardEntity entity) {
		return Whiteboard.builder().whiteboard_no(entity.getWhiteboard_no()).whiteboard_client_id(entity.getWhiteboard().getClient_id())
				.whiteboard_img1(entity.getWhiteboard_img1()).whiteboard_img2(entity.getWhiteboard_img2())
				.whiteboard_img3(entity.getWhiteboard_img3()).whiteboard_content(entity.getWhiteboard_content())
				.whiteboard_date(entity.getWhiteboard_date()).whiteboard_count(entity.getWhiteboard_count())
				.whiteboard_like(entity.getWhiteboard_like()).build();
	}

}
