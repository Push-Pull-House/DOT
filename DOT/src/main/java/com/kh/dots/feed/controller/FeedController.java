package com.kh.dots.feed.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.dots.feed.service.FeedService;

@Controller
public class FeedController {
	
	@Autowired
	private FeedService fService;
	
	@GetMapping("/mainFeed")
	public String forwardFeedMain() {
		return "sns/mainFeed.jsp";
	}
	
}
