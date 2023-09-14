package com.kh.dots.follow.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dots.common.model.vo.Images;
import com.kh.dots.member.model.vo.Member;

@Repository
public class FollowDao {

	@Autowired
	private SqlSessionTemplate Session;
	
	public List<Member> searchFollowerList(int userNo) {
		return 	Session.selectList("follow.searchFollowerList",userNo);
	}

	public List<Images> searchFollowerImageList(int userNo) {
		return Session.selectList("follow.searchFollowerImageList",userNo);
	}

	public List<Member> searchFollowList(int userNo) {
		return Session.selectList("follow.searchFollowList",userNo);
	}

	public int unFollow(Map<String, Integer> map) {
		return Session.delete("follow.unFollow",map);
	}

	public int addFollow(Map<String, Integer> map) {
		return Session.insert("follow.addFollow",map);
	}

	public List<Member> recommandFollowList(int userNo) {
		List<Member> list = Session.selectList("follow.recommandFollowList",userNo);
		return Session.selectList("follow.recommandFollowList",userNo);
	}

//	public int deleteDuplicateFollower(int userNo) {
//		return Session.delete("follow.deleteDuplicateFollower",userNo);
//	}


}
