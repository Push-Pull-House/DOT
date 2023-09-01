package com.kh.dots.chatting.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatMessage {

	private int chatNo;
	private int chatRoomNo;
	private int userNo;
	private String message;
	private Date enrollDate;
	
	private String userNick;

}
