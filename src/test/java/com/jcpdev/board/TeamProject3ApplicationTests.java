package com.jcpdev.board;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Service;

import com.jcpdev.board.entity.ClientEntity;
import com.jcpdev.board.entity.WhiteboardEntity;
import com.jcpdev.board.model.Client;
import com.jcpdev.board.model.Whiteboard;
import com.jcpdev.board.repository.ClientRepository;
import com.jcpdev.board.repository.WhiteboardRepository;
import com.jcpdev.board.service.ClientService;
import com.jcpdev.board.service.WhiteboardService;
import com.jcpdev.board.service.WhiteboardServiceImpl;

@SpringBootTest
class TeamProject3ApplicationTests {

	@Autowired
	WhiteboardRepository repository;

	@Autowired
	WhiteboardServiceImpl serivce;

	@Test
	void contextLoads() {
		Whiteboard board = new Whiteboard(0, "test", "11.png", null, null, "contex", null, 0, 0);
		WhiteboardEntity entity = serivce.toEntity(board); 
		System.out.println(repository.save(entity));

	}

}