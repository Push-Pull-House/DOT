package com.kh.dots.search.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Board {

	private int boardNo; // BOARD_NO
	private int boardWriter; //	BOARD_WRITER
	private String boardTitle; //	BOARD_TITLE
	private String boardContent; //	BOARD_CONTENT
	private Date createDate; //	CREATE_DATE
	private String status; //	STATUS
}
