package com.jcpdev.board.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jcpdev.board.entity.ChatEntity;
import com.jcpdev.board.model.Chat;
import com.jcpdev.board.model.Client;
import com.jcpdev.board.repository.ChatRoomRepository;
import com.jcpdev.board.service.ChatService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping(value = "/chat")
@Log4j2
public class RoomController {

    @Autowired
    ChatRoomRepository	repository;

    @Autowired
    ChatService service;
    
    //채팅방 목록 조회
    @RequestMapping(value = "/rooms", method = RequestMethod.GET)
    public ModelAndView rooms(){

        log.info("# All Chat Rooms");
        ModelAndView mv = new ModelAndView("chat/rooms");
        
        List<Chat> list = new ArrayList<Chat>();
        if(repository.findAll().size()<0) {
            return mv;
         }
        for(ChatEntity entity : repository.findAll()) {
        	list.add(service.toDto(entity));
        }
        
        mv.addObject("list",list);
        return mv;
    }

    //채팅방 개설
    @RequestMapping(value = "/room", method = RequestMethod.POST)
    public String create(String id,HttpServletRequest request){
    	HttpSession session = request.getSession();
    	
    	Client client = null;
    	if(session.getAttribute("client") != null) {
    		client = (Client)session.getAttribute("client");
    	}else {
    		System.out.println("세션아이디 없음");
    	}
    	String myid = client.getClient_id();
    	Chat chat = new Chat();
    	chat.setChat_no(0);
    	chat.setMessage("채팅방에 입장하셨습니다.");
    	chat.setWriter(id);
    	chat.setRoomid(myid+"@"+id);
    	
    	repository.save(service.toEntity(chat));
        log.info("# Create Chat Room , id: " + id);
    	return "redirect:/chat/rooms";
    }
 
    //채팅방 조회
    @RequestMapping(value = "/room", method = RequestMethod.GET)
    public void getRoom(String id, Model model, HttpServletRequest request){
    	HttpSession session = request.getSession();
    	Client client = null;
    	if(session.getAttribute("client") != null) {
    		client = (Client)session.getAttribute("client");
    	}else {
    		System.out.println("세션 없어짐");
    		return;
    	}
    	String temp1 = client.getClient_id()+"@"+id;
    	String temp2 = id+"@"+client.getClient_id();
        log.info("# get Chat Room");
      List<ChatEntity> list = repository.findcustom(temp1,temp2);
      List<Chat> chatlist  = new ArrayList<Chat>();
        	for(ChatEntity temp : list) {
        		chatlist.add(service.toDto(temp));
        	}
        	
        model.addAttribute("client", client);
        model.addAttribute("roomlist",chatlist);        
        return;
    }
}