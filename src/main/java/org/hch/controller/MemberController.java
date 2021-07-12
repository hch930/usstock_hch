package org.hch.controller;

import org.hch.domain.AuthVO;
import org.hch.domain.MemberVO;
import org.hch.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
public class MemberController {
	private final MemberService service;

	private final BCryptPasswordEncoder pwencoder;
	
	//회원가입 GET
	 @GetMapping("/register")
	 public void register() {}
	
	//회원가입 POST
	@PostMapping("/register")
	 public String register(MemberVO vo) {
	   log.info("register : " + vo);
	   int result = service.idChk(vo);
	   try {
		   if(result == 1) {
			   return "/register";
		   }else if(result == 0){
			   vo.setUserpw(pwencoder.encode(vo.getUserpw()));
			   service.register(vo);
			   AuthVO auth = new AuthVO();
			   auth.setUserid(vo.getUserid());
			   auth.setAuth(auth.getAuth());
			   service.registerAuth(auth);
		   }
	   }catch(Exception e) {
		   log.info("Exception: " + e);
	   }
	   return "redirect:/customLogin";
	 }
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied: " + auth);
		
		model.addAttribute("msg", "Access denied");
	}
	
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info("error: " + error);
		log.info("logout: " + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if(logout != null) {
			model.addAttribute("logout", "Logout!!!");
		}
	}
	
	@GetMapping("/customLogout")
	public void logoutGET() {
		log.info("custom logout");
	}
	
	@ResponseBody
	@PostMapping("/idChk")
	public int idChk(MemberVO vo) {
		int result = service.idChk(vo);
		return result;
	}
}
