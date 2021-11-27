package com.jcpdev.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jcpdev.board.entity.CommentEntity;
import com.jcpdev.board.entity.WhiteboardEntity;
import com.jcpdev.board.model.Client;
import com.jcpdev.board.model.Comment;
import com.jcpdev.board.model.Whiteboard;
import com.jcpdev.board.repository.ClientRepository;
import com.jcpdev.board.repository.CommentRepository;
import com.jcpdev.board.repository.WhiteboardRepository;
import com.jcpdev.board.service.ClientService;
import com.jcpdev.board.service.CommentService;
import com.jcpdev.board.service.WhiteboardService;

@Controller
public class CommentController {
	
	@Autowired
	CommentRepository repository;
	
	@Autowired
	CommentService service;
	
	@Autowired
	ClientRepository c_repository;
	
	@Autowired
	ClientService c_service;
	
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
	      List<Client> clientlist = new ArrayList<Client>();
	      for(Comment temp : result) {
	    	  clientlist.add(c_service.toDto(c_repository.getById(temp.getComment_id())));
	      }
	      
	      Optional<WhiteboardEntity> whiteBoardEntity = wb_repository.findById(whiteboard_no);
	      Whiteboard whiteboard = wb_service.toDto(whiteBoardEntity.get());
	      
	      model.addAttribute("clientlist", clientlist);
	      model.addAttribute("commentlist", result);
	      model.addAttribute("whiteboard", whiteboard);
	      // 게시물 리스트 
	      List<WhiteboardEntity> wb_list =wb_repository.findByWhiteboard_Client1(client_id);
	        List<Whiteboard> board_list = new ArrayList<Whiteboard>();
	        wb_list.forEach(item-> {
	        board_list.add(wb_service.toDto(item));
	        });
	        
	        Client writer = c_service.toDto(c_repository.getById(client_id));
	        model.addAttribute("board_writer",writer);
	        model.addAttribute("board_list", board_list);
	      return "comment";
	   }
	
	@RequestMapping("starting/comment/save")
	public String insert(Comment comment, Model model) {
		CommentEntity entity = service.toEntity(comment);
		
		repository.save(entity);
		
		return "redirect:/starting/comment?whiteboard_no="+comment.getComment_whiteboard_no()+"&client_id="+wb_repository.getById(comment.getComment_whiteboard_no()).getWhiteboard().getClient_id();
	}
	
	   @RequestMapping("starting/comment/delete")
	   public String update(int comment_no) {
	      CommentEntity comment = repository.getById(comment_no);
	      int whiteboard_no = comment.getComment().getWhiteboard_no();
	      String writer = wb_repository.getById(whiteboard_no).getWhiteboard().getClient_id();
	      repository.deleteById(comment_no);
	      return "redirect:/starting/comment?whiteboard_no="+whiteboard_no+"&client_id="+writer;
	   }

	
	   @RequestMapping("starting/comment/modify")
	   public String update(int modityNo, String modityText, String whiteboard_no,HttpSession session) {
		   Client user = (Client)session.getAttribute("client");
	      CommentEntity comment = repository.getById(modityNo);
	      WhiteboardEntity whiteboard_en = wb_repository.getOne(Integer.parseInt(whiteboard_no));
	      comment.setComment_content(modityText);
	      repository.save(comment);
	      return "redirect:/starting/comment?whiteboard_no="+whiteboard_no+"&client_id="+whiteboard_en.getWhiteboard().getClient_id();
	   }

	
}
