package com.kh.dots.chatting.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dots.chatting.model.vo.ChatMessage;
import com.kh.dots.chatting.model.vo.ChatRoom;
import com.kh.dots.chatting.model.vo.ChatRoomJoin;

@Repository
public class ChatDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int openChatRoom(ChatRoom chatRoom) {
		
		int result = sqlSession.insert("chatting.openChatRoom", chatRoom);
		
		if(result > 0) {
			result = chatRoom.getChatRoomNo();
		}
		return result; 
	}
	
	
	public List<ChatRoom> selectChatRoomList(int userNo) {
		return sqlSession.selectList("chatting.selectChatRoomList",userNo);
	}


	public int insertChatRoom(ChatRoomJoin join) {
		return sqlSession.insert("chatting.insertChatRoom", join);
	}


	public int selectOne(String title) {
		return sqlSession.selectOne("chatting.selectOne",title);
	}


	public List<ChatRoom> selectChatRoomListByKeyword(Map<String, Object> map) {
		return sqlSession.selectList("chatting.selectChatRoomListByKeyword", map);
	}


	public List<ChatRoomJoin> joinChatRoom(ChatRoomJoin join) {
		return sqlSession.selectList("chatting.joinChatRoom", join);
	}


	public List<ChatMessage> selectMsgList(ChatRoomJoin join) {
		return sqlSession.selectList("chatting.selectMsgList", join);
	}


	public int insertMessage(ChatMessage cm) {
		return sqlSession.insert("chatting.insertMessage", cm);
	}
	
	
}
