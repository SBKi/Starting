package com.jcpdev.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jcpdev.board.repository.WhiteboardRepository;
import com.jcpdev.board.service.WhiteboardService;

@Controller
public class HomeController {

	@Autowired
	WhiteboardRepository repository;

	@Autowired
	WhiteboardService service;


}