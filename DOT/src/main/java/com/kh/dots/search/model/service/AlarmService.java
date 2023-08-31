package com.kh.dots.search.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dots.search.model.vo.Board;

public interface AlarmService {

	public List<Board> alarmList(Map<String, Object> map);

	//public String convertAndSend(String userId);
	
}
