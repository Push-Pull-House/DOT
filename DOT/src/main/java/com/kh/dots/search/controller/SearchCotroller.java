package com.kh.dots.search.controller;

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
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.dots.member.model.vo.Member;
import com.kh.dots.search.model.service.AlarmService;
import com.kh.dots.search.model.service.SearchService;
import com.kh.dots.search.model.vo.Board;
import com.kh.dots.search.model.vo.Image;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SearchCotroller {

	@Autowired
	private SearchService searchService;
	
	@Autowired
	private AlarmService alarmService;

	public SearchCotroller() {
	}
	
	@Autowired
	public SearchCotroller(SearchService searchService, AlarmService alarmService) {
		this.searchService = searchService;
		this.alarmService = alarmService;
	}

	
	
	////////////////////
	//    탐색 기능     //
	////////////////////
	@GetMapping("/search")
	public String search() {
		log.info("search");
		return "/search.jsp";
	}
	  
	// 검색 기능 
	@GetMapping("/searchList.se") 
    public String selectList(
    		@RequestParam(name = "keyword") String keyword,
		    Model model
		    ) {
      log.info("keyword = {}", keyword);
      
      List<Image> slist =  searchService.selectList(keyword);
	  log.info("slist = {} ", slist);
     
	  model.addAttribute("slist",slist);
      
	  return "/search.jsp"; 
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
      int result = searchService.keywordList(map);
	  log.info("kList = {} ", result);
	  
	  return "/search.jsp";
	}

    
	////////////////////
	//    알람 기능     //
	////////////////////
    @GetMapping("/alarm")
	public String alarm() {
		log.info("alarm");
		return "/alarm.jsp";
	}
    
    
    
    // stomp 테스트 화면
    @GetMapping("/alarm/stomp")
    public String stompAlarm() {
        return "/alarm.jsp";
    }

//    @MessageMapping("/alarm/{userId}")
//    public String message(@DestinationVariable("userId") String userId) {
//    	alarmService.convertAndSend("/alarm/stomp" + userId, "alarm socket connection completed.");
//    }
    
    @GetMapping("/alarm/{userId}")
    public String alarmList(
    		@RequestParam(name = "userId") String userId,
//    		HttpSession session,
    		Model model
    		) {
//    	Member loginUser = (Member)session.getAttribute("loginUser");
//  	  	if(!userId.isEmpty()) {
  	  		
		  	Map<String, Object> map = new HashMap();
		  	map.put("userId", userId); 
		  	
		  	List<Board> alist= alarmService.alarmList(map);
		  	log.info("alarmList = {}", alist);
	    	
		  	model.addAttribute("alist", alist);
//  	  	}
//  	  	model.addAttribute("errorMsg","알림 목록이 없습니다.");
	  	
	  	return "/alarm.jsp";
    }
    
    //------------------------------------------------------------------------//
    
    @Component
    @RequiredArgsConstructor
    public class EchoHandler extends TextWebSocketHandler{
    	
    	// 전체 로그인 유저
    	private List<WebSocketSession> sessions = new ArrayList<>();
    	
    	// 1대1 매핑
    	private Map<String, WebSocketSession> userSessionMap = new HashMap<>();
    	
    	@Override
    	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    		log.info("Socket 연결");
    		sessions.add(session);
    		log.info(sendPushUsername(session));				//현재 접속한 사람의 username이 출력됨
    		String senderId = sendPushUsername(session);
    		userSessionMap.put(senderId, session);
    	}

    	@Override
    	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    		log.info("session = " + sendPushUsername(session));
    		String msg = message.getPayload();				//js에서 넘어온 메세지
    		log.info("msg = " + msg);
    		
    		if (!StringUtils.isEmpty(msg)) {
    			String[] strs = msg.split(",");
    			
    			if (strs != null && strs.length == 5) {
    				String pushCategory = strs[0];			//댓글, 좋아요 구분
    				String replyWriter = strs[1];			//댓글, 좋아요 보낸 유저
    				String sendedPushUser = strs[2];		//푸시 알림 받을 유저
    				String boardId = strs[3];				//게시글번호
    				String title = strs[4];					//게시글제목
    				
    				WebSocketSession sendedPushSession = userSessionMap.get(sendedPushUser);	//로그인상태일때 알람 보냄
    				
    				//부모댓글
    				if ("reply".equals(pushCategory) && sendedPushSession != null) {
    					TextMessage textMsg = new TextMessage(replyWriter + " 님이 " + "<a href='/porfolDetail/" + boardId + "' style=\"color:black\"><strong>" + title + "</strong> 에 댓글을 남겼습니다.</a>");
    					sendedPushSession.sendMessage(textMsg);
    				}
    				
    				//좋아요
    				else if ("like".equals(pushCategory) && sendedPushSession != null) {
    					TextMessage textMsg = new TextMessage(replyWriter + " 님이 " + "<a href='/porfolDetail/" + boardId + "' style=\"color:black\"><strong>" + title + "</strong> 을 좋아요♡ 했습니다.</a>");
    					sendedPushSession.sendMessage(textMsg);
    				}
    				
    				//자식댓글
    				else if ("reReply".equals(pushCategory) && sendedPushSession != null) {
    					TextMessage textMsg = new TextMessage(replyWriter + " 님이 " + "<a href='/porfolDetail/" + boardId + "' style=\"color:black\"><strong>" + title + "</strong> 글의 회원님 댓글에 답글을 남겼습니다.</a>");
    					sendedPushSession.sendMessage(textMsg);
    				}
    			}
    		}
    	}

    	@Override
    	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    		log.info("Socket 연결 해제");
    		sessions.remove(session);
    		userSessionMap.remove(sendPushUsername(session), session);
    	}

    	//알람을 보내는 유저(댓글작성, 좋아요 누르는 유저)
    	private String sendPushUsername(WebSocketSession session) {
    		String loginUsername;
    		
    		if (session.getPrincipal() == null) {
    			loginUsername = null;
    		} else {
    			loginUsername = session.getPrincipal().getName();
    		}
    		return loginUsername;
    	}
    
	} 
}
