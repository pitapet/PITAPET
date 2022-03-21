package com.kh.pitapet.product.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private int no;
	
	private String title;
	
	private String content;
	
	private List<ProductInfo> productInfoes;
	
	private Date createdDate;
	
	private Date modifyDate;
	
//	private List<Product> products;
}
