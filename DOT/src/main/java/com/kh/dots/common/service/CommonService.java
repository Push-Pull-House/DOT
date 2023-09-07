package com.kh.dots.common.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.dots.common.model.vo.Images;
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
}
