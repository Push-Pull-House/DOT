package com.kh.dots.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dots.common.model.vo.Images;
import com.kh.dots.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectOne(String userId) {
		return sqlSession.selectOne("member.selectOne", userId);
	}
	
	public Member selectOne(int userNo) {
		return sqlSession.selectOne("member.selectOneByUserNo", userNo);
	}

	public Member loginUser(Member m) {
		return sqlSession.selectOne("member.loginUser", m);
	}

	public int idCheck(String userId) {
		return sqlSession.selectOne("member.idCheck", userId);
	}

	public int insertMember(Member m) {
		return sqlSession.insert("member.insertMember",m);
	}

	public Images selectListImages(int userNo) {
		return sqlSession.selectOne("member.selectListImages",userNo);
	}

	public List<Images> selectListMyImg(int userNo) {
		return sqlSession.selectList("member.selectListMyImg",userNo);
	}

	public List<Images> detailMyFeedModal(int imgNo) {
		return sqlSession.selectList("member.detailMyFeedModal",imgNo);
	}

	public List<Object> sideFriendList(int userNo) {
		return sqlSession.selectList("member.sideFriendList", userNo);
	}

	public Member checkMember(int userNo) {
		return sqlSession.selectOne("member.checkMember", userNo);
	}

	public int updateMember(Member m) {
		return sqlSession.update("member.updateMember",m);
	}

	public int updateProfileImg(Member m) {
		return sqlSession.update("member.updateProfileImg",m);
	}

	public int insertProFileImg() {
		return sqlSession.insert("member.insertProFileImg");
	}

	public int changePwd(Member m) {
		return sqlSession.update("member.changePwd",m);
	}

	public int deleteUser(Member m) {
		return sqlSession.update("member.deleteUser",m);
	}

	public Member logincheck(Member m) {
		return sqlSession.selectOne("member.logincheck",m);
	}

	public int loginPwdReset(Member m) {
		return sqlSession.update("member.loginPwdReset",m);
	}
}
