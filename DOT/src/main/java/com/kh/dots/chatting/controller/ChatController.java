package com.kh.dots.chatting.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
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
import com.kh.dots.feed.model.service.FeedService;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.feed.model.vo.Friend;
import com.kh.dots.feed.model.vo.Like;
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
	
	@Autowired
	private FeedService fdService;

	@GetMapping("/chat/chatRoomList")
	public String selectChatRoomList(HttpSession session, Model model) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		List<ChatRoom> crList = cService.selectChatRoomList(loginUser.getUserNo());
		List<Member> follow = fService.searchFollowList(loginUser.getUserNo());
		List<ChatRoomJoin> crImage = cService.selectChatRoomListImage(loginUser.getUserNo());

		List<ChatMessage> msgList = new ArrayList();
		ChatMessage msg = new ChatMessage();
		
		String date = "";
		
		for(int i = 0; i < crList.size(); i++) {
			
			msg = cService.selectNewMsg(crList.get(i).getChatRoomNo());
			
			if(msg == null) {
				
				msg = new ChatMessage();
				
				msg.setMessage("현재 대화내용이 존재하지 않습니다.");
				
			} else {
				
				if(msg.getMessage().contains("/")) {
					
					msg.setMessage("사진을 보냈습니다.");
				}
				date = dateFormat(msg.getEnrollDate());
				msg.setEnrollDate(date);
			}
			
			
			msg.setChatRoomNo(crList.get(i).getChatRoomNo());
			msgList.add(msg);
		}
		
		model.addAttribute("follow", follow);
		model.addAttribute("chatRoomList", crList);
		model.addAttribute("chatRoomImage", crImage);
		model.addAttribute("chatMessageList", msgList);
		
		
		return "forward:Chatting.jsp";
	}

	@PostMapping("/chat/openChatRoom")
	public String openChatRoom(HttpSession session, Model model, ChatRoom room, ChatRoomJoin join,
			@RequestParam(name = "userNo") List<Integer> addList, RedirectAttributes ra) {

		int result = 0;
		int chatRoomNo = 0;

		String path = "redirect:/chat/";

		Member loginUser = (Member) session.getAttribute("loginUser");

		List<Integer> intList = addList.stream().mapToInt(Integer::intValue).boxed().collect(Collectors.toList());

		intList.add(loginUser.getUserNo());
		log.info("intList ={} ", intList);

		String title = "";
		for (int i : intList) {
			Member addMember = mService.selectOne(i);

			title += addMember.getUserNick() + ", ";
		}

		if (title.endsWith(", ")) {
			title = title.substring(0, title.length() - 2);
		}

		room.setUserNo(loginUser.getUserNo());
		room.setTitle(title);
		
		chatRoomNo = cService.openChatRoom(room);

		for (int i : intList) {

			join.setChatRoomNo(chatRoomNo);
			join.setUserNo(i);

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

		Member loginUser = (Member) session.getAttribute("loginUser");

		Map<String, Object> map = new HashMap();
		
		map.put("userNo", loginUser.getUserNo());
		map.put("keyword", keyword);
		
		List<ChatRoomJoin> crImage = cService.selectChatRoomListImage(loginUser.getUserNo());
		List<ChatRoom> room = cService.selectChatRoomListByKeyword(map);
		List<ChatMessage> msgList = new ArrayList();
		
		ChatMessage msg = new ChatMessage();
		
		String date = "";
		
		for(int i = 0; i < room.size(); i++) {
			
			msg = cService.selectNewMsg(room.get(i).getChatRoomNo());
			
			if(msg == null) {
				
				msg = new ChatMessage();
				
				msg.setMessage("현재 대화내용이 존재하지 않습니다.");
				
			} else {
				
				if(msg.getMessage().contains("/")) {
					
					msg.setMessage("사진을 보냈습니다.");
				}
				date = dateFormat(msg.getEnrollDate());
				msg.setEnrollDate(date);
			}
			msg.setChatRoomNo(room.get(i).getChatRoomNo());
			msgList.add(msg);
		}
		model.addAttribute("chatRoomList", room);
		model.addAttribute("chatRoomImage", crImage);
		model.addAttribute("chatMessageList", msgList);

		return "forward:ChattingSearchList.jsp";
	}

	@PostMapping("/chat/joinChatRoom")
	public String joinChatRoom(HttpSession session, ChatRoomJoin join, Model model) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		join.setUserNo(loginUser.getUserNo());

		List<ChatRoomJoin> joinRoom = cService.joinChatRoom(join);
		List<ChatMessage> msgList = cService.selectMsgList(join);
		List<ChatRoomJoin> crImage = cService.selectChatRoomImage(join.getChatRoomNo());

		log.info("msgList = {}", msgList);
		
		String date = "";
		
 		if(msgList.size() > 0) {
			
			for(int i = 0; i < msgList.size(); i++) {
				
				date = dateFormatHour(msgList.get(i).getEnrollDate());
				log.info("date = {}", date);
				msgList.get(i).setEnrollDate(date);
			}
		}
		
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

		log.info("followList = {} ", followList);

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
		
		Member feedWriter = mService.selectOne(feed.getFeedWriter());
		
		List<Reply> reply = cService.selectReply(shareFeed.getFeedNo());
		
		List<Images> img = cService.selectFeedImg(shareFeed.getFeedNo());
		
		List<ChatRoom> crList = cService.selectChatRoomList(loginUser.getUserNo());
		List<Member> follow = fService.searchFollowList(loginUser.getUserNo());
		List<ChatRoomJoin> crImage = cService.selectChatRoomListImage(loginUser.getUserNo());
		List <Like> like = fdService.like4(loginUser.getUserNo());
		
		List <Friend> friendList = fdService.friendList(loginUser.getUserNo());
		
		log.info("feed ={}", feed);
		log.info("like ={}", like);
		log.info("reply ={}", reply);
		
		model.addAttribute("feed", feed);
		model.addAttribute("feedWriter", feedWriter);
		model.addAttribute("reply", reply);
		model.addAttribute("img", img);
		model.addAttribute("chatRoomList", crList);
		model.addAttribute("follow", follow);
		model.addAttribute("chatRoomImage", crImage);
		model.addAttribute("like", like);
		
		model.addAttribute("friendList",friendList);
		
		return "forward:ChattingShareFeed.jsp";
	}
	
	public String dateFormat(String date) {
		
		// 1. 데이터베이스에서 저장된 날짜 값을 가져옵니다.
        String savedDateString = date;

        // 2. 현재 날짜와 시간을 얻습니다.
        LocalDateTime currentDate = LocalDateTime.now();

        // 3. 두 날짜 사이의 차이를 계산합니다.
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime savedDate = LocalDateTime.parse(savedDateString, formatter);
        Duration duration = Duration.between(savedDate, currentDate);

        // 4. 하루(24시간)보다 작으면 일, 시간, 분, 초로 비교하고, 그렇지 않으면 일수로 비교합니다.
        long daysDifference;
        if(duration.toMinutes() < 1) {
        	return "방금전";
        } else if (duration.toHours() < 24) {
            long minutesDifference = (duration.toMinutes() % 60);
                    return minutesDifference + "분 전";
        } else {
            daysDifference = duration.toDays();
            return daysDifference + "일 전";
        }
	}
	
	public String dateFormatHour(String date) {
		
		String savedDateString = date; // 데이터베이스에서 가져온 날짜 문자열을 설정해주세요
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        String returnStr = "";
        
        try {
            Date savedDate = sdf.parse(savedDateString);
            Date currentDate = new Date();

            long timeDifference = currentDate.getTime() - savedDate.getTime();

            if  (timeDifference < 60 * 60 * 1000) { // 1시간 미만인 경우
            	
                long minutes = timeDifference / (60 * 1000);
                
                returnStr = "오후 " + (savedDate.getHours() - 12) + "시 " + minutes + "분";
                
            } else if (timeDifference < 24 * 60 * 60 * 1000) { // 24시간 미만인 경우
            	
                SimpleDateFormat timeFormat = new SimpleDateFormat("a h시 m분");
                
                returnStr = timeFormat.format(savedDate) + "";
                
            } else { // 24시간 이상인 경우
            	
                SimpleDateFormat monthDayFormat = new SimpleDateFormat("MM월 dd일");
                
                returnStr = monthDayFormat.format(savedDate) + "";
            }
        } catch (Exception e) {
        	
        }
        
        log.info("returnStr = {}", returnStr);
        return returnStr;
	}
	
	
	
}
