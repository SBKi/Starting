package com.jcpdev.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.jcpdev.board.entity.WhiteboardEntity;
import com.jcpdev.board.model.Whiteboard;
import com.jcpdev.board.repository.ClientRepository;
import com.jcpdev.board.repository.WhiteboardRepository;
import com.jcpdev.board.service.ClientService;
import com.jcpdev.board.service.WhiteboardService;

@Controller
public class HomeController {

	@Autowired
	WhiteboardRepository repository;

	@Autowired
	WhiteboardService service;


	@GetMapping("/instagram/board")
	public void board() {
		Whiteboard board = new Whiteboard(0, "test", "11.png", null, null, "contex", null, 0, 0);
		WhiteboardEntity entity = service.toEntity(board);
		System.out.println(repository.save(entity));
		return;
	}
}
