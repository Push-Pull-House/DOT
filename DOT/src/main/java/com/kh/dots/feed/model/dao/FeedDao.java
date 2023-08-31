package com.kh.dots.feed.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FeedDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}
