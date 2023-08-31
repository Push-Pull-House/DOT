package com.kh.dots.common;

import java.util.Set;

import javax.websocket.EndpointConfig;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.inject.spi.Message;

@ServerEndpoint(value="/chatting.do",decoders= {JsonDecoder.class})
public class WebSocket {

	@OnOpen
	public void open(Session session,EndpointConfig config) {
		//접속요청한 클라이언트오 ㅏ연결되면 실행되는 메소드
		System.out.println("클라이언트 접속함");
		System.out.println(session.getId());
	}
	
	@OnMessage
	public void message(Session session,Message m) {
		//sission : 메세지를 보낸 클라이언트의 session객체
		//msg : jsp페이지에서 socket.send로 넘어온 데이터
		
	//	Message m = new Gson().fromJson(msg,Message.class);
		
		System.out.println(m);
		
		//접속 session객체를 이용해서 현재 서버에 접속한 모든 session을 알아낼수 있는
		//메소드 호출하기.session.getOpenSessions()
		//-> 현재 웹소켓에 접속해서 session이 유지되고 있는 모든 session값을 반환해줌
		
	session.getUserProperties().put("msg",m);	
		
	Set<Session> clients = session.getOpenSessions();
		
	for(Session s : clients) {
		Message clientData = (Message)s.getUserProperties().get("msg");
		if(clientData != null) {
			if(clientData.getReceiver() != null && !clientData.getReceiver().equalse("")) {
				//접속된 session객체를 이용해서 데이터 전송하기
				//session.getBasicRemote() => 접속한 세션과 연결되는 스트림을 가져옴.
				
				s.getBasicRemote().sendText(new Gson().toJson(m));
			}
		}
	 }
  }
}
