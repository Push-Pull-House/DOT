package com.kh.dots.common.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dots.common.model.vo.Alarm;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.common.model.vo.Report;
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

	public List<Feed> feList(Map<String, Object> paramMap, RowBounds rowBounds) {
		return sqlSession.selectList("common.feList",paramMap, rowBounds);
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
	
	public int insertFollowAlarm1(Member m1) {
		return sqlSession.insert("common.insertFollowAlarm1",m1);
	}

	public int updateFollowAlarm1(Member m2) {
		return sqlSession.update("common.updateFollowAlarm1",m2);
	}

	public Alarm selectAlarmOne(int ano) {
		return sqlSession.selectOne("common.selectAlarmOne",ano);
	}

	public int updateRead(int ano) {
		return sqlSession.delete("common.updateRead",ano);
	}

	public int insertLikeAlarm1(Member m1) {
		return sqlSession.insert("common.insertLikeAlarm1",m1);
	}

	public int updateLikeAlarm1(Member m2) {
		return sqlSession.update("common.updateLikeAlarm1",m2);
	}

	public int deleteMemberAdmin(Map<String, Object> map) {
		return sqlSession.update("common.deleteMemberAdmin",map);
	}

	public List<Member> WList(Map<String, Object> paramMap, RowBounds rowBounds) {
		return sqlSession.selectList("common.WList",paramMap,rowBounds);
	}

	public int selectWListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("common.selectWListCount",paramMap);
	}

	public List<Member> BList(Map<String, Object> paramMap, RowBounds rowBounds) {
		return sqlSession.selectList("common.BList",paramMap,rowBounds);
	}

	public int selectBListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("common.selectBListCount",paramMap);
	}

	public List<Report> selectReportList(Map<String, Object> paramMap, RowBounds rowBounds) {
		return sqlSession.selectList("common.selectReportList",paramMap,rowBounds);
	}

	public int selectRListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("common.selectRListCount",paramMap);
	}

	public Report detailList(int reportNo) {
		return sqlSession.selectOne("common.detailList",reportNo);
	}

	public int updateReadReport(int reportNo) {
		return sqlSession.update("common.updateReadReport",reportNo);
	}

	public int deleteReport(int i) {
		return sqlSession.delete("common.deleteReport",i);
	}
	
}
