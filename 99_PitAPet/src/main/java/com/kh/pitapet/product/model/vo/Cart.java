package com.kh.pitapet.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
	private int no;
	
	private int count;
	
	private int memberNo;

	private int productInfoNo;
}
