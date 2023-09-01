package com.kh.dots.feed;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FeedController {

	@GetMapping("/mainFeed")
	public String forwardFeedMain() {
		return "sns/mainFeed.jsp";
	}
	
	
	
}
