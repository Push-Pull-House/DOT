package com.kh.dots.chatting.model.websocket;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.dots.chatting.model.service.ChatService;
import com.kh.dots.chatting.model.vo.ChatMessage;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatWebSocketHandler extends TextWebSocketHandler {

    @Autowired
    private SimpMessagingTemplate messagingTemplate;
    
    @Autowired
	private ChatService cService;

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        log.info("User connected: session ID = {}", session.getId());
        
//        int chatRoomNo = cService.selectChatRoomNo();
//        session.getAttributes().put("chatRoomNo", chatRoomNo);
        
    }

    @MessageMapping("/chatRoomList/{chatRoomNo}")
    @SendTo("/topic/chat/{chatRoomNo}")
    public ChatMessage handleChatMessage(   @Payload ChatMessage message,
    										@DestinationVariable("chatRoomNo") Integer chatRoomNo) {
    	
        message.setEnrollDate(new Date(System.currentTimeMillis()));

        log.info("message = {}", message);

        int result = cService.insertMessage(message);

        log.info("result ={}", result);

//        int chatRoomNo =  message.getChatRoomNo();
        log.info("chatRoomNo = {}", chatRoomNo);

        if (result > 0 && chatRoomNo != null) {
            log.info("Received message: {}", message.getMessage());

            messagingTemplate.convertAndSend("/topic/chat/" + chatRoomNo, message);
        }

        return message;
    }
}
