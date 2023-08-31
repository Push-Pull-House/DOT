package com.kh.dots.search.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dots.search.model.dao.SearchDao;
import com.kh.dots.search.model.vo.Image;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDao searchDao;

	
	public List<Image> selectList(String keyword){
		return searchDao.selectList(keyword);
	}

	public int keywordList(Map<String, Object> map) {
		return searchDao.keywordList(map);
	}
	
}
