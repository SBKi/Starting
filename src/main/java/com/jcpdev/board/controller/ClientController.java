package com.jcpdev.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.jcpdev.board.entity.ClientEntity;
import com.jcpdev.board.model.Client;
import com.jcpdev.board.repository.ClientRepository;
import com.jcpdev.board.service.ClientService;

@Controller
public class ClientController {
	private static final Logger logger = LoggerFactory.getLogger(ClientController.class);

	@Autowired
	ClientRepository repository;

	@Autowired
	ClientService service;

	@RequestMapping(value = { "/starting/main", "/starting" })
	   public String main() {
	      return "starting";
	   }

	@RequestMapping(value = "/starting/login")
	   public String loginPage(HttpServletRequest request) {
	      HttpSession session = request.getSession();
	      if(session.getAttribute("client")!=null) {
	         return "starting";
	      }
	      return "login";
	   }

	// 로그아웃
	   @RequestMapping(value = "/starting/logout", method = RequestMethod.POST)
	   public String logout(HttpServletRequest request) {
	      HttpSession session = request.getSession();
	      if(session.getAttribute("client")!=null) {
	         session.invalidate();
	         return "login";
	      }
	      return "login";
	   }

	// 로그인 체크
	   @RequestMapping(value = "/starting/logincheck", method = RequestMethod.POST)
	   public String logincheck(String client_id, String client_password, Model model,HttpServletRequest request) {
	      Optional<ClientEntity> client = repository.findById(client_id);
	      if (client.isPresent()) {
	         Client user = null;
	         user = service.toDto(client.get());
	         if (client_password.equals(user.getClient_password())) {
	            HttpSession session = request.getSession();
	            session.setAttribute("client", service.toDto(client.get()));
	            return "redirect:/starting/main";
	         }
	         return "redirect:login";
	      } else {
	         return "redirect:login";
	      }
	   }


	// 회원가입
	@RequestMapping(value = "/starting/register", method = RequestMethod.POST)
	public String sign_up(Client client, Model model) {
		if (client != null) {
			client.setClient_img("defalut.png");
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
			if (client_email.equals(user.getClient_email()) && client_name.equals(user.getClient_name()) && client_birth.equals(user.getClient_birth())) {
				model.addAttribute("client", user);
				return "redirect:find_id_C";
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
			return "redirect:find_password_C";
			}
		return "redirect:/starting/find_password";
	}
	
	@RequestMapping(value = "/starting/find_password_Com", method = RequestMethod.POST)
	public String find_password_C(Client client) {
		ClientEntity entity = service.toEntity(client);
		repository.save(entity);
			return "redirect:login";
	}
	
	@RequestMapping(value = "/starting/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model, HttpServletRequest request) {
		session = request.getSession();
		String client_id = (String) session.getAttribute("client_id");
		Optional<ClientEntity> client = repository.mypage(client_id);
		model.addAttribute(client);
		return "mypage";
	}
	
	@RequestMapping(value = "/starting/profile_update", method = RequestMethod.GET)
	public String profile_update(Client client, HttpSession session, HttpServletRequest request,Model model) {
		session = request.getSession();
		String client_id = (String) session.getAttribute("client_id");
		Optional<ClientEntity> user = repository.mypage(client_id);
		model.addAttribute(user);
		System.out.println("@@"+user);
		return "profile_update";
	}
	
	@RequestMapping(value = "/starting/profile_update1", method = RequestMethod.POST)
	public String profile_updateGET(Client client) {
		ClientEntity entity = service.toEntity(client);
		repository.save(entity);
		return "redirect:mypage";
	}
	
	
	@GetMapping
	@RequestMapping(value = "/starting/password_update")
	public String password_update() {
		return "password_update";
	}
	
	@GetMapping
	@RequestMapping(value = "/starting/like_list")
	public String like_list() {
		return "like_list";
	}
	
	
	
	
	
	
	

}