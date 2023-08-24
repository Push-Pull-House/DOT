package com.kh.dots.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dots.member.model.dao.MemberDao;
import com.kh.dots.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public Member selectOne(String userId) {
		return memberDao.selectOne(userId);
	}

	@Override
	public Member loginUser(Member m) {
		return memberDao.loginUser(m);
	}
}
