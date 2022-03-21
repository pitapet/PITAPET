package com.kh.pitapet.product.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Buy {
	private int no;
	
	private int productInfoNo;
	
	private int memberNo;
	
	private int count;
	
	private int amount;
	
	private Date buyDate;
}
