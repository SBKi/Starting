package com.jcpdev.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jcpdev.board.entity.CommentEntity;
import com.jcpdev.board.model.Comment;
import com.jcpdev.board.repository.CommentRepository;
import com.jcpdev.board.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	CommentRepository repository;
	
	@Autowired
	CommentService service;
	
	@RequestMapping("/comment")
	public String getComment(Model model){
		
		List<CommentEntity> list = repository.findByCommentboard_no(1);
		List<Comment> result = new ArrayList<Comment>();
		list.forEach(item->{
			result.add(service.toDto(item));
		});
		
		model.addAttribute("commentlist", result);
		
		System.out.println(result);
		return "comment";
	}
	
}
