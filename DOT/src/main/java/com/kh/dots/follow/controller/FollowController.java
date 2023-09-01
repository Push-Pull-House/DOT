package com.kh.dots.follow.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.dots.follow.model.service.FollowService;
import com.kh.dots.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes({"loginUser"})
public class FollowController {
	
	@Autowired
	public FollowService followService;
	
	@GetMapping("/follow/followlist")
	public String SearchFollowerList(Model model,HttpSession Session) {
		Member m = (Member)Session.getAttribute("loginUser");
		List<Member> follower = followService.searchFollowerList(m.getUserNo());
		List<Member> follow = followService.searchFollowList(m.getUserNo());
		List<Member> rf = followService.recommandFollowList(m.getUserNo());
		
//		List<Member> fr = new ArrayList();
//		List<Member> duplicateFr = new ArrayList();
//		
//		for (Member  fr1   : follower ) {
//			for(Member fr2 : follow) {
//				if (fr1.getUserNick()==fr2.getUserNick()) {
//					duplicateFr.add(fr1);
//				} else {
//					fr.add(fr1);
//				}
//			}
//		}
//		model.addAttribute("duplicateFr",duplicateFr);
		model.addAttribute("fr",follower);
		model.addAttribute("fw",follow);
		model.addAttribute("rf",rf);
		return "/follow/follow.jsp";
	}
	@ResponseBody
	@PostMapping("/follow/followlist/unfollow")
	public String unFollow( Member mb,HttpSession Session ) {
		Member m = (Member)Session.getAttribute("loginUser");
		Map <String,Integer> map= new HashMap();
		map.put("loginUserNo",m.getUserNo());
		map.put("userNo",mb.getUserNo());

		int result = followService.unFollow(map);
		
		return result+"";
	}
	
	@ResponseBody
	@PostMapping("/follow/followlist/addfollow")
	public String addFollow(Member mb, HttpSession Session) {
		Member m = (Member)Session.getAttribute("loginUser");
		Map <String,Integer> map= new HashMap();
		map.put("loginUserNo",m.getUserNo());
		map.put("userNo",mb.getUserNo());
		
		int result = followService.addFollow(map);
		
		return result+"";
	}
	
	
	
	
	
	
	
	
	
	

}
