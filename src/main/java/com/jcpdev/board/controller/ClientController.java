package com.jcpdev.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jcpdev.board.entity.ClientEntity;
import com.jcpdev.board.entity.WhiteboardEntity;
import com.jcpdev.board.model.Client;
import com.jcpdev.board.model.Whiteboard;
import com.jcpdev.board.repository.ClientRepository;
import com.jcpdev.board.repository.WhiteboardRepository;
import com.jcpdev.board.service.ClientService;
import com.jcpdev.board.service.WhiteboardService;

@Controller
public class ClientController {
	private static final Logger logger = LoggerFactory.getLogger(ClientController.class);

	@Autowired
	ClientRepository repository;

	@Autowired
	ClientService service;
	
	@Autowired
	WhiteboardRepository wb_repository;

	@Autowired
	WhiteboardService wb_service;


	@RequestMapping(value = "/starting/login")
	public String login(String alert,Model model) {
		if(alert !=null && alert.equals("y")) {
			model.addAttribute("message","로그인이 필요합니다." );  
			model.addAttribute("url","login");
			return "alertLogin";
		}else {
		
			return "login";    // 로그인 버튼 => login.jsp(뷰) -> 로그인정보입력후 버튼(사용자) -> 
		}
	}

	// 로그아웃
	@RequestMapping(value = "/starting/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("client") != null) {
			session.invalidate();
			return "login";
		}
		return "login";
	}

	// 로그인 체크
	@RequestMapping(value = "/starting/logincheck", method = RequestMethod.POST)
	public String logincheck(String client_id, String client_password, Model model, HttpServletRequest request) {
		Optional<ClientEntity> client = repository.findById(client_id);
		if (client.isPresent()) {
			Client user = null;
			user = service.toDto(client.get());
			HttpSession session = request.getSession();
			if (client_password.equals(user.getClient_password())) {
				session.setAttribute("client", service.toDto(client.get()));
				return "redirect:/starting/main";
			}
			String message="로그인 정보가 틀립니다.";
			model.addAttribute("message",message );  
			model.addAttribute("url","login");
			return "alertLogin";
		} else {
			String message="로그인 정보가 틀립니다.";
			model.addAttribute("message",message );  
			model.addAttribute("url","login");
			return "alertLogin";
		}
	}

	// 회원가입
	@RequestMapping(value = "/starting/register", method = RequestMethod.POST)
	public String sign_up(Client client, Model model) {
		if (client != null) {
			client.setClient_img("default.png");
			client.setClient_status(0);
			ClientEntity entity = service.toEntity(client);
			repository.save(entity);
		}
		return "redirect:login";
	}

	@GetMapping
	@RequestMapping(value = "/starting/join")
	public String join() {
		return "join";
	}

	// 아이디 찾기
	@RequestMapping(value = "/starting/find_id")
	public String findid() {
		return "find_id";
	}

	@RequestMapping(value = "/starting/find_id_C", method = RequestMethod.GET)
	public String find_id_C() {
		return "find_id_C";
	}

	@RequestMapping(value = "/starting/find_id_C", method = RequestMethod.POST)
	public String find_id(String client_email, String client_name, String client_birth, Model model) {
		Optional<ClientEntity> client = repository.findId(client_email, client_name, client_birth);
		if (client.isPresent()) {
			Client user = null;
			user = service.toDto(client.get());
			if (client_email.equals(user.getClient_email()) && client_name.equals(user.getClient_name())
					&& client_birth.equals(user.getClient_birth())) {
				model.addAttribute("user", user);
				return "find_id_C";
			}
			return "redirect:/starting/find_id";
		}
		return "redirect:/starting/find_id";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/starting/find_password")
	public String find_password() {
		return "find_password";
	}

	@RequestMapping(value = "/starting/find_password_C", method = RequestMethod.GET)
	public String find_password_C() {
		return "find_password_C";
	}

	@RequestMapping(value = "/starting/find_password_C", method = RequestMethod.POST)
	public String find_password(String client_id, String client_email, String client_birth, Model model) {
		Optional<ClientEntity> client = repository.findPassword(client_id, client_email, client_birth);
		if (client.isPresent()) {
			Client user = null;
			user = service.toDto(client.get());
			model.addAttribute("client", user);
			return "find_password_C";
		}
		return "redirect:/starting/find_password";
	}

	@RequestMapping(value = "/starting/find_password_Com", method = RequestMethod.POST)
	public String find_password_C(String client_id, String client_password) {
		Client old =  service.toDto(repository.getById(client_id));
		old.setClient_password(client_password);
		repository.save(service.toEntity(old));
		return "redirect:/starting/login";
	}

	// 마이페이지
    @RequestMapping(value = "/starting/userProfile", method = RequestMethod.GET)
    public String mypage(String client_id, HttpSession session, Model model, HttpServletRequest request) {
       //회원 프로필
       Client user = (Client) session.getAttribute("client");
       String temp = null;
       if (client_id == null || client_id.equals("")) {
          if (user == null || user.getClient_id().equals("")) {
             return "redirect:starting";
          } else {
             temp = user.getClient_id();
          }
       } else {
          temp = client_id;
       }
       ClientEntity entity = repository.getById(temp);
       // 게시물 리스트 
       List<WhiteboardEntity> wb_list =wb_repository.findByWhiteboard_Client1(client_id);
       List<Whiteboard> board_list = new ArrayList<Whiteboard>();
       wb_list.forEach(item-> {
          board_list.add(wb_service.toDto(item));
       });
       model.addAttribute("board_list", board_list);
       model.addAttribute("user", service.toDto(entity));
       return "userProfile";

    }

	// 비밀번호 확인
	@RequestMapping(value = "/starting/password_check", method = RequestMethod.GET)
	public String password_check1() {
		return "password_check";
	}

	@RequestMapping(value = "/starting/password_check", method = RequestMethod.POST)
	public String password_check(String client_password, HttpSession session) {
		Client user = (Client) session.getAttribute("client");
		if (client_password.equals(user.getClient_password()))
			return "redirect:profile_update";
		else
			return "password_check";
	}

	// 개인정보 수정
	@RequestMapping(value = "/starting/profile_update", method = RequestMethod.GET)
	public String profile_update(HttpSession session, HttpServletRequest request, Model model,@RequestParam MultipartFile client_img) {
		Client user = (Client) session.getAttribute("client");
		String client_id = user.getClient_id();
		ClientEntity entity = repository.getById(client_id);
		
		user = service.toDto(entity);
		model.addAttribute("user", user);
		return "profile_update";
	}

	@RequestMapping(value = "/starting/profile_update", method = RequestMethod.POST)
	public String profile_updatePOST(Client client) {
		ClientEntity entity = service.toEntity(client);
		repository.save(entity);
		return "redirect:userProfile";
	}
	
	//비밀번호 수정
	@RequestMapping(value = "/starting/password_update", method = RequestMethod.GET)
	public String password_update() {
		return "password_update";
	}

	@GetMapping
	@RequestMapping(value = "/starting/password_update", method = RequestMethod.POST)
	public String password_updatePOST(HttpSession session, HttpServletRequest request, String old_password, String new_password, String new_password2) {
		Client user = (Client) session.getAttribute("client");
		String client_password = user.getClient_password();
		if(client_password.equals(old_password)) {
			if(new_password.equals(new_password2)) {
				user.setClient_password(new_password);
				ClientEntity entity = service.toEntity(user);
				repository.save(entity);
				return "redirect:userProfile";
			}else return "password_update";
			
		}else return "password_update";
	}

	@GetMapping
	@RequestMapping(value = "/starting/like_list")
	public String like_list() {
		return "like_list";
	}

}