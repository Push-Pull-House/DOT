package com.kh.dots.member.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@GetMapping("/enrollForm.me")
	public String enrollForm() {
		return "forward:member/Enroll_Form.jsp";
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
			url = "forward:/member/login.jsp";
		}else {
			model.addAttribute("loginUser", loginUser);
			url = "forward:/sns/mainFeed.jsp";		
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
		return "forward:member/login.jsp";
	}
	
	@ResponseBody
	@GetMapping("/idCheck.me")
	public String idCheck(String userId) {
		
		int result = mService.idCheck(userId);
		if(result == 0) {
			log.info(userId);
			if(userId.equals("")) {
				result = 2;
			}else{
				result = 0;
			}
		}

		return result+"";
	}
	
	@PostMapping("/insert.me")
	public String insertMember(@Validated Member m , HttpSession session, Model model) {
		log.info("옴?");
		//암호화 작업
		String encPwd = bcrypotPasswordEncoder.encode(m.getUserPwd());
		log.info("아이디 = {}", m.getUserId());
		log.info("암호화 전 비밀번호 = {}",m.getUserPwd());
		//암호화된 pwd를 Member m에 담아주기
		m.setUserPwd(encPwd);
		
		log.info("암호화 후 비밀번호 = {} "+m.getUserPwd());
		
		//1. memberService호출해서 insertMember 실행(Insert)
		int result = mService.insertMember(m);
		String url = "";
		log.info("result = {}",result);
		if(result > 0) {
			//성공시
			model.addAttribute("alertMsg", "회원가입성공");
			url = "forward:member/login.jsp";
		}else {
			//실패
			model.addAttribute("alertMsg","회원가입실패");
			url = "forward:member/login.jsp";
		}
		
		return url;
	}
	
	@GetMapping("/sendSMS.me")
    public @ResponseBody
    String sendSMS(String userPhone) {

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        System.out.println("수신자 번호 : " + userPhone);
        System.out.println("인증번호 : " + numStr);
        mService.certifiedPhoneNumber(userPhone,numStr);
        return numStr;
    }
}
