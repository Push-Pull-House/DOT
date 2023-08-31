package com.kh.dots.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {

	@GetMapping("/")
	public String home() {
		log.info("/home 요청!");
		return "forward:start.jsp";
	}
	
	
	@GetMapping("/mypage_search")
	public String search() {
		log.info("/마이페이지 search 기능");
		return "forward:myPage_search.jsp";
	}
}
