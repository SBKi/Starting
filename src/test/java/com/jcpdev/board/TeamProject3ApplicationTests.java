package com.jcpdev.board;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.jcpdev.board.entity.ClientEntity;
import com.jcpdev.board.model.Client;
import com.jcpdev.board.repository.ClientRepository;
import com.jcpdev.board.service.ClientService;

@SpringBootTest
class TeamProject3ApplicationTests {

	@Autowired
	ClientRepository repository;

	@Autowired
	ClientService serivce;

	void contextLoads() {
		Client client = new Client("test", "pasw", "email@tes.com", "test_name", "addr_test", "M", "2016-10-20", 175,
				"asdfsdf.png", "asdfsf", "asdfasdf");
		ClientEntity entity = serivce.toEntity(client);
		repository.save(entity);

	}

}