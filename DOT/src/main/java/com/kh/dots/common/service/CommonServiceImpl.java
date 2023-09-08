package com.kh.dots.common.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dots.common.model.dao.CommonDao;
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
}
