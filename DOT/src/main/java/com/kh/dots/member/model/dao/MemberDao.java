package com.kh.dots.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dots.member.model.vo.Member;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectOne(String userId) {
		return sqlSession.selectOne("member.selectOne", userId);
	}

	public Member loginUser(Member m) {
		return sqlSession.selectOne("member.loginUser", m);
	}
}
