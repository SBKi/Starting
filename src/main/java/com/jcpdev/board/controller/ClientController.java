package com.jcpdev.board.controller;
import java.util.Optional;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.jcpdev.board.entity.ClientEntity;
import com.jcpdev.board.model.Client;
import com.jcpdev.board.repository.ClientRepository;
import com.jcpdev.board.service.ClientService;

@Controller
@SessionAttributes(names="client")
public class ClientController {
	private static final Logger logger = LoggerFactory.getLogger(ClientController.class);

	@Autowired
	ClientRepository repository;

	@Autowired
	ClientService service;


		  
	
	  @RequestMapping(value = "/instagram/login")
	 public String loginPage() { return "login"; }
	  
	
	//로그아웃
	@RequestMapping(value = "/instagram/logout", method = RequestMethod.POST)
	public String logout(SessionStatus status) {
		status.setComplete();
		return "login";
	}

	// 로그인 체크
	@RequestMapping(value = "/instagram/logincheck", method = RequestMethod.POST)
	public String logincheck(String client_id, String client_password, Model model) {
		Optional<ClientEntity> client = repository.findById(client_id);
		if (client.isPresent()) {
			Client user = null;
			user = service.toDto(client.get());
			if (client_password.equals(user.getClient_password())) {
				model.addAttribute("client", client);
				return "redirect:/instagram/main";
			}
			return "redirect:login";
		} else {
			return "redirect:login";
		}
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
	@RequestMapping(value = "/instagram/join")
	public String join() {
		return "join";
	}

	@RequestMapping(value = "/instagram/find_id_C", method = RequestMethod.POST)
	public String find_id_C(String client_email, String client_name, String client_birth) {
		return "";
	} 
	@RequestMapping(value = "/instagram/find_id_C", method = RequestMethod.GET)
	public String find_id_C() {
		return "find_id_C";
	}
	
	@RequestMapping(value = "/instagram/main")
	public String main() {
		return "instagram";
	}

	

	@GetMapping
	@RequestMapping(value = "/instagram/find_password")
	public String find_password() {
		return "find_password";
	}

	

	@GetMapping
	@RequestMapping(value = "/instagram/find_password_C")
	public String find_password_C() {
		return "find_password_C";
	}
}
