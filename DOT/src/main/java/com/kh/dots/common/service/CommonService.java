package com.kh.dots.common.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.dots.common.model.vo.Alarm;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.common.model.vo.Search;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.member.model.vo.Member;

public interface CommonService {

	public List<Images> selectList(String keyword);

	public int keywordList(Map<String, Object> map);

	public List<Member> memList1();

	public List<Member> memList(Map<String, Object> paramMap, RowBounds rowBounds);

	public int selectMListCount(Map<String, Object> paramMap);

	public List<Feed> feList(Map<String, Object> paramMap, RowBounds rowBounds);

	public List<Feed> feList1();

	public int selectFListCount(Map<String, Object> paramMap);

	public int deleteFeed(int i);

	public List<Search> MyHistory(int i);

	public int insertSearch(Search search);

	public List<Alarm> selectMyAlarm(int userNo);

	public List<Alarm> selectMyAlarm1(int userNo);

	public Member selectMyAlarmUser(int alarmWriter);

	public int insertFollowAlarm1(Member m1);

	public int updateFollowAlarm1(Member m2);

	public List<Alarm> selectMyAlarm4();

	public Alarm selectAlarmOne(int ano);

	public int updateRead(int ano);
}
