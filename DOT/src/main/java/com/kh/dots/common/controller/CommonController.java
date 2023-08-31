package com.kh.dots.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.dots.common.service.CommonService;

@Controller
public class CommonController {
	
	@Autowired
	private CommonService cService;
	
}
