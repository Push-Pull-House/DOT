package com.kh.dots.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dots.common.model.template.Pagination;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.common.model.vo.PageInfo;
import com.kh.dots.common.service.CommonService;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.member.model.vo.Member;

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
	
	/* 어드민 기능 */
	@GetMapping("/adminMain")
	public String adminMain(
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			Model model,
			@RequestParam Map<String, Object> paramMap
			) {
		int offset = (currentPage -1) *5;
		int limit = 5;
		
		log.info("paramMap ={}",paramMap);
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Member> memList1 = cService.memList1();
		List<Member> memList = cService.memList(paramMap, rowBounds);
		log.info("memList ={}", memList1);
		int total = cService.selectMListCount(paramMap);		
		log.info("total ={}", total);
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = Pagination.getPageInfo(total, currentPage, pageLimit, boardLimit);
	
		
		log.info("pi ={}", pi);
		model.addAttribute("memList",memList);
		model.addAttribute("pi",pi);
		
		return "admin/adminMain.jsp";
	}
	
	@GetMapping("/adminFeed")
	public String adminFeed(
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			Model model,
			@RequestParam Map<String, Object> paramMap
			) {
		int offset = (currentPage -1) *5;
		int limit = 5;
		
		log.info("paramMap ={}",paramMap);
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Feed> feList1 = cService.feList1();
		List<Feed> feList = cService.feList(paramMap, rowBounds);
		log.info("feList1 ={}", feList1);
		int total = cService.selectFListCount(paramMap);		
		log.info("total ={}", total);
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = Pagination.getPageInfo(total, currentPage, pageLimit, boardLimit);
	
		
		log.info("pi ={}", pi);
		model.addAttribute("feList",feList);
		model.addAttribute("pi",pi);
		return "admin/adminFeed.jsp";
	}
	
	@PostMapping("/deleteFeed")
	public String deleteFeed(int[] rowCheck) {
		log.info("rowCheck={}",rowCheck);
		int result = 0;
		for(int i=0; i<rowCheck.length; i++) {
			result = cService.deleteFeed(rowCheck[i]);
			if(result == 0) {
				break;
			}
		}
		return "redirect:/adminFeed";
	}


}
