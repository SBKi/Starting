package com.jcpdev.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	   public String getComment(String client_id, int whiteboard_no,Model model){
	      
	      List<CommentEntity> list = repository.findByCommentboard_no(whiteboard_no);
	      List<Comment> result = new ArrayList<Comment>();
	      list.forEach(item->{
	         result.add(service.toDto(item));
	      });
	      
	      Optional<WhiteboardEntity> whiteBoardEntity = wb_repository.findById(whiteboard_no);
	      Whiteboard whiteboard = wb_service.toDto(whiteBoardEntity.get());
	      
	      model.addAttribute("commentlist", result);
	      model.addAttribute("whiteboard", whiteboard);
	      // 게시물 리스트 
	      List<WhiteboardEntity> wb_list =wb_repository.findByWhiteboard_Client1(client_id);
	        List<Whiteboard> board_list = new ArrayList<Whiteboard>();
	        wb_list.forEach(item-> {
	        board_list.add(wb_service.toDto(item));
	        });
	        model.addAttribute("board_list", board_list);
	      System.out.println(result);
	      return "comment";
	   }
	
	@RequestMapping("starting/comment/save")
	public String insert(Comment comment, Model model) {
		CommentEntity entity = service.toEntity(comment);
		
		repository.save(entity);
		
		return "redirect:/starting/comment?whiteboard_no="+comment.getComment_whiteboard_no()+"&client_id="+wb_repository.getById(comment.getComment_whiteboard_no()).getWhiteboard().getClient_id();
	}
	
	
	
}
