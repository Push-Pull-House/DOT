package com.kh.dots.search.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dots.search.model.dao.AlarmDao;
import com.kh.dots.search.model.vo.Board;

@Service
public class AlarmServiceImpl implements AlarmService {

	@Autowired
	private AlarmDao alarmDao;
	
	public List<Board> alarmList(Map<String, Object> map) {
		return alarmDao.alarmList(map);
	}

//	@Override
//	public String convertAndSend(String userId) {
//		return alarmDao.convertAndSend(userId);
//	}
}
