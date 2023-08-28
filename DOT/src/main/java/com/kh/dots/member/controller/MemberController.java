package com.kh.dots.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.dots.member.model.service.MemberService;
import com.kh.dots.member.model.validator.MemberValidator;
import com.kh.dots.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes({"loginUser","nextUrl"})
public class MemberController {
	private MemberService mService;
	
	private MemberValidator memValidator;
	
	private BCryptPasswordEncoder bcrypotPasswordEncoder;
	
	public MemberController() {
	}
	
	@Autowired
	public MemberController(MemberService mService , MemberValidator memValidator , BCryptPasswordEncoder bcrypotPasswordEncoder) {
		this.mService = mService;
		this.memValidator = memValidator;
		this.bcrypotPasswordEncoder = bcrypotPasswordEncoder;
	}
	
	@Autowired
	public void setMemberService(MemberService mService) {
		this.mService = mService;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(memValidator);
	}
	
	@GetMapping("/login.me")
	public String loginMember() {
		return "member/login.jsp";
	}
	
	@PostMapping("/login.me")
	public String loginMember(
							@ModelAttribute Member m , 
							HttpSession session , 
							Model model,
							@SessionAttribute(required = false) String nextUrl
			) {
		log.info("찍어보자구 {} , {}",m , m);
		//암호화 전 로그인 요청처리
		Member loginUser = mService.loginUser(m);
		log.info("찍어보자구 {}", loginUser);
		String url = "";
		if(loginUser == null) {
			model.addAttribute("alertMsg","아이디 또는 비밀번호가 일치하지 않습니다.");
			url = "forward:login.jsp";
		}else {
			model.addAttribute("loginUser", loginUser);
			url = "forward:/Sns/mainFeed.jsp";		
		}
		
		//암호화 후 로그인 요청 처리
//		Member loginUser = mService.selectOne(m.getUserId());
		// loginUser의 userPwd는 암호화된 상태의 비밀번호
		// m안의 userPwd는 암호화전 상태의 비밀번호
		
		// BcrpytPasswordEncoder객체의 matches 메소드 사용
		// matches(평문, 암호문)을 작성하면 내부적으로 두 값이 일치하는 검사 후 일치하면 true/ 일치하지 않으면 false
		
//		String url = "";
//		if(loginUser != null && bcrypotPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
//			// 로그인 성공
//			model.addAttribute("loginUser",loginUser);
//			url = "mainFeed";
//	
//			// 사용한 nextUrl제거
//			model.addAttribute("nextUrl",null);
//		}else {
//			model.addAttribute("errorMsg","아이디 또는 비밀번호가 일치하지 않습니다.");
//			url = "redirect:"+(nextUrl != null ? nextUrl : "/");
//		}
		
		return url;
	}
	
	@GetMapping("/logout.me")
	public String logoutMember(HttpSession session , SessionStatus status, Model model ) {
		
		session.invalidate();
		status.setComplete();
		model.addAttribute("alertMsg", "로그아웃 되었습니다.");
		return "forward:login.jsp";
	}
}
