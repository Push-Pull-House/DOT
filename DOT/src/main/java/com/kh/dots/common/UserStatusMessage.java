package com.kh.dots.common;

import java.sql.Date;
import java.util.List;

import com.kh.dots.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserStatusMessage {
    private String userNick;
    private boolean checkLog;
    private int userNo;
    private List<Member> friendList;
    
    // Getter 및 Setter 메서드
}
