package com.jcpdev.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.apache.bcel.generic.InstructionConstants.Clinit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jcpdev.board.entity.ClientEntity;
import com.jcpdev.board.entity.FollowEntity;
import com.jcpdev.board.entity.WhiteboardEntity;
import com.jcpdev.board.model.Client;
import com.jcpdev.board.model.Whiteboard;
import com.jcpdev.board.service.ClientService;
import com.jcpdev.board.service.FollowService;
import com.jcpdev.board.service.WhiteboardService;
import com.jcpdev.board.repository.ClientRepository;
import com.jcpdev.board.repository.FollowRepository;
import com.jcpdev.board.repository.WhiteboardRepository;

@Controller
public class WhiteboardController {

   //20211118
   @Autowired
   WhiteboardRepository repository;
   
   @Autowired
   WhiteboardService service;
   
   @Autowired
   ClientRepository c_repository;

   @Autowired
   ClientService c_service;
   
   @Autowired
   FollowRepository f_repository;
   @Autowired
   FollowService f_service;
   //메인 페이지에서 게시물 불러오기
   @RequestMapping({"/starting/main","/starting/","/"})
   public String getList(Model model,HttpServletRequest request){
      List<WhiteboardEntity> wb_list =repository.findByWhiteboard_Client();
      List<ClientEntity> c_list =c_repository.findByIdAll();
      //      List<WhiteboardEntity> list = repository.findAll(Sort.by(Sort.Direction.DESC,"whiteboard_no"));
      //if(list.equals("[]")) {list = repository.findAll();}
      List<Whiteboard> result = new ArrayList<Whiteboard>();
      List<Client> client = new ArrayList<Client>();
      wb_list.forEach(item-> {
         result.add(service.toDto(item));
      });
      c_list.forEach(item-> {
          client.add(c_service.toDto(item));
       });
       
       //추가중
       HttpSession session = request.getSession();
       String user_id = ((Client)session.getAttribute("client")).getClient_id();
       
       String users = String.valueOf(c_repository.findUesr(user_id));
       users = users.substring(1, users.length()-1);
       ArrayList<String> userlist = new ArrayList<String>();
       String [] userArray = users.split(", ");
       for(String u : userArray)
         userlist.add(u);
       
       String follow = String.valueOf(f_repository.findByMyFollow(user_id));
       follow = follow.substring(1, follow.length()-1);
       String [] follows = follow.split(", ");
       for(String f : follows)
          System.out.print(f+",");
       for(int i=0; i<userlist.size();i++) {
          for(int j=0; j<follows.length; j++) {
             if(userlist.get(i).equals(follows[j]))
                userlist.remove(i);
          }
       }
       
       ClientEntity c =null;
       List<Client> client1  = new ArrayList<Client>();
         for(int i=0; i<userlist.size();i++) {
            c = c_repository.findById(userlist.get(i)).get();
            Client dto = c_service.toDto(c);
            client1.add(dto);
            }
       List<Client> followlist = new ArrayList<Client>();
       List<Object> enty =  f_repository.findByMyFollow(user_id);
       	for(Object temp : enty) {
       		ClientEntity cen =  c_repository.getById(temp.toString());
       		followlist.add(c_service.toDto(cen));
       	}
       
       List<Client> allList = new ArrayList<Client>();
       List<ClientEntity> enli = c_repository.findAll();
       for(ClientEntity temp : enli) {
    	   allList.add(c_service.toDto(temp));
       }
       model.addAttribute("c_A_list", allList);
       model.addAttribute("followlist", followlist);
       model.addAttribute("list", result);
       model.addAttribute("c_list", client1);
      return "starting";
   }
   //게시물올리기 페이지
   @RequestMapping(value = "/starting/board" ,method = RequestMethod.GET)
   public String board() {
      return "board";
   }
   //게시물 올리기
   @RequestMapping(value = "/starting/board" ,method = RequestMethod.POST)
   public String insert(@RequestParam MultipartFile whiteboard_img1,@RequestParam MultipartFile whiteboard_img2,
            @RequestParam MultipartFile whiteboard_img3,String whiteboard_client_id,String whiteboard_content) throws IllegalStateException, IOException {
      System.out.println(whiteboard_img1.getOriginalFilename());
      System.out.println(whiteboard_img2.getOriginalFilename());
      System.out.println(whiteboard_img3.getOriginalFilename());
      
      String randomimg1 = null,randomimg2 = null,randomimg3=null;
      if(!whiteboard_img1.isEmpty())
         randomimg1 =UUID.randomUUID().toString()+whiteboard_img1.getOriginalFilename();
      if(!whiteboard_img2.isEmpty())
         randomimg2 =UUID.randomUUID().toString()+ whiteboard_img2.getOriginalFilename();
      if(!whiteboard_img3.isEmpty())
         randomimg3 =UUID.randomUUID().toString()+ whiteboard_img3.getOriginalFilename();
      
      Whiteboard whiteboard = new Whiteboard(0, whiteboard_client_id ,randomimg1,randomimg2
            ,randomimg3, whiteboard_content, null, 0, 0);
      
      String path ="C:\\img\\test";
      File upfile = null;
      if(randomimg1 !=null) {
         String img = path+"\\"+randomimg1;
         upfile = new File(img);
         whiteboard_img1.transferTo(upfile);
      }
      if(randomimg2 !=null) {
         String img = path+"\\"+randomimg2;
         upfile = new File(img);
         whiteboard_img2.transferTo(upfile);
      }
      if(randomimg3 !=null) {
         String img = path+"\\"+randomimg3;
         upfile = new File(img);
         whiteboard_img3.transferTo(upfile);
      }
      
      System.out.println(whiteboard);
      WhiteboardEntity entity = service.toEntity(whiteboard);
      System.out.println(entity);
      repository.save(entity);
      return "redirect:/starting/main?client_id="+whiteboard_client_id;
   }
   
   @RequestMapping(value="/starting/update",method = RequestMethod.GET)
      public String updateView(int whiteboard_no, Model model) {
         WhiteboardEntity entity = repository.findById(whiteboard_no).get();
         Whiteboard dto = service.toDto(entity);
         model.addAttribute("board", dto);
         
         return "boardUpdate";
      }
   @RequestMapping(value="/starting/update",method = RequestMethod.POST)
      public String update(@RequestParam MultipartFile whiteboard_img1, @RequestParam MultipartFile whiteboard_img2
            ,@RequestParam MultipartFile whiteboard_img3 ,String whiteboard_content, String whiteboard_client_id,
            int whiteboard_no, int whiteboard_count, int whiteboard_like, Model model) throws IllegalStateException, IOException {
         System.out.println("테스트합니다.");
         System.out.println(whiteboard_img1.getOriginalFilename());
         
         
         WhiteboardEntity entity = repository.findById(whiteboard_no).get();
         
         String randomimg1 = null,randomimg2 = null,randomimg3=null;

         if(!whiteboard_img1.isEmpty())
            randomimg1 =UUID.randomUUID().toString()+whiteboard_img1.getOriginalFilename();
         if(!whiteboard_img2.isEmpty())
            randomimg2 =UUID.randomUUID().toString()+ whiteboard_img2.getOriginalFilename();
         if(!whiteboard_img3.isEmpty())
            randomimg3 =UUID.randomUUID().toString()+ whiteboard_img3.getOriginalFilename();
         
         
         
         String path ="C:\\img\\test";
         File upfile = null;
         if(randomimg1 !=null) {
            String img = path+"\\"+randomimg1;
            upfile = new File(img);
            whiteboard_img1.transferTo(upfile);
         }
         if(randomimg2 !=null) {
            String img = path+"\\"+randomimg2;
            upfile = new File(img);
            whiteboard_img2.transferTo(upfile);
         }
         if(randomimg3 !=null) {
            String img = path+"\\"+randomimg3;
            upfile = new File(img);
            whiteboard_img3.transferTo(upfile);
         }
         
         Whiteboard whiteboard = new Whiteboard(whiteboard_no, whiteboard_client_id , randomimg1, randomimg2
               , randomimg3, whiteboard_content, null, whiteboard_count, whiteboard_like);
         
         entity = service.toEntity(whiteboard);
         repository.save(entity);
         
         
         System.out.println(whiteboard_img1);
         return "redirect:/starting/main?client_id="+whiteboard_client_id;
      }
      @RequestMapping("/starting/delete")
      public String delete(int whiteboard_no) {
         repository.deleteById(whiteboard_no);
         return "redirect:/starting/main";
      }
   
   
   
}