package com.kh.pitapet.product.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductInfo {
	private int no;
	
	private int productNo;
	
	private int price;

	private String colorName;
	
	private String colorCode;
	
//	private String imageName;

	private String originalFileName;

	private String renamedFileName;
	
	private int stock;
	
	private String status;
	
	private Date createdDate;
	
	private Date modifyDate;
	
}
