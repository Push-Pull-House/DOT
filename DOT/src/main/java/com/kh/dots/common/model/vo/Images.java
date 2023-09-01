package com.kh.dots.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Images {
	private int fileNo;
	private int fileWriter;
	private String originName;
	private String changeName;
	private String filePath;
	private String status;
	private int fileLevel;
	private int fileFno;
}
