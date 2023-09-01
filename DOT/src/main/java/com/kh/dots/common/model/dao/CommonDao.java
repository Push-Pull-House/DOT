package com.kh.dots.common.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dots.common.model.vo.Images;

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
	
}
