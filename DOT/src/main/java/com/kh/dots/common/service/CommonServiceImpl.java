package com.kh.dots.common.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dots.common.model.dao.CommonDao;
import com.kh.dots.common.model.vo.Alarm;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.common.model.vo.Search;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.member.model.vo.Member;

@Service
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	private CommonDao cDao;
	
	public List<Images> selectList(String keyword){
		return cDao.selectList(keyword);
	}

	public int keywordList(Map<String, Object> map) {
		return cDao.keywordList(map);
	}

	@Override
	public List<Member> memList1() {
		return cDao.memList1();
	}

	@Override
	public List<Member> memList(Map<String, Object> paramMap, RowBounds rowBounds) {
		return cDao.memList(paramMap,rowBounds);
	}

	@Override
	public int selectMListCount(Map<String, Object> paramMap) {
		return cDao.selectMListCount(paramMap);
	}

	@Override
	public List<Feed> feList(Map<String, Object> paramMap, RowBounds rowBounds) {
		return cDao.feList(paramMap);
	}

	@Override
	public List<Feed> feList1() {
		return cDao.feList1();
	}

	@Override
	public int selectFListCount(Map<String, Object> paramMap) {
		return cDao.selectFListCount(paramMap);
	}

	@Override
	public int deleteFeed(int i) {
		return cDao.deleteFeed(i);
	}

	@Override
	public List<Search> MyHistory(int i) {
		return cDao.MyHistory(i);
	}

	@Override
	public int insertSearch(Search search) {
		return cDao.insertSearch(search);
	}

	@Override
	public List<Alarm> selectMyAlarm(int userNo) {
		return cDao.selectMyAlarm(userNo);
	}

	@Override
	public List<Alarm> selectMyAlarm1(int userNo) {
		return cDao.selectMyAlarm1(userNo);
	}

	@Override
	public Member selectMyAlarmUser(int alarmWriter) {
		return cDao.selectMyAlarmUser(alarmWriter);
	}

	@Override
	public int insertFollowAlarm1(Member m1) {
		return cDao.insertFollowAlarm1(m1);
	}

	@Override
	public int updateFollowAlarm1(Member m2) {
		return cDao.updateFollowAlarm1(m2);
	}

	@Override
	public List<Alarm> selectMyAlarm4() {
		return cDao.selectMyAlarm4();
	}

	@Override
	public Alarm selectAlarmOne(int ano) {
		return cDao.selectAlarmOne(ano);
	}

	@Override
	public int updateRead(int ano) {
		return cDao.updateRead(ano);
	}

	@Override
	public int insertLikeAlarm1(Member m1) {
		return cDao.insertLikeAlarm1(m1);
	}

	@Override
	public int updateLikeAlarm1(Member m2) {
		return cDao.updateLikeAlarm1(m2);
	}

	@Override
	public int deleteMemberAdmin(Map<String, Object> map) {
		return cDao.deleteMemberAdmin(map);
	}

	@Override
	public List<Member> WList(Map<String, Object> paramMap, RowBounds rowBounds) {
		return cDao.WList(paramMap,rowBounds);
	}

	@Override
	public int selectWListCount(Map<String, Object> paramMap) {
		return cDao.selectWListCount(paramMap);
	}

	@Override
	public List<Member> BList(Map<String, Object> paramMap, RowBounds rowBounds) {
		return cDao.BList(paramMap,rowBounds);
	}

	@Override
	public int selectBListCount(Map<String, Object> paramMap) {
		return cDao.selectBListCount(paramMap);
	}
}
