package com.jcpdev.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jcpdev.board.entity.ChatEntity;
import com.jcpdev.board.model.Chat;
import com.jcpdev.board.model.ChatRoom;
import com.jcpdev.board.model.Client;
import com.jcpdev.board.repository.ChatRoomRepository;
import com.jcpdev.board.repository.ClientRepository;
import com.jcpdev.board.service.ChatService;
import com.jcpdev.board.service.ClientService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping(value = "/starting/message")
@Log4j2
public class RoomController {

   @Autowired
   ChatRoomRepository repository;
   @Autowired
   ClientRepository c_repository;

   @Autowired
   ChatService service;
   @Autowired
   ClientService c_service;

// 채팅방 목록 조회
   @RequestMapping(value = "/rooms", method = RequestMethod.GET)
   public ModelAndView message(HttpSession session) {

      log.info("# All Chat Rooms");
      ModelAndView mv = new ModelAndView("message");

      Client user = (Client) session.getAttribute("client");
      if (user == null) {
         mv.setViewName("redirect:/starting");
         return mv;
      }

      List<Chat> roomlist = new ArrayList<Chat>();
      List<ChatEntity> entities = repository.findcustom(user.getClient_id());
      for (ChatEntity entity : entities) {
         roomlist.add(service.toDto(entity));
      }
      
      List<Client> clientlist = new ArrayList<Client>();
      for(Chat temp : roomlist) {
        String idlist[] = temp.getRoomid().split("@");
        if(user.getClient_id().equals(idlist[0])) {
           clientlist.add(c_service.toDto(c_repository.getById(idlist[1])));
        }else {
           clientlist.add(c_service.toDto(c_repository.getById(idlist[0])));
        }
      }
      System.out.println(clientlist);
      mv.addObject("clientlist",clientlist);
      mv.addObject("roomlist", roomlist);
      return mv;
   }

   // 채팅방 개설
//    @RequestMapping(value = "/room", method = RequestMethod.POST)
//    public String create(String id,HttpServletRequest request){
//       HttpSession session = request.getSession();
//       
//       Client client = null;
//       if(session.getAttribute("client") != null) {
//          client = (Client)session.getAttribute("client");
//       }else {
//          System.out.println("세션아이디 없음");
//       }
//       String myid = client.getClient_id();
//       Chat chat = new Chat();
//       chat.setChat_no(0);
//       chat.setMessage("채팅방에 입장하셨습니다.");
//       chat.setWriter(myid);
//       chat.setRoomid(myid+"@"+id);
//       
//       repository.save(service.toEntity(chat));
//        log.info("# Create Chat Room , id: " + id);
//       return "redirect:/starting/message/rooms";
//    }

   // 채팅방 조회
   @SuppressWarnings("unchecked")
   @ResponseBody 
   @RequestMapping(value = "/room", method = RequestMethod.POST)
   public JSONObject getRoom(@RequestBody ChatRoom room, HttpServletRequest request) {
      HttpSession session = request.getSession();
      Client client = null;
      client = (Client) session.getAttribute("client");
      log.info("# 채팅내역 조회");
      List<ChatEntity> list = repository.findchatlist(room.getRoomid(),room.getRoomid());
      List<Chat> chatlist = new ArrayList<Chat>();
      for (ChatEntity temp : list) {
         chatlist.add(service.toDto(temp));
      }
      if (chatlist == null || chatlist.size() <= 0) {
         Chat chat = new Chat();
         chat.setChat_no(0);
         chat.setMessage("채팅방에 입장하22셨습니다.");
         chat.setWriter(client.getClient_id());
         chat.setRoomid(room.getRoomid());
         repository.save(service.toEntity(chat));
      }
      JSONArray jsonlist = new JSONArray();
      JSONObject result = new JSONObject();
      for(Chat index : chatlist) {
         JSONObject temp = new JSONObject();
         temp.put("roomid", index.getRoomid());
         temp.put("writer", index.getWriter());
         temp.put("message",index.getMessage());
         jsonlist.add(temp);
      }
      result.put("list", jsonlist);
      return result;
   }
   
   @RequestMapping(value = "/room", method = RequestMethod.GET)
   public String getRoom(String id, HttpServletRequest request) {
      HttpSession session = request.getSession();
      Client client = null;
      client = (Client) session.getAttribute("client");
      List<ChatEntity> list = repository.findchatlist(id+"@"+client.getClient_id(),client.getClient_id()+"@"+id);
      List<Chat> chatlist = new ArrayList<Chat>();
      for (ChatEntity temp : list) {
         chatlist.add(service.toDto(temp));
      }
      if (chatlist == null || chatlist.size() <= 0) {
         Chat chat = new Chat();
         chat.setChat_no(0);
         chat.setMessage("채팅방에 입장하22셨습니다.");
         chat.setWriter(client.getClient_id());
         chat.setRoomid(client.getClient_id()+"@"+id);
         repository.save(service.toEntity(chat));
      }
      
      return "redirect:/starting/message/rooms";
   }
}