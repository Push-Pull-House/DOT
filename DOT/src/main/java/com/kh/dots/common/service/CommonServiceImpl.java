package com.kh.dots.common.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dots.common.model.dao.CommonDao;
import com.kh.dots.common.model.vo.Images;

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
}
