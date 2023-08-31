package com.kh.dots.search.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Search {

	private int searchNo; //SEARCH_NO
	private int searchWriter; //SEARCH_WRITER
	private String searchKeyword; //SEARCH_KEYWORD
	private Date enrollDate; //ENROLL_DATE
	
}
