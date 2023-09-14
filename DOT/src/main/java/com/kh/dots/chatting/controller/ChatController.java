package com.kh.dots.chatting.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dots.chatting.model.service.ChatService;
import com.kh.dots.chatting.model.vo.ChatMessage;
import com.kh.dots.chatting.model.vo.ChatRoom;
import com.kh.dots.chatting.model.vo.ChatRoomJoin;
import com.kh.dots.common.Utils;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.feed.model.vo.Reply;
import com.kh.dots.follow.model.service.FollowService;
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

	@Autowired
	public FollowService fService;
	
	@Autowired
	private ServletContext application;

	@GetMapping("/chat/chatRoomList")
	public String selectChatRoomList(HttpSession session, Model model) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		List<ChatRoom> crList = cService.selectChatRoomList(loginUser.getUserNo());
		List<Member> follow = fService.searchFollowList(loginUser.getUserNo());
		List<ChatRoomJoin> crImage = cService.selectChatRoomListImage(loginUser.getUserNo());

		List<ChatMessage> msgList = new ArrayList();
		ChatMessage msg = new ChatMessage();
		
		for(int i = 0; i < crList.size(); i++) {
			
			msg = cService.selectNewMsg(crList.get(i).getChatRoomNo());
			log.info("msg = {}", msg);
			
			if(msg == null) {
				
				msg = new ChatMessage();
				
				msg.setMessage("현재 대화내용이 존재하지 않습니다.");
				
			} else {
				
				if(msg.getMessage().contains("/")) {
					
					msg.setMessage("사진을 보냈습니다.");
				}
			}
			msg.setChatRoomNo(crList.get(i).getChatRoomNo());
			log.info("msg = {}", msg);
			msgList.add(msg);
		}
		
		log.info("msgList = {}", msgList);
		
		
		log.info("채팅방 리스트 = {}", crList);
		log.info("채팅방 이미지 리스트 = {}", crImage);
		log.info("follow = {} ", follow);

		model.addAttribute("follow", follow);
		model.addAttribute("chatRoomList", crList);
		model.addAttribute("chatRoomImage", crImage);
		model.addAttribute("chatMessageList", msgList);
		
		
		return "forward:Chatting.jsp";
	}

//	public List<ChatRoom> selectChatList(HttpSession session) {
//
//		Member loginUser = (Member) session.getAttribute("loginUser");
//
//		List<ChatRoom> crList = cService.selectChatRoomList(loginUser.getUserNo());
//
//		return crList;
//	}

	@PostMapping("/chat/openChatRoom")
	public String openChatRoom(HttpSession session, Model model, ChatRoom room, ChatRoomJoin join,
			@RequestParam(name = "userNo") List<Integer> addList, RedirectAttributes ra) {

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

	@PostMapping("/chat/chatRoomList")
	public String searchChatList(HttpSession session, @RequestParam(value = "keyword", required = false) String keyword,
			Model model) {
		log.info("keyword = {}", keyword);

		Member loginUser = (Member) session.getAttribute("loginUser");

		Map<String, Object> map = new HashMap();
		map.put("keyword", keyword);
		map.put("userNo", loginUser.getUserNo());
		log.info("map = {}", map);
		
		List<ChatRoomJoin> crImage = cService.selectChatRoomListImage(loginUser.getUserNo());

		List<ChatRoom> room = cService.selectChatRoomListByKeyword(map);
		log.info("room = {}", room);
		
		List<ChatMessage> msgList = new ArrayList();
		ChatMessage msg = new ChatMessage();
		
		for(int i = 0; i < room.size(); i++) {
			
			msg = cService.selectNewMsg(room.get(i).getChatRoomNo());
			log.info("msg = {}", msg);
			
			if(msg == null) {
				
				msg = new ChatMessage();
				
				msg.setMessage("현재 대화내용이 존재하지 않습니다.");
				
			} else {
				
				if(msg.getMessage().contains("/")) {
					
					msg.setMessage("사진을 보냈습니다.");
				}
			}
			msg.setChatRoomNo(room.get(i).getChatRoomNo());
			log.info("msg = {}", msg);
			msgList.add(msg);
		}


		model.addAttribute("chatRoomList", room);
		model.addAttribute("chatRoomImage", crImage);
		model.addAttribute("chatMessageList", msgList);

		return "forward:ChattingSearchList.jsp";
	}

	@PostMapping("/chat/joinChatRoom")
	public String joinChatRoom(HttpSession session, ChatRoomJoin join, Model model) {
		log.info("chatRoomJoin = {}", join);

		Member loginUser = (Member) session.getAttribute("loginUser");

		join.setUserNo(loginUser.getUserNo());

		log.info("chatRoomJoin = {}", join);

		List<ChatRoomJoin> joinRoom = cService.joinChatRoom(join);
		List<ChatMessage> msgList = cService.selectMsgList(join);
		List<ChatRoomJoin> crImage = cService.selectChatRoomImage(join.getChatRoomNo());

		log.info("joinRoom = {}", joinRoom);
		log.info("msgList = {}", msgList);
		log.info("crImage = {} " , crImage);

		Map<String, Object> map = new HashMap();
		map.put("joinRoom", joinRoom);
		map.put("msgList", msgList);

		model.addAttribute("map", map);
		model.addAttribute("chatRoomImage", crImage);

		return "forward:ChattingRoom.jsp";
	}

	
	@PostMapping("/chat/searchFollowList")
	public String searchFollowList(HttpSession session, Model model,
			@RequestParam(value = "follow", required = false) String follow) {
		log.info("follower = {}", follow);

		Member loginUser = (Member) session.getAttribute("loginUser");

		log.info("loginUser = {} ", loginUser);
		log.info("follow = {} ", follow);

		Map<String, Object> map = new HashMap();
		map.put("userNo", loginUser.getUserNo());
		map.put("follow", follow);

		List<Member> followList = cService.searchFollowListByFollow(map);

		log.info("follow = {} ", followList);

		model.addAttribute("follow", followList);

		return "forward:ChattingFollowList.jsp";
	}

	
	@PostMapping("/chat/exitChatRoom")
	public String exitChatRoom(
			HttpSession session, Model model,
			RedirectAttributes ra,
			@RequestParam(name = "deleteRoom") List<Integer> delList,
			ChatRoomJoin join
			) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		log.info("loginUser = {}",loginUser);
		log.info("delList = {}",delList);
		
		Map<String, Object> map = new HashMap();
		map.put("userNo", loginUser.getUserNo());
		map.put("chatRoomNo", delList);
		
		int result = 0;
		
		for(int i : delList) {
			
			join.setChatRoomNo(i);
			join.setUserNo(loginUser.getUserNo());
			result =  cService.exitChatRoom(join);
		}
		
		if(result > 0) {
			model.addAttribute("alertMsg", "방나가기에 성공하였습니다.");
			return "redirect:/chat/chatRoomList";
			
		} else {
			model.addAttribute("alertMsg", "방나가기에 실패하였습니다.");
			return "redirect:/chat/chatRoomList";
		}
	}
	
	
	@PostMapping("/chat/sendImgFile")
	@ResponseBody
	public void sendImgFile(
				@RequestParam("chatRoomNo") int chatRoomNo,
				MultipartFile formData,
				MultipartFile sendImg,
				HttpSession session,
				Model model
			) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		log.info("chatRoomNo = {}", chatRoomNo);
		
		String webPath = "resources/images/";
		String severFolderPath = application.getRealPath(webPath);
		
		log.info("severFolderPath = {}", severFolderPath);
		log.info("sendImg={}",sendImg);
		String changeName = Utils.saveFile(sendImg, severFolderPath);
		
		log.info("changeName = {}", changeName);
		
		Images image = Images.
						builder().
						changeName(changeName).
						originName(sendImg.getOriginalFilename()).
						fileLevel(30).
						filePath(webPath).build();
		
		image.setFileWriter(loginUser.getUserNo());

		log.info("image = {}", image);
		
		File dir = new File(severFolderPath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
		ChatMessage cm = new ChatMessage();
		cm.setChatRoomNo(chatRoomNo);
		cm.setUserNo(image.getFileWriter());
		cm.setMessage(image.getFilePath() + image.getChangeName());
		
		int result1 = cService.sendImgFile(cm);
		log.info("result1 = {}", result1);
		int result2 = cService.insertImgFile(image);
		log.info("result2 = {}", result2);
	}
	
	
	@PostMapping("/chat/shareFeed")
	public String shareFeed(
			Model model,
			Feed shareFeed,
			HttpSession session
			) {
		log.info("feedNo = {}", shareFeed);
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		Feed feed = cService.selectFeedOne(shareFeed.getFeedNo());
		log.info("feed = {}", feed);
		
		Member feedWirter = mService.selectOne(feed.getFeedWriter());
		log.info("feedWirter = {}", feedWirter);
		
		List<Reply> reply = cService.selectReply(shareFeed.getFeedNo());
		log.info("reply = {}", reply);
		
		List<Images> img = cService.selectFeedImg(shareFeed.getFeedNo());
		log.info("img = {}", img);
		
		List<ChatRoom> crList = cService.selectChatRoomList(loginUser.getUserNo());
		List<Member> follow = fService.searchFollowList(loginUser.getUserNo());
		List<ChatRoomJoin> crImage = cService.selectChatRoomListImage(loginUser.getUserNo());
		
		model.addAttribute("feed", feed);
		model.addAttribute("feedWriter", feedWirter);
		model.addAttribute("reply", reply);
		model.addAttribute("img", img);
		model.addAttribute("chatRoomList", crList);
		model.addAttribute("follow", follow);
		model.addAttribute("chatRoomImage", crImage);
		
		return "forward:ChattingShareFeed.jsp";
	}
	
	
	
}
