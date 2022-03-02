package com.kh.pitapet.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pitapet.product.model.service.ProductService;
import com.kh.pitapet.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@GetMapping("/product")
	public ModelAndView list(
			ModelAndView model,
			@RequestParam(value = "no", defaultValue = "1") int no) {

		Product product = service.findProductByNo(no);
		
		System.out.println(product);
		
		model.addObject("product", product);
		
		model.setViewName("product/product");
		
		return model;
	}
	
	
}
