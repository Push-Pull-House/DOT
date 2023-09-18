package com.kh.dots.common.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dots.common.model.vo.Alarm;
import com.kh.dots.common.model.vo.Images;

public interface CommonService {

	public List<Images> selectList(String keyword);

	public int keywordList(Map<String, Object> map);

	public int insertChatAlarm(Alarm alarm);
}
