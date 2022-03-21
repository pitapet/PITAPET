package com.kh.pitapet.community.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int no;
	
	private int rowNum;
	
	private int writerNo;
	
	private String writerId;
	
	private String writerPet;
	
	private String title;
	
	private String content;
	
	private String originalFileName;
	
	private String renameFileName;
	
	private int readCount;
	
	private String status;
	
	private List<Reply> replies;
	
	private Date createDate;
	
	private Date modifyDate;
}