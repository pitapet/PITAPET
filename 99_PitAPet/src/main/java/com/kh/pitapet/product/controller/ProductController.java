package com.kh.pitapet.product.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pitapet.member.model.vo.Member;
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
			ModelAndView model) {
		
		Product product = null;
		List<Integer> pNo = new ArrayList<Integer>();
		List<Integer> resultList = new ArrayList<Integer>();
		
		pNo = service.getProductNo();
		
		for(int i : pNo) {
			if(!resultList.contains(i)) {
				resultList.add(i);
			}
		}
		
		Collections.shuffle(resultList);
		
		int no = resultList.get(0);
		
		product = service.findProductByNo(no);
		
		model.addObject("product", product);
		
		model.setViewName("product/product");
		
		return model;
	}
	
	@GetMapping("/add")
	public String addProduct() {
		
		return "product/addProduct";
	}
	
	
}
