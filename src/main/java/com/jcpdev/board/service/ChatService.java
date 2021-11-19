package com.jcpdev.board.service;

import com.jcpdev.board.entity.ChatEntity;
import com.jcpdev.board.model.Chat;

public interface ChatService {
	default ChatEntity toEntity(Chat dto) {

		return ChatEntity.builder().chat_no(dto.getChat_no()).roomid(dto.getRoomid()).message(dto.getMessage())
				.writer(dto.getWriter()).build();
	}

	default Chat toDto(ChatEntity entity) {
		return Chat.builder().chat_no(entity.getChat_no()).roomid(entity.getRoomid()).message(entity.getMessage())
				.writer(entity.getWriter()).build();
	}

}