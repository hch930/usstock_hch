package org.hch.controller;

import javax.servlet.http.HttpServletRequest;

import org.hch.domain.AuthVO;
import org.hch.domain.MemberVO;
import org.hch.service.MemberService;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/login/*")
public class MemberController {
	private final MemberService service;

	private final BCryptPasswordEncoder bcryptPasswordEncoder;

	// 회원가입 GET
	@GetMapping("/register")
	public void register() {
	}

	// 회원가입 POST
	@PostMapping("/register")
	public String register(MemberVO vo, HttpServletRequest request) {
		log.info("register");
		int result = service.idCheck(vo.getUserid());
		try {
			if (result == 1) {
				return "/login/register";
			} else if (result == 0) {

				vo.setUserpw(bcryptPasswordEncoder.encode(vo.getUserpw()));
				service.register(vo);

				AuthVO auth = new AuthVO();
				auth.setUserid(vo.getUserid());
				auth.setAuth(auth.getAuth());
				service.registerAuth(auth);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/login/customLogin";
	}

	// 아이디 중복 검사
	@PostMapping("/userIdChk")
	@ResponseBody
	public String userIdChkPOST(String userid) throws Exception {
		log.info("userIdChk() 진입");
		int result = service.idCheck(userid);
		log.info("결과값 = " + result);

		if (result != 0) {
			return "fail"; // 중복 아이디가 존재

		} else {
			return "success"; // 중복 아이디 x
		}
	}

	// 엑세스 에러
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied: " + auth);

		model.addAttribute("msg", "Access denied");
	}

	// 로그인
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info("error: " + error);
		log.info("logout: " + logout);

		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if (logout != null) {
			model.addAttribute("logout", "Logout!!!");
		}
	}

	// 로그아웃
	@GetMapping("/customLogout")
	public void logoutGET() {
		log.info("custom logout");
	}
}
