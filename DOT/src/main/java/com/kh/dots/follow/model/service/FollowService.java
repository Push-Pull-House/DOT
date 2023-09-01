package com.kh.dots.follow.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dots.image.vo.Image;
import com.kh.dots.member.model.vo.Member;

public interface FollowService {

	List<Member> searchFollowerList(int userNo);

	List<Image> searchFollowerImageList(int userNo);

	List<Member> searchFollowList(int userNo);

	int unFollow(Map<String, Integer> map);

	int addFollow(Map<String, Integer> map);

	List<Member> recommandFollowList(int userNo);

//	int deleteDuplicateFollower(int userNo);


	
	

}
