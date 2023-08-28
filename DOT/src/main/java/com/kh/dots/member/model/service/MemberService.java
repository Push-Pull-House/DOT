package com.kh.dots.member.model.service;

import com.kh.dots.member.model.vo.Member;

public interface MemberService {

	Member selectOne(String userId);

	Member loginUser(Member m);

	int idCheck(String userId);

	int insertMember(Member m);

	void certifiedPhoneNumber(String userPhone, String numStr);

}
