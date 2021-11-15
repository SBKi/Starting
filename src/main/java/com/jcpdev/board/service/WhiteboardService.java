package com.jcpdev.board.service;

import com.jcpdev.board.entity.WhiteboardEntity;
import com.jcpdev.board.model.Whiteboard;

public interface WhiteboardService {
	default WhiteboardEntity toEntity(Whiteboard dto) {
<<<<<<< HEAD
=======
		
>>>>>>> branch 'master' of https://github.com/Advensod-KBJ/TeamProject3.git
		return WhiteboardEntity.builder().whiteboard_no(dto.getWhiteboard_no()).whiteboard_id(dto.getWhiteboard_id())
				.whiteboard_img1(dto.getWhiteboard_img1()).whiteboard_img2(dto.getWhiteboard_img2())
				.whiteboard_img3(dto.getWhiteboard_img3()).whiteboard_content(dto.getWhiteboard_content())
				.whiteboard_date(dto.getWhiteboard_date()).whiteboard_count(dto.getWhiteboard_count())
				.whiteboard_like(dto.getWhiteboard_like()).build();
	}
	
	default Whiteboard toDto(WhiteboardEntity entity) {
		return Whiteboard.builder().whiteboard_no(entity.getWhiteboard_no()).whiteboard_id(entity.getWhiteboard_id())
				.whiteboard_img1(entity.getWhiteboard_img1()).whiteboard_img2(entity.getWhiteboard_img2())
				.whiteboard_img3(entity.getWhiteboard_img3()).whiteboard_content(entity.getWhiteboard_content())
				.whiteboard_date(entity.getWhiteboard_date()).whiteboard_count(entity.getWhiteboard_count())
				.whiteboard_like(entity.getWhiteboard_like()).build();
	}

}
