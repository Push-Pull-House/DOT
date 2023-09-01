package com.kh.dots.chatting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dots.chatting.model.service.ChatService;
import com.kh.dots.chatting.model.vo.ChatMessage;
import com.kh.dots.chatting.model.vo.ChatRoom;
import com.kh.dots.chatting.model.vo.ChatRoomJoin;
import com.kh.dots.member.model.service.MemberService;
import com.kh.dots.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes({ "loginUser", "chatRoomNo" })
public class ChatController {

	@Autowired
	private ChatService cService;

	@Autowired
	private MemberService mService;

	@GetMapping("/chat/chatRoomList")
	public String selectChatRoomList(HttpSession session, Model model) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		List<ChatRoom> crList = cService.selectChatRoomList(loginUser.getUserNo());

		log.info("채팅방 리스트 = {}", crList);
		model.addAttribute("chatRoomList", crList);

		return "forward:Chatting.jsp";
	}
	
	public List<ChatRoom> selectChatList(HttpSession session) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");

		List<ChatRoom> crList = cService.selectChatRoomList(loginUser.getUserNo());
		
		return crList;
	}
	

	@PostMapping("/chat/openChatRoom")
	public String openChatRoom(HttpSession session, Model model, ChatRoom room, ChatRoomJoin join,
			@RequestParam(name = "userId") List<Integer> addList, RedirectAttributes ra) {

		log.info("join = {} ", join);
		
		int result = 0;
		int chatRoomNo = 0;

		String path = "redirect:/chat/";

		Member loginUser = (Member) session.getAttribute("loginUser");

		log.info("addList = {}", addList);
		log.info("loginUser = {}", loginUser);

		List<Integer> intList = addList.stream().mapToInt(Integer::intValue).boxed().collect(Collectors.toList());

		intList.add(loginUser.getUserNo());
		log.info("intList ={} ", intList);

		String title = "";
		for (int i : intList) {
			log.info("i = {}", i);

			Member addMember = mService.selectOne(i);
			log.info("addMember ={}", addMember);

			title += addMember.getUserNick() + ", ";
		}
			
		if (title.endsWith(", ")) {
			title = title.substring(0, title.length() - 2);
		}

		room.setUserNo(loginUser.getUserNo());
		room.setTitle(title);
		log.info("room ={} ", room);

		chatRoomNo = cService.openChatRoom(room);
		log.info("chatRoomNo ={}", chatRoomNo);

		for (int i : intList) {
			
			join.setChatRoomNo(chatRoomNo);
			join.setUserNo(i);
			log.info("join = {}", join);
			
			result = cService.insertChatRoom(join);
		}
		
		if (chatRoomNo > 0) {
			ra.addFlashAttribute("alertMsg", "채팅방 생성 성공");
			path += "chatRoomList";
		} else {
			ra.addFlashAttribute("alertMsg", "채팅방 생성 실패");
			path += "chatRoomList";
		}
		return path;
	}
	
	
	// 채팅방과 팔로우 리스트 검색
//	@PostMapping("/chat/chatRoomList")
//	public Object handleChatRoomListRequest(
//	    HttpSession session,
//	    @RequestParam(value = "action", required = false) String action,
//	    @RequestParam(value = "keyword", required = false) String keyword,
//	    @PathVariable(value = "chatRoomNo", required = false) Integer chatRoomNo,
//	    ChatRoomJoin join
//	) {
//	    if ("search".equals(action)) {
//	        return searchChatList(session, keyword);
//	    } else if ("join".equals(action)) {
//	        return joinChatRoom(session, join, chatRoomNo);
//	    }
//	    // 기본 동작: 예를 들어, 빈 리스트 반환
//	    return Collections.emptyList(); // 또는 에러 메시지 등을 반환할 수 있음
//	}
	
	@PostMapping("/chat/chatRoomList")
	public String searchChatList(
	        HttpSession session,
	        @RequestParam(value = "keyword", required = false) String keyword,
	        Model model) {
	    log.info("keyword = {}", keyword);

	    Member loginUser = (Member) session.getAttribute("loginUser");

	    Map<String, Object> map = new HashMap();
	    map.put("keyword", keyword);
	    map.put("userNo", loginUser.getUserNo());
	    log.info("map = {}", map);

	    List<ChatRoom> room = cService.selectChatRoomListByKeyword(map);
	    log.info("room = {}", room);
	    
	    model.addAttribute("chatRoomList", room);

	    return "forward:ChattingSearchList.jsp";
	}
	

	@PostMapping("/chat/joinChatRoom")
	public String joinChatRoom(
			HttpSession session,
			ChatRoomJoin join,
			Model model
			) {
		log.info("chatRoomJoin = {}", join);
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		join.setUserNo(loginUser.getUserNo());
		
		log.info("chatRoomJoin = {}", join);
		
		List<ChatRoomJoin> joinRoom = cService.joinChatRoom(join);
		List<ChatMessage> msgList = cService.selectMsgList(join);
		
		log.info("joinRoom = {}", joinRoom);
		log.info("msgList = {}", msgList);
		
		Map<String, Object> map = new HashMap();
		map.put("joinRoom", joinRoom);
		map.put("msgList", msgList);
		
		model.addAttribute("map", map);
		
		return "forward:ChattingRoom.jsp";
	}

	
	@PostMapping("/chat/searchFollowList")
	public String searchFollowList(
				HttpSession session,
				Model model,
				@RequestParam(value = "follower", required = false) String follower
			) {
		log.info("follower = {}", follower);
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		Map<String, Object> map = new HashMap();
		
		map.put("follower", follower);
		map.put("userNo", loginUser.getUserNo());
		
		log.info("map = {}", map);
		
		//List<Member> followList = cService.searchFollowList(map);
		
		
		
		return "";
	}




}
