package com.jcpdev.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcpdev.board.entity.CommentEntity;
import com.jcpdev.board.entity.WhiteboardEntity;
import com.jcpdev.board.model.Comment;
import com.jcpdev.board.model.Whiteboard;
import com.jcpdev.board.repository.CommentRepository;
import com.jcpdev.board.repository.WhiteboardRepository;
import com.jcpdev.board.service.CommentService;
import com.jcpdev.board.service.WhiteboardService;

@Controller
public class CommentController {
	
	@Autowired
	CommentRepository repository;
	
	@Autowired
	CommentService service;
	
	@Autowired
	WhiteboardRepository wb_repository;
	
	@Autowired
	WhiteboardService wb_service;
	
	@RequestMapping("starting/comment")
	public String getComment(int whiteboard_no,Model model,HttpServletResponse response
			,@CookieValue(name="readCount",defaultValue = "Count") String readCount){
		
		if(!readCount.contains(String.valueOf(whiteboard_no))) {
			readCount += "/" + whiteboard_no;
			wb_repository.updateCount(whiteboard_no);
		}
		
		Cookie cookie = new Cookie("readCount", readCount);
		cookie.setMaxAge(30*60);
		cookie.setPath("/");
		response.addCookie(cookie);
		
		System.out.println("test입니다.");
		System.out.println(readCount);
		
		List<CommentEntity> list = repository.findByCommentboard_no(whiteboard_no);
		List<Comment> result = new ArrayList<Comment>();
		list.forEach(item->{
			result.add(service.toDto(item));
		});
		
		WhiteboardEntity whiteBoardEntity = wb_repository.findById(whiteboard_no).get();
		Whiteboard whiteboard = wb_service.toDto(whiteBoardEntity);
		
		model.addAttribute("commentlist", result);
		model.addAttribute("whiteboard", whiteboard);
		
		System.out.println(result);
		return "comment";
	}
	
	@RequestMapping("starting/comment/save")
	public String insert(Comment comment, Model model) {
		System.out.println(comment);
		CommentEntity entity = service.toEntity(comment);
		repository.save(entity);
		
		return "redirect:/starting/comment?whiteboard_no="+comment.getComment_whiteboard_no();
	}
	
}
