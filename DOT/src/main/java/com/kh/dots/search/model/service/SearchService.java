package com.kh.dots.search.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dots.search.model.vo.Image;

public interface SearchService {
	
	public List<Image> selectList(String keyword);

	public int keywordList(Map<String, Object> map);

}
