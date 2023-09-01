package com.kh.dots.chatting.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dots.chatting.model.vo.ChatMessage;
import com.kh.dots.chatting.model.vo.ChatRoom;
import com.kh.dots.chatting.model.vo.ChatRoomJoin;

public interface ChatService {
	
	int openChatRoom(ChatRoom room);
	
	List<ChatRoom> selectChatRoomList(int userNo);

	int insertChatRoom(ChatRoomJoin join);

	int selectOne(String title);

	List<ChatRoom> selectChatRoomListByKeyword(Map<String, Object> map);

	List<ChatRoomJoin> joinChatRoom(ChatRoomJoin join);

	List<ChatMessage> selectMsgList(ChatRoomJoin join);

	int insertMessage(ChatMessage chatMessage);
	

	
	

}
