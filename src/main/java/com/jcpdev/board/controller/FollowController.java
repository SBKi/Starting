package com.jcpdev.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jcpdev.board.entity.ClientEntity;
import com.jcpdev.board.entity.FollowEntity;
import com.jcpdev.board.model.Client;
import com.jcpdev.board.model.Follow;
import com.jcpdev.board.repository.ClientRepository;
import com.jcpdev.board.repository.FollowRepository;
import com.jcpdev.board.service.ClientService;
import com.jcpdev.board.service.FollowService;

@Controller
public class FollowController {

	@Autowired
	FollowRepository repository;

	@Autowired
	ClientRepository c_repository;
	@Autowired
	FollowService service;
	@Autowired
	ClientService c_service;

	@RequestMapping(value = "/starting/follow", method = RequestMethod.GET)
	public String follow(Model model, HttpSession session) {
		Client user = (Client) session.getAttribute("client");
		List<Client> c_list = new ArrayList<Client>();
		for(FollowEntity temp : repository.findByYourFollow(user.getClient_id())) {
			Optional<ClientEntity> ent  =   c_repository.findById(service.toDto(temp).getFollow_client_id());
			if(ent.isPresent()) {
				c_list.add(c_service.toDto(ent.get()));
			}
		}
		model.addAttribute("list", c_list);
		return "follow";
	}

	@RequestMapping(value = "/starting/follower", method = RequestMethod.GET)
	public String follower(Model model, HttpSession session) {
		Client user = (Client) session.getAttribute("client");
		List<Object> list = repository.findByMyFollow(user.getClient_id());
		
		List<Client> c_list = new ArrayList<Client>();
		for(int i =0; i<list.size();i++) {
			Optional<ClientEntity> entity =  c_repository.findById(list.get(i).toString());
			if(!entity.isEmpty()) {
				c_list.add(c_service.toDto(entity.get()));
			}
		}
		model.addAttribute("list", c_list);
		return "follower";
	}

	@RequestMapping(value = "/starting/send_follow", method = RequestMethod.GET)
	public String send_follow(String id, HttpSession session, HttpServletRequest request) {
		String url = request.getServletPath();
		if(url.equals("/starting/send_follow")) {
			Client user = (Client) session.getAttribute("client");
			Follow temp = new Follow(0, user.getClient_id(), id);
			repository.save(service.toEntity(temp));
			return "redirect:/starting/";
		}else {
		Client user = (Client) session.getAttribute("client");
		Follow temp = new Follow(0, user.getClient_id(), id);
		repository.save(service.toEntity(temp));
		return "redirect:/starting/userProfile?client_id="+id;
		}
	}
}
