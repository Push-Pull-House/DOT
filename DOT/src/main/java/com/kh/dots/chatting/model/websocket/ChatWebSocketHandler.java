package com.kh.dots.chatting.model.websocket;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.dots.chatting.model.service.ChatService;
import com.kh.dots.chatting.model.vo.ChatMessage;
import com.kh.dots.chatting.model.vo.ChatRoom;
import com.kh.dots.chatting.model.vo.ChatRoomJoin;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.member.model.service.MemberService;
import com.kh.dots.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatWebSocketHandler extends TextWebSocketHandler {

    @Autowired
    private SimpMessagingTemplate messagingTemplate;
    
    @Autowired
	private ChatService cService;
    
    @Autowired
	private MemberService mService;
    

    @MessageMapping("/chatRoomList/{chatRoomNo}")
    public void handleChatMessage(
    		@Payload ChatMessage message,
    		@DestinationVariable("chatRoomNo") int chatRoomNo
    		) {
    	
    	log.info("message = {}", message);
    	
    	if(message.getFilePath() == null) {
    		
    		log.info("메세지 왓다 = {}", "하이");
    		
    		message.setEnrollDate(new Date(System.currentTimeMillis())+"");
    		
    		ChatMessage msg = cService.selectImage(message);
    		log.info("msg = {}", msg);
    		
    		message.setFilePath(msg.getFilePath());
    		message.setChangeName(msg.getChangeName());
    		
    		log.info("message = {}", message);
    		
    		int result = cService.insertMessage(message);
    		
    		log.info("result ={}", result);
    		
    		
    		if (result > 0) {
    			log.info("Received message: {}", message.getMessage());
    			
    			messagingTemplate.convertAndSend("/dot/chat", message);
    			messagingTemplate.convertAndSend("/dot/chatList", message);
    		}
    	} else {
    		
    		log.info("chatRoomNo = {}", chatRoomNo);
    		
    		int userNo = message.getUserNo();
    		log.info("userNo = {}", userNo);
    		String userNick = message.getUserNick();
    		log.info("userNick = {}", userNick);
    		
    		ChatMessage msg = cService.selectImage(message);
    		log.info("msg = {}", msg);
    		
    		message = cService.selectNewImg(message);
    		message.setUserNo(userNo);
    		message.setUserNick(userNick);
    		if(msg != null) {
    			message.setFilePath(msg.getFilePath());
    			message.setChangeName(msg.getChangeName());
    		} else {
    			
    		}
    		log.info("message = {}", message);
    		
    		messagingTemplate.convertAndSend("/dot/chat", message);
    		messagingTemplate.convertAndSend("/dot/chatList", message);
    	}
    }
    
    
    @MessageMapping("/shareFeed/")
    public void shareFeed(
    		@Payload ChatMessage shareList
    		) {
    	
    	log.info("shareList = {}", shareList);
    	
    	Member loginUser = mService.selectOne(shareList.getUserNo());
    	
    	List<Integer> userList = shareList.getShareUserList();
    	log.info("shareUserList = {}", shareList.getShareUserList());
    	
    	List<Integer> roomList = shareList.getShareRoomList();
    	log.info("shareRoomList = {}", shareList.getShareRoomList());
    	
    	int result1 = 0;
    	int result2 = 0;
    	
    	log.info("loginUser = {}", loginUser);
    	
    	String title = "";
    	
    	int feedNo = shareList.getFeedNo();
    	log.info("feedNo={}", feedNo);
    	
    	ChatMessage img = cService.selectThumbnail(feedNo);
    	log.info("img = {}", img);
    	
    	ChatRoom room = new ChatRoom();
    	ChatRoomJoin join = new ChatRoomJoin();
    	ChatMessage message = new ChatMessage();
    	
    	int chatRoomNo = 0;
    	
    	if(!userList.isEmpty()) {
    		userList.add(loginUser.getUserNo());
    		
    		for(Integer uList : userList) {
    			
    			Member addMember = mService.selectOne(uList);
    			
    			log.info("addMember ={}", addMember);
    			
    			title += addMember.getUserNick() + ", ";
    		}
    		
    		if (title.endsWith(", ")) {
    			title = title.substring(0, title.length() - 2);
    		}
    		
    		room.setTitle(title);
    		room.setUserNo(loginUser.getUserNo());
    		
    		log.info("room ={} ", room);

    		chatRoomNo = cService.openChatRoom(room);
    		log.info("chatRoomNo ={}", chatRoomNo);
    		
    		for (int i : userList) {

    			join.setChatRoomNo(chatRoomNo);
    			join.setUserNo(i);
    			log.info("i = {}", i);

    			result1 = cService.insertChatRoom(join);
    		}
    		message.setUserNo(loginUser.getUserNo());
    		message.setUserNick(loginUser.getUserNick());
    		message.setChatRoomNo(chatRoomNo);
    		message.setMessage(img.getFilePath() + "/" + img.getChangeName());
    		message.setFeedNo(shareList.getFeedNo());
    		
    		log.info("message = {}", message);
    		
    		handleChatMessage(message, chatRoomNo);
    	}
    	
    	if(!roomList.isEmpty()) {
    		
    		for(int i = 0; i < roomList.size(); i++) {
    			
    			chatRoomNo = roomList.get(i);
    			
    			message.setUserNo(loginUser.getUserNo());
    			message.setUserNick(loginUser.getUserNick());
    			message.setChatRoomNo(chatRoomNo);
    			message.setMessage(img.getFilePath() + "/" + img.getChangeName());
    			message.setFeedNo(shareList.getFeedNo());
    			
    			handleChatMessage(message, chatRoomNo);
    		}
    	}
    }
    
    
    
}
