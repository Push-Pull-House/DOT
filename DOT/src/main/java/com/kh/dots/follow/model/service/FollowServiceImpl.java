package com.kh.dots.follow.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dots.follow.model.dao.FollowDao;
import com.kh.dots.image.vo.Image;
import com.kh.dots.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FollowServiceImpl implements FollowService{

	@Autowired
	public FollowDao followDao;

	@Override
	public List<Member> searchFollowerList(int userNo) {
		return followDao.searchFollowerList(userNo);
	}

	@Override
	public List<Image> searchFollowerImageList(int userNo) {
		return followDao.searchFollowerImageList(userNo);
	}

	@Override
	public List<Member> searchFollowList(int userNo) {
		return followDao.searchFollowList(userNo);
	}

	@Override
	public int unFollow(Map<String, Integer> map) {
		return followDao.unFollow(map);
	}

	@Override
	public int addFollow(Map<String, Integer> map) {
		return followDao.addFollow(map);
	}
	
	@Override
	public List<Member> recommandFollowList(int userNo) {
		return followDao.recommandFollowList(userNo);
	}
	
	
	
//	@Override
//	public int deleteDuplicateFollower(int userNo) {
//	    return followDao.deleteDuplicateFollower(userNo);
//	}
	
	
	
	
	
}
