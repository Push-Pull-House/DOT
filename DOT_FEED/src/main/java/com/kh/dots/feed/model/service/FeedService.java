package com.kh.dots.feed.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dots.feed.model.vo.Choice;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.feed.model.vo.Friend;
import com.kh.dots.feed.model.vo.Like;
import com.kh.dots.feed.model.vo.Reply;
import com.kh.dots.member.model.vo.Member;

import net.nurigo.java_sdk.api.Image;

public interface FeedService {

	List<Member> profile(int userNo);

	List<Image> feedimg4();

	List<Feed> feedList4();

	List<Reply> reply4();

	int insertReply(Reply r);

	List<Reply> selectReplyList(int bno);

	int insertLike(Like l);

	int updateLike(Feed f);

	List<Like> like4(int userNo);

	int removeLike(Like l);

	int removeLikeCount(Feed f);

	int addChoice(Choice c);

	int removeChoice(Choice c);

	List<Choice> choice4(int userNo);

	List<Feed> likeCount(int feedNo);

	List<Choice> checkChoice(Feed f);

	List<Friend> friend4(int userNo);

	int unFollow(Map<String, Integer> map);

	int addFollow(Map<String, Integer> map);

	List<Friend> friend5(int userNo);

	List<Choice> choiceFilter();



}
