package com.kh.dots.feed.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dots.feed.model.vo.Choice;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.feed.model.vo.Friend;
import com.kh.dots.feed.model.vo.Like;
import com.kh.dots.feed.model.vo.Reply;
import com.kh.dots.member.model.vo.Member;

import net.nurigo.java_sdk.api.Image;

@Repository
public class FeedDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	public List<Member> profile(int userNo) {
		return sqlSession.selectList("feed.profile",userNo);
	}

	public List<Image> feedimg4() {
		return sqlSession.selectList("feed.feedimg4");
	}

	public List<Feed> feedList4() {
		return sqlSession.selectList("feed.feedList4");
	}

	public List<Reply> reply4() {
		return sqlSession.selectList("feed.reply4");
	}

	public int insertReply(Reply r) {
		return sqlSession.insert("feed.insertReply",r);
	}

	public List<Reply> selectReplyList(int bno) {
		return sqlSession.selectList("feed.selectReplyList",bno);
	}

	public int insertLike(Like l) {
		return sqlSession.insert("feed.insertLike",l);
	}

	public List<Like> like4(int userNo) {
		return sqlSession.selectList("feed.like4",userNo);
	}
	
	public int updateLike(Feed f) {
		return sqlSession.insert("feed.updateLike",f);
	}

	public int removeLike(Like l) {
		return sqlSession.delete("feed.removeLike",l);
	}

	public int removeLikeCount(Feed f) {
		return sqlSession.update("feed.removeLikeCount",f);
	}

	public int addChoice(Choice c) {
		return sqlSession.insert("feed.addChoice",c);
	}

	public int removeChoice(Choice c) {
		return sqlSession.delete("feed.removeChoice",c);
	}

	public List<Choice> choice4(int userNo) {
		return sqlSession.selectList("feed.choice4",userNo);
	}

	public List<Feed> likeCount(int feedNo) {
		return sqlSession.selectList("feed.likeCount",feedNo);
	}

	public List<Choice> checkChoice(Feed f ){
		return sqlSession.selectList("feed.checkChoice", f);
	}

	public List<Friend> friend4(int userNo) {
		return sqlSession.selectList("feed.friend4", userNo);
	}

	public int unFollow(Map<String, Integer> map) {
		return sqlSession.delete("feed.unFollow", map);
	}

	public int addFollow(Map<String, Integer> map) {
		return sqlSession.insert("feed.addFollow", map);
	}

	public List<Friend> friend5(int userNo) {
		return sqlSession.selectList("feed.friend5", userNo);
	}

	public List<Choice> choiceFilter() {
		return sqlSession.selectList("feed.choiceFilter");
	}
		
		
	}
