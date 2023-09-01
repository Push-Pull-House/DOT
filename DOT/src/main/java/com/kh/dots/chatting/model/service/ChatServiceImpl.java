package com.kh.dots.chatting.model.service;

import java.util.List;
import java.util.Map;

import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dots.chatting.model.dao.ChatDao;
import com.kh.dots.chatting.model.vo.ChatMessage;
import com.kh.dots.chatting.model.vo.ChatRoom;
import com.kh.dots.chatting.model.vo.ChatRoomJoin;
import com.kh.dots.common.Utils;

@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private ChatDao cDao;
	
	
	@Override
	public int openChatRoom(ChatRoom chatRoom) {
		return cDao.openChatRoom(chatRoom);
	}
	
	@Override
	public List<ChatRoom> selectChatRoomList(int userNo) {
		return cDao.selectChatRoomList(userNo);
	}

	@Override
	public int insertChatRoom(ChatRoomJoin join) {
		return cDao.insertChatRoom(join);
	}

	@Override
	public int selectOne(String title) {
		return cDao.selectOne(title);
	}

	@Override
	public List<ChatRoom> selectChatRoomListByKeyword(Map<String, Object> map) {
		return cDao.selectChatRoomListByKeyword(map);
	}

	@Override
	public List<ChatRoomJoin> joinChatRoom(ChatRoomJoin join) {
		return cDao.joinChatRoom(join);
	}

	@Override
	public List<ChatMessage> selectMsgList(ChatRoomJoin join) {
		return cDao.selectMsgList(join);
	}

	@Override
	public int insertMessage(ChatMessage cm) {
		
		cm.setMessage(Utils.XSSHandling(cm.getMessage()));
		cm.setMessage(Utils.newLineHandling(cm.getMessage()));
		
		return cDao.insertMessage(cm);
	}

	

}
