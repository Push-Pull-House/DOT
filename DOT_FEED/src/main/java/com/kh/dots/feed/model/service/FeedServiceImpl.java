package com.kh.dots.feed.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dots.feed.model.dao.FeedDao;
import com.kh.dots.feed.model.vo.Choice;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.feed.model.vo.Friend;
import com.kh.dots.feed.model.vo.Like;
import com.kh.dots.feed.model.vo.Reply;
import com.kh.dots.member.model.vo.Member;

import net.nurigo.java_sdk.api.Image;

@Service
public class FeedServiceImpl implements FeedService {
	
	@Autowired
	private FeedDao fDao;


	@Override
	public List<Member> profile(int userNo) {
		return fDao.profile(userNo);
	}
	
	@Override
	public List<Image> feedimg4() {
		return fDao.feedimg4();
	}

	@Override
	public List<Feed> feedList4() {
		return fDao.feedList4();
	}

	@Override
	public List<Reply> reply4() {
		return fDao.reply4();
	}

	@Override
	public int insertReply(Reply r) {
		return fDao.insertReply(r);
	}

	@Override
	public List<Reply> selectReplyList(int bno) {
		return fDao.selectReplyList(bno);
	}


	@Override
	public int updateLike(Feed f) {
		return fDao.updateLike(f);
	}

	@Override
	public List<Like> like4(int userNo) {
		return fDao.like4(userNo);
	}

	@Override
	public int removeLikeCount(Feed f) {
		return fDao.removeLikeCount(f);
	}
	@Override
	public int insertLike(Like l) {
		return fDao.insertLike(l);
	}
	
	@Override
	public int removeLike(Like l) {
		return fDao.removeLike(l);
	}

	@Override
	public int addChoice(Choice c) {
		return fDao.addChoice(c);
	}

	@Override
	public int removeChoice(Choice c) {
		return fDao.removeChoice(c);
	}

	@Override
	public List<Choice> choice4(int userNo) {
		return fDao.choice4(userNo);
	}

	@Override
	public List<Feed> likeCount(int feedNo) {
		return fDao.likeCount(feedNo);
	}

	@Override
	public List<Choice> checkChoice(Feed f) {
		return fDao.checkChoice(f);
	}

	@Override
	public List<Friend> friend4(int userNo) {
		return fDao.friend4(userNo);
	}

	@Override
	public int unFollow(Map<String, Integer> map) {
		return fDao.unFollow(map);
	}

	@Override
	public int addFollow(Map<String, Integer> map) {
		return fDao.addFollow(map);
	}

	@Override
	public List<Friend> friend5(int userNo) {
		return fDao.friend5(userNo);
	}

	@Override
	public List<Choice> choiceFilter() {
		return fDao.choiceFilter();
	}

}
