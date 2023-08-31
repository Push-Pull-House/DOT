package com.kh.dots.search.model.vo;

import lombok.Data;

@Data
public class Image {

	private int fileNo;	//	FILE_NO
	private int fileWriter;	//	FILE_WRITER
	private String originName; //	ORIGIN_NAME
	private String changeName; //	CHANGE_NAME
	private String filePath; //	FILE_PATH
	private String status; //	STATUS
	private int fileLevel; //	FILE_LEVEL
	private int fileFno; //	FILE_FNO
}
