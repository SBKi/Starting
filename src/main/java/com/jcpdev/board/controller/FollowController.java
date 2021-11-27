package com.jcpdev.board.controller;

import java.util.ArrayList;
import java.util.Iterator;
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
	public String follow(Model model, String search_id) {
		Client user = c_service.toDto(c_repository.getById(search_id));
		List<Client> c_list = new ArrayList<Client>();
		for (FollowEntity temp : repository.findByYourFollow(user.getClient_id())) {
			Optional<ClientEntity> ent = c_repository.findById(service.toDto(temp).getFollow_client_id());
			if (ent.isPresent()) {
				c_list.add(c_service.toDto(ent.get()));
			}
		}
		model.addAttribute("search_id", search_id);
		model.addAttribute("list", c_list);
		return "follow";
	}

	@RequestMapping(value = "/starting/follower", method = RequestMethod.GET)
	public String follower(Model model, String search_id) {
		Client user = c_service.toDto(c_repository.getById(search_id));
		List<Client> c_list = new ArrayList<Client>();
		for (FollowEntity temp : repository.findByMyFollow(user.getClient_id())) {
			Optional<ClientEntity> ent = c_repository.findById(service.toDto(temp).getFollowing_id());
			if (ent.isPresent()) {
				c_list.add(c_service.toDto(ent.get()));
			}
		}
		model.addAttribute("search_id", search_id);
		model.addAttribute("list", c_list);
		return "follower";
	}

	@RequestMapping(value = "/starting/send_follow", method = RequestMethod.GET)
	public String send_follow(String id, HttpSession session, HttpServletRequest request) {
		String url = request.getServletPath();
		if (url.equals("/starting/send_follow")) {
			List<FollowEntity> myfollowlist = new ArrayList<FollowEntity>();
			Client user = (Client) session.getAttribute("client");
			myfollowlist = repository.findByMyFollow(user.getClient_id());
			for(FollowEntity temp : myfollowlist) {
				if(temp.getFollowing_id().equals(id)) {
					return "redirect:/starting/";	//이미 등록되어 있으면
				}
			}
			Follow temp = new Follow(0, user.getClient_id(), id);
			repository.save(service.toEntity(temp));
			return "redirect:/starting/";
		} else {
			Client user = (Client) session.getAttribute("client");
			Follow temp = new Follow(0, user.getClient_id(), id);
			repository.save(service.toEntity(temp));
			return "redirect:/starting/userProfile?client_id=" + id;
		}
	}
	
	@RequestMapping(value = "/starting/un_following", method = RequestMethod.GET)
	public String un_following(String id, HttpSession session, HttpServletRequest request) {
		String url = request.getServletPath();
		if (url.equals("/starting/un_follow")) {
			Client user = (Client) session.getAttribute("client");
			Integer no = repository.un_Following(user.getClient_id(), id);
			Follow temp = new Follow(no, user.getClient_id(), id);
			repository.delete(service.toEntity(temp));
			return "redirect:/starting/";
		} else {
			Client user = (Client) session.getAttribute("client");
			Integer no = repository.un_Following(user.getClient_id(), id);
			Follow temp = new Follow(no, user.getClient_id(), id);
			repository.delete(service.toEntity(temp));
			return "redirect:/starting/userProfile?client_id=" + id;
		}
	}
	@RequestMapping(value = "/starting/un_follow", method = RequestMethod.GET)
	public String un_follow(String id, HttpSession session, HttpServletRequest request) {
		String url = request.getServletPath();
		if (url.equals("/starting/un_follow")) {
			Client user = (Client) session.getAttribute("client");
			Integer no = repository.un_Follow(id, user.getClient_id());
			Follow temp = new Follow(no, id, user.getClient_id());
			repository.delete(service.toEntity(temp));
			return "redirect:/starting/";
		} else {
			Client user = (Client) session.getAttribute("client");
			Integer no = repository.un_Follow(id,user.getClient_id());
			Follow temp = new Follow(no, id, user.getClient_id());
			repository.delete(service.toEntity(temp));
			return "redirect:/starting/userProfile?client_id=" + id;
		}
	}
	/*
	 * @RequestMapping(value = "/starting/follow_check", method =
	 * RequestMethod.POST) public String follow_check(String id, HttpSession
	 * session, HttpServletRequest request, Model model) { String url =
	 * request.getServletPath(); if (url.equals("/starting/un_follow")) { Client
	 * user = (Client) session.getAttribute("client"); String f_check =
	 * repository.follow_check(user.getClient_id(), id);
	 * model.addAttribute("f_check",f_check); return "redirect:/starting/"; } else {
	 * Client user = (Client) session.getAttribute("client"); String f_check =
	 * repository.follow_check(user.getClient_id(), id);
	 * model.addAttribute("f_check",f_check); return
	 * "redirect:/starting/userProfile?client_id=" + id; } }
	 */
}