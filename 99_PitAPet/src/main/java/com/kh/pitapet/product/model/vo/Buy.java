package com.kh.pitapet.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Buy {
	private int no;
	
	private int memberNo;
	
	private int productInfoNo;
	
	private int count;
}
