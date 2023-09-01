package com.kh.dots.feed.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dots.feed.model.dao.FeedDao;

@Service
public class FeedServiceImpl implements FeedService {
	
	@Autowired
	private FeedDao fDao;
}
