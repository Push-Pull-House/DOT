package com.kh.dots.search.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dots.search.model.vo.Board;

@Repository
public class AlarmDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Board> alarmList(Map<String, Object> map){
		return sqlSession.selectList("searchMapper.alarmList", map);
	}

//	public String convertAndSend(String userId) {
//		return sqlSession.selectList("searchMapper.convertAndSend", userId);
//	}
	
}
