package com.kh.pitapet.product.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pitapet.member.model.vo.Member;
import com.kh.pitapet.product.model.service.ProductService;
import com.kh.pitapet.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("selectedProduct")
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
	
	@PostMapping("/add")
	public ModelAndView addProduct(
			ModelAndView model,
			@ModelAttribute Product product) {
		
		int result = 0;
		
		result = service.save(product);
					
		if(result > 0) {
			model.addObject("msg", "상품이 등록되었습니다.");
			model.addObject("location", "/product/product");
		} else {
			model.addObject("msg", "상품 등록에 실패하였습니다.");
			model.addObject("location", "/product/product");
		}
		
		// 관리자 로그인 확인 인터셉터 추가
		/*
		String role = loginMember.getRole();
		
		if(role.equals("ROLE_ADMIN")) {

		} else {
			model.addObject("msg", "관리자 계정이 아닙니다.");
			model.addObject("location", "/product/product");
		}
		
		model.setViewName("common/msg");
		*/
		
		return model;
	}
	
	@PostMapping("/update")
	public ModelAndView update(
			ModelAndView model,
			@RequestBody String title,
			@SessionAttribute Product selectedProduct,
			@ModelAttribute Product product) {
		
		int result = 0;
		int no = 0;
		
		no = service.findNoByTitle(title);
		
		product.setNo(selectedProduct.getNo());
		
		result = service.update(product);
		
		if(result > 0) {
			model.addObject("msg", "상품이 수정되었습니다.");
			model.addObject("location", "/product/product");
		} else {
			model.addObject("msg", "상품 수정에 실패하였습니다.");
			model.addObject("location", "/product/product");			
		}
		
		return model;
	}
	
	@PostMapping("/checkTitle")
	@ResponseBody
	public int checkTitle(
			ModelAndView model,
			@RequestBody String title,
			@ModelAttribute Product product) {
		
		int checkTitle = 0;
		Product selectedProduct = service.findProductByNo(service.findNoByTitle(title));
		
		//Product selectedProduct = service.findProductByTitle(title);
		
		log.info("title 데이터 : {}", title);
		checkTitle = service.checkTitle(title);
		System.out.println(checkTitle);
		model.addObject("selectedProduct", selectedProduct);
		
		return checkTitle;
	}
	
	/*
	@GetMapping("/productCheck")
	public ModelAndView productCheck(
			ModelAndView model,
			@ModelAttribute Product product,
			@SessionAttribute Member loginMember,
			@SessionAttribute Product selectProduct) {
		
		
		
		
		return model;
	}
	*/
	
}
