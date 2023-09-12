package com.kh.dots.common.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dots.common.model.vo.Alarm;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.common.model.vo.Search;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.member.model.vo.Member;

@Repository
public class CommonDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Images> selectList(String keyword) {
		return sqlSession.selectList("common.selectList" , keyword);
	}

	public int keywordList(Map<String, Object> map) {
		return sqlSession.insert("common.keywordList" , map);
	}

	public List<Member> memList1() {
		return sqlSession.selectList("common.memList1");
	}

	public List<Member> memList(Map<String, Object> paramMap, RowBounds rowBounds) {
		return sqlSession.selectList("common.memList",paramMap,rowBounds);
	}

	public int selectMListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("common.selectMListCount",paramMap);
	}

	public List<Feed> feList(Map<String, Object> paramMap) {
		return sqlSession.selectList("common.feList",paramMap);
	}

	public List<Feed> feList1() {
		return sqlSession.selectList("common.feList");
	}

	public int selectFListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("common.selectFListCount",paramMap);
	}

	public int deleteFeed(int i) {
		return sqlSession.delete("common.deleteFeed",i);
	}

	public List<Search> MyHistory(int i) {
		return sqlSession.selectList("common.MyHistory",i);
	}

	public int insertSearch(Search search) {
		return sqlSession.insert("common.insertSearch",search);
	}

	public List<Alarm> selectMyAlarm(int userNo) {
		return sqlSession.selectList("common.selectMyAlarm",userNo);
	}

	public List<Alarm> selectMyAlarm1(int userNo) {
		return sqlSession.selectList("common.selectMyAlarm1",userNo);
	}

	public Member selectMyAlarmUser(int alarmWriter) {
		return sqlSession.selectOne("common.selectMyAlarmUser",alarmWriter);
	}

	public int insertFollowAlarm1(Member m1) {
		return sqlSession.insert("common.insertFollowAlarm1",m1);
	}

	public int updateFollowAlarm1(Member m2) {
		return sqlSession.update("common.updateFollowAlarm1",m2);
	}

	public List<Alarm> selectMyAlarm4() {
		return sqlSession.selectList("common.selectMyAlarm4");
	}

	public Alarm selectAlarmOne(int ano) {
		return sqlSession.selectOne("common.selectAlarmOne",ano);
	}

	public int updateRead(int ano) {
		return sqlSession.delete("common.updateRead",ano);
	}
	
}
