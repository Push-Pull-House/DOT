package com.kh.dots.image.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Image {

	private int fileNo;
	private int fileWriter;
	private String originName;
	private String changeName;
	private String filePath;
	private String status;
	private int fileLever;
	private int fileFno;
	
}
