package com.kh.dots.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.dots.common.model.vo.Images;
import com.kh.dots.common.service.CommonService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dots.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class CommonController {
	
	@Autowired
	private CommonService cService;
	
	////////////////////
	//    탐색 기능     //
	////////////////////
	@GetMapping("/search")
	public String search() {
	log.info("search");
	return "common/search.jsp";
	}
	
	// 검색 기능 
	@GetMapping("/searchList.se") 
	public String selectList(
	@RequestParam(name = "keyword") String keyword,
	Model model)
	{
		log.info("keyword = {}", keyword);
		
		List<Images> slist =  cService.selectList(keyword);
		log.info("slist = {} ", slist);
		
		model.addAttribute("slist",slist);
		
		return "common/search.jsp";
	}
	
	
	// 검색 키워드 저장 기능
	@GetMapping("/keywordList/{keyword}")
	public String keywordList(
		@RequestParam(name = "keyword") String keyword,
		HttpSession session,
		Model model
		) {
	log.info("keyword = {}", keyword);
	Member loginUser = (Member)session.getAttribute("loginUser");
	int loginUserNo = loginUser.getUserNo();
	
	Map<String, Object> map = new HashMap();
	map.put("loginUserNo",loginUserNo);
	map.put("keyword", keyword);
	int result = cService.keywordList(map);
	log.info("kList = {} ", result);
	
	return "common/search.jsp";
	}


}
