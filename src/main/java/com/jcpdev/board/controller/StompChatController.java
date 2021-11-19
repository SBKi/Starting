package com.jcpdev.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.jcpdev.board.entity.ChatEntity;
import com.jcpdev.board.model.Chat;
import com.jcpdev.board.repository.ChatRoomRepository;
import com.jcpdev.board.service.ChatService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StompChatController {

	private final SimpMessagingTemplate template; // 특정 Broker로 메세지를 전달

	@Autowired
	ChatRoomRepository repository;

	@Autowired
	ChatService service;

	// Client가 SEND할 수 있는 경로
	// stompConfig에서 설정한 applicationDestinationPrefixes와 @MessageMapping 경로가 병합됨
	// "/pub/chat/enter"
	@MessageMapping(value = "/chat/enter")
	public void enter(Chat message) {
		message.setMessage(message.getWriter() + "님이 채팅방에 참여하였습니다.");
		template.convertAndSend("/sub/chat/room/" + message.getRoomid(), message);
	}

	@MessageMapping(value = "/chat/message")
	public void message(Chat message) {
		template.convertAndSend("/sub/chat/room/" + message.getRoomid(), message);
		ChatEntity entity = service.toEntity(message);
		repository.save(entity);
	}
}