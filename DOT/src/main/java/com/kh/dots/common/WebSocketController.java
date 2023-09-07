package com.kh.dots.common;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.WebSocketSession;

import com.kh.dots.member.model.service.MemberService;
import com.kh.dots.member.model.vo.Friend;
import com.kh.dots.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WebSocketController  {

	@Autowired
	MemberService mService;
	
	private final SimpMessageSendingOperations messagingTemplate;
	
	 public WebSocketController(SimpMessageSendingOperations messagingTemplate) {
	        this.messagingTemplate = messagingTemplate;
	 }
   
	 @MessageMapping("/updateLoginStatus")
	 public void updateLoginStatus(@Payload UserStatusMessage message /*@DestinationVariable("userNo") int userNo*/) {
        // 클라이언트로부터 받은 사용자 로그인 상태를 업데이트
        String userNick = message.getUserNick(); // 사용자명
        boolean checkLog = message.isCheckLog(); // 로그인 상태
        int userNo = message.getUserNo();
        
        log.info("userNick={}",userNick);
        log.info("checkLog={}",checkLog);
        log.info("userNo={}",userNo);
        Member m = new Member();
        m.setUserNick(userNick);
        if(checkLog) {
        	m.setCheckLog("Y");
        }
        
        // 여기에서 해당 사용자의 로그인 상태를 업데이트하는 로직 추가
        int result = mService.updateUserLoginStatus(m);
        log.info("result={}",result);
        
        List<Member> Allmember = mService.selectAll();
        
        // 친구 목록 서비스를 사용하여 친구 목록을 가져옵니다.
        //List<Friend> mlist = mService.sideFriendList(userNo);
		//List<Member> friendList = new ArrayList();
		//for(Friend a : mlist
		//		) {
		//	Member f = mService.selectFriendList2(a);
		//	if(f != null) {
		//		String isLoggedIn = f.getCheckLog();
		//		friendList.add(f);
		//	}
		//}
		//log.info("WebFriend={}",friendList);
		 //message.setFriendList(friendList);
        // 해당 정보를 클라이언트에게 보냅니다.
        log.info("WebFriend={}",Allmember);
		String userTopic = "/topic/updateLoginStatus";
		message.setFriendList(Allmember);
        messagingTemplate.convertAndSend(userTopic, message);
	 }
	 
	 @MessageMapping("/updateLogoutStatus")
	 //@SendTo("/topic/friendLoginStatus")
	 public void updateLogoutStatus(@Payload UserStatusMessage message) {
	     String userNick = message.getUserNick(); // 사용자명
	     boolean checkLog = message.isCheckLog();
	     // 여기에서 해당 사용자의 로그인 상태를 로그아웃(false)으로 업데이트하는 로직 추가
	     log.info("userNick2={}",userNick);
	     log.info("checkLog2={}",checkLog);
	     Member m = new Member();
		 m.setUserNick(userNick);
		 if(checkLog == false) {
			m.setCheckLog("N");
		 } 
		 int result = mService.updateUserLoginStatus(m);
		 log.info("result={}",result);
	        
	     // 업데이트된 사용자 상태를 반환
	     //message.setCheckLog(false);
	     //return message;
		 List<Member> Allmember = mService.selectAll();
		 String userTopic = "/topic/friendLoginStatus";
		 message.setFriendList(Allmember);
		 messagingTemplate.convertAndSend(userTopic, message);
	 }
	 
		/*
		 * @MessageMapping("/friendLoginStatus") public void friendLoginStatus(@Payload
		 * UserStatusMessage message) { int userNo = message.getUserNo();
		 * 
		 * // 친구 목록 서비스를 사용하여 친구 목록을 가져옵니다. List<Friend> mlist =
		 * mService.sideFriendList(userNo); List<Member> friendList = new ArrayList();
		 * for(Friend a : mlist) { Member f = mService.selectFriendList2(a); if(f !=
		 * null) { String isLoggedIn = f.getCheckLog(); friendList.add(f); } }
		 * log.info("WebFriend={}",friendList); message.setFriendList(friendList); // 친구
		 * 목록을 반복하여 특정 친구의 로그인 상태를 업데이트하고 클라이언트에게 알립니다.
		 * 
		 * // 업데이트된 친구 로그인 상태를 클라이언트에게 보냅니다.
		 * messagingTemplate.convertAndSend("/topic/updateLoginStatus", message); }
		 */


}