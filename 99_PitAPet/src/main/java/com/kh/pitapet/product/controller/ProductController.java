package com.kh.pitapet.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@GetMapping("/product")
	public String product() {
		
		return "product/product";
	}
	/* test */
	
	
}