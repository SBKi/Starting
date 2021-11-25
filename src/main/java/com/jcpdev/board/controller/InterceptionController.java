package com.jcpdev.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jcpdev.board.entity.ClientEntity;
import com.jcpdev.board.entity.InterceptionEntity;
import com.jcpdev.board.model.Client;
import com.jcpdev.board.model.Interception;
import com.jcpdev.board.repository.ClientRepository;
import com.jcpdev.board.repository.InterceptionRepository;
import com.jcpdev.board.service.ClientService;
import com.jcpdev.board.service.InterceptionService;

@Controller
public class InterceptionController {

	@Autowired
	InterceptionRepository repository;

	@Autowired
	InterceptionService service;
	
	@Autowired
	ClientRepository c_repository;
	
	@Autowired
	ClientService c_service;

	@RequestMapping(value = "/starting/interception", method = RequestMethod.GET)
	public String addinterception(HttpSession session, HttpServletRequest request, String instruction_client_id) {
		String url = request.getServletPath();
		if (url.equals("/starting/interception")) {
			Client user = (Client) session.getAttribute("client");
			Interception interception = new Interception(0, user.getClient_id(), instruction_client_id);
			repository.save(service.toEntity(interception));
			return "redirect:/starting/";
		} else {
			Client user = (Client) session.getAttribute("client");
			Interception interception = new Interception(0, user.getClient_id(), instruction_client_id);
			repository.save(service.toEntity(interception));
			return "redirect:/starting/userProfile?client_id=" + instruction_client_id;
		}
	}
	
	@RequestMapping(value = "/starting/interceptionlist", method = RequestMethod.GET)
	public String follower(Model model, HttpSession session) {
		Client user = (Client) session.getAttribute("client");
		List<Client> c_list = new ArrayList<Client>();
		for (InterceptionEntity temp : repository.findByMyInterception(user.getClient_id())) {
			Optional<ClientEntity> ent = c_repository.findById(service.toDto(temp).getInterception_id());
			if (ent.isPresent()) {
				c_list.add(c_service.toDto(ent.get()));
			}
		}
		model.addAttribute("list", c_list);
		return "interception";
	}
	
	

}
