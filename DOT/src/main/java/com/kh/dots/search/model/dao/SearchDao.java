package com.kh.dots.search.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dots.search.model.vo.Image;

@Repository
public class SearchDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Image> selectList(String keyword) {
		return sqlSession.selectList("searchMapper.selectList" , keyword);
	}

	public int keywordList(Map<String, Object> map) {
		return sqlSession.insert("searchMapper.keywordList" , map);
	}
	
}
