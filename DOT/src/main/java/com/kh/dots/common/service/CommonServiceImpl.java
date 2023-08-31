package com.kh.dots.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dots.common.model.dao.CommonDao;

@Service
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	private CommonDao cDao;
}
