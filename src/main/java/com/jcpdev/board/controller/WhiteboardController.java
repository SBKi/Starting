package com.jcpdev.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jcpdev.board.entity.WhiteboardEntity;
import com.jcpdev.board.model.Whiteboard;
import com.jcpdev.board.service.WhiteboardService;
import com.jcpdev.board.repository.WhiteboardRepository;

@Controller
public class WhiteboardController {

	//20211118
	@Autowired
	WhiteboardRepository repository;
	
	@Autowired
	WhiteboardService service;
	
	
	
	
	@GetMapping("/instagram/board")
	public String boardinsert() {
		Whiteboard board = new Whiteboard(2, "test", "test.png", null, null, "contex", null, 0, 0);
		WhiteboardEntity entity = service.toEntity(board);
		System.out.println(repository.save(entity));
		return "test";
	}
	
	@RequestMapping("/starting/main")
	public String getList(Model model){
		List<WhiteboardEntity> list =repository.findByWhiteboard_Client();
		//		List<WhiteboardEntity> list = repository.findAll(Sort.by(Sort.Direction.DESC,"whiteboard_no"));
		//if(list.equals("[]")) {list = repository.findAll();}
		List<Whiteboard> result = new ArrayList<Whiteboard>();
		list.forEach(item-> {
			result.add(service.toDto(item));
		});
		model.addAttribute("list", result);
		return "starting";
	}
	
	@RequestMapping(value = "/starting/board" ,method = RequestMethod.GET)
	public String board() {
		return "board";
	}
	
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
			whiteboard_img1.transferTo(upfile);
		}
		if(randomimg3 !=null) {
			String img = path+"\\"+randomimg3;
			upfile = new File(img);
			whiteboard_img1.transferTo(upfile);
		}
		
		System.out.println(whiteboard);
		WhiteboardEntity entity = service.toEntity(whiteboard);
		System.out.println(entity);
		repository.save(entity);
		return "redirect:/starting/main?client_id="+whiteboard_client_id;
	}
	
	@RequestMapping("/update")
	public String update(Whiteboard dto) {
		WhiteboardEntity entity = service.toEntity(dto);
		repository.save(entity);
		return "test";
	}
	
	
	@RequestMapping("/delete")
	public String delete(int whiteboard_no) {
		repository.deleteById(whiteboard_no);
		return "redirect:test";
	}
	
	@RequestMapping("board_test")
	public void board_test() {
		
	}
	
//	@RequestMapping("/getOne")
//	public String getOne() {
//		WhiteboardEntity entity=repository.getById(1);
//		return null;
//	}
	
	
	
}
