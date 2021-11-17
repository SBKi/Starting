package com.jcpdev.board.controller;

import org.springframework.stereotype.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jcpdev.board.entity.ClientEntity;
import com.jcpdev.board.model.Client;
import com.jcpdev.board.repository.ClientRepository;
import com.jcpdev.board.service.ClientService;

@Controller
public class ClientController {
	private static final Logger logger = LoggerFactory.getLogger(ClientController.class);

	@Autowired
	ClientRepository repository;

	@Autowired
	ClientService service;

	@RequestMapping(value = "/instagram/login", method = RequestMethod.GET)
	public String loginPage() {
		return "login";
	}
	
	@RequestMapping(value="/instagram/login", method = RequestMethod.POST)
	public String login() {
		return "";
	}

	// 회원가입
	@RequestMapping(value = "/instagram/register", method = RequestMethod.POST)
	public String sign_up(Client client, Model model) {
		if (client != null) {
			client.setClient_img("defalut.png");
			ClientEntity entity = service.toEntity(client);
			repository.save(entity);
		}
		return "redirect:login";
	}
	
	@GetMapping
	@RequestMapping(value = "/instagram/main")
	public String main() {
		return "instagram";
	}

	@GetMapping
	@RequestMapping(value = "/instagram/join")
	public String join() {
		return "join";
	}

	@GetMapping
	@RequestMapping(value = "/instagram/find_id")
	public String find_id() {
		return "find_id";
	}

	@GetMapping
	@RequestMapping(value = "/instagram/find_password")
	public String find_password() {
		return "find_password";
	}

	@GetMapping
	@RequestMapping(value = "/instagram/find_id_C")
	public String find_id_C() {
		return "find_id_C";
	}

	@GetMapping
	@RequestMapping(value = "/instagram/find_password_C")
	public String find_password_C() {
		return "find_password_C";
	}
}