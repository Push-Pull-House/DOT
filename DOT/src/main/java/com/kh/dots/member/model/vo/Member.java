package com.kh.dots.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member {
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String userNick;
	private String userPhone;
	private String userEmail;
	private String userMbti;
	private Date enrollDate;
	private Date userBirthday;
	private boolean enable;
	private String wbStatus;
	private String status;
}
