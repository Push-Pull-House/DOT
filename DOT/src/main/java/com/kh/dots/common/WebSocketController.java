package com.kh.dots.common;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.sun.nio.sctp.Notification;

@Controller
public class WebSocketController {

    @MessageMapping("/sendNotification") // "/sendNotification" 경로로 메시지가 날아오면 sendNotification 메소드가 실행되어 Notification 객체가 반환된다.
    @SendTo("/topic/notifications")
    public Notification sendNotification(Notification notification) { //sendNotification 객체는 @SendTo 어노테이션에 매핑되어있는 "/topic/notifications"를 구독하고 있는 모든 구독자들에게 메시지를 전달한다. 
        return notification;
    }
}
