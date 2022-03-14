package com.kh.pitapet.product.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pitapet.common.util.PageInfo;
import com.kh.pitapet.product.model.service.ProductService;
import com.kh.pitapet.product.model.vo.Product;
import com.kh.pitapet.product.model.vo.ProductInfo;

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
		
		List<Product> products = new ArrayList<Product>();
		Product product = null;
		
		List<Integer> pNo = new ArrayList<Integer>();
		List<Integer> resultList = new ArrayList<Integer>();
		
		pNo = service.getProductNo();
		
		System.out.println(pNo);
		
		for(int i : pNo) {
			if(!resultList.contains(i)) {
				resultList.add(i);
			}
		}
		
		System.out.println(resultList);
		
		Collections.shuffle(resultList);
		
		System.out.println(resultList);

		for(int no : resultList) {
			products.add((Product) service.findProductByNo(no));
		}
		
		System.out.println(product);
		System.out.println(products);
		
		model.addObject("product", product);
		model.addObject("products", products);
		model.setViewName("product/product");
		
		return model;
	}
	
	@GetMapping("/list/product")
	public ModelAndView productList(
			ModelAndView model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int count) {
		
		PageInfo pageInfo = null;
		List<Product> products = null;
		
		pageInfo = new PageInfo(page, 5, service.getProductCount(), count);
		products = service.getProductList(pageInfo);
		
		model.addObject("products", products);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("product/productList");
		
		return model;
	}
	
	@GetMapping("/list/productInfo")
	public ModelAndView productInfoList(
			ModelAndView model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int count) {
		
		PageInfo pageInfo = null;
		List<Product> productList = null;
		
		log.info("page number : {} {}", page, count);
		
		pageInfo = new PageInfo(page, 5, service.getProductInfoCount(), count);
		productList = service.getProductInfoList(pageInfo);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("productList", productList);
		model.setViewName("product/productInfoList");
		
		return model;
	}
	
	@GetMapping("/delete/productInfo")
	public ModelAndView deleteProductInfo(
			ModelAndView model,
			@RequestParam("no") int no) {
		
		int result = 0;

		result = service.deleteProductInfo(no);
		
		if(result > 0) {
			model.addObject("msg", "상품이 삭제되었습니다.");
			model.addObject("location", "/product/list/productInfo");
		} else {
			model.addObject("msg", "상품 삭제에 실패하였습니다.");
			model.addObject("location", "/product/list/productInfo");
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/delete/product")
	public ModelAndView deleteProduct(ModelAndView model,
			@RequestParam("no") int no) {
		int result = 0;
		int count = 0;
		
		count = service.getProductInfoCountByPNo(no);
		
		
		if(count == 0) {
			
			result = service.deleteProduct(no);

			if(result > 0) {
				model.addObject("msg", "카테고리가 삭제되었습니다.");
				model.addObject("location", "/product/list/product");
			} else {
				model.addObject("msg", "카테고리 삭제에 실패하였습니다.");
				model.addObject("location", "/product/list/product");
			}
			
		} else {
			model.addObject("msg", "상품이 존재하므로 해당 카테고리를 삭제할 수 없습니다.");
			model.addObject("location", "/product/list/product");
		}
		model.setViewName("common/msg");
		
		return model;
		
	}
	
	@GetMapping("/add/product")
	public String addProduct() {
		
		return "product/addProduct";
	}
	
	@PostMapping("/add/product")
	public ModelAndView addProduct(
			ModelAndView model,
			@ModelAttribute Product product) {
		
		int result = 0;
		
		result = service.saveProduct(product);
		
		if(result > 0) {
			model.addObject("msg", "상품 카테고리가 추가되었습니다.");
			model.addObject("location", "/product/list/product");
		} else {
			model.addObject("msg", "상품 카테고리 추가에 실패하였습니다.");
			model.addObject("location", "/product/list/product");
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/add/productInfo")
	public ModelAndView addProductInfo(
			ModelAndView model) {

		List<Product> products = service.findAllProduct();
		
		model.addObject("products", products);
		model.setViewName("product/addProductInfo");
		
		return model;
	}
	
	@PostMapping("/add/productInfo")
	public ModelAndView addProductInfo(
			ModelAndView model,
			@ModelAttribute ProductInfo productInfo
//			@RequestParam("upfile") MultipartFile upfile
			) {
		
		int result = 0;
		
		result = service.saveProductInfo(productInfo);
		
		if(result > 0) {
			model.addObject("msg", "상품이 등록되었습니다.");
			model.addObject("script", "window.close();");
		} else {
			model.addObject("msg", "상품 등록에 실패하였습니다.");
			model.addObject("script", "window.close();");
		}
		model.setViewName("common/msg");
		
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
	
	@GetMapping("/update/product")
	public ModelAndView updateProduct(
			ModelAndView model,
			@RequestParam("no") int no) {
		
		Product product = service.findProductByPNo(no);
		
		model.addObject("product", product);
		model.setViewName("product/updateProduct");
		
		return model;
	}
	
	@PostMapping("/update/product")
	public ModelAndView updateProduct(
			ModelAndView model,
			@ModelAttribute Product product) {
		
		int result = 0;
		
		result = service.saveProduct(product);
		
		if(result > 0) {
			model.addObject("msg", "상품 카테고리가 수정되었습니다.");
			model.addObject("script", "window.close();");
		} else {
			model.addObject("msg", "상품 카테고리 수정에 실패하였습니다.");
			model.addObject("script", "window.close();");
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/update/productInfo")
	public ModelAndView updateProductInfo(
			ModelAndView model,
			@RequestParam("no") int no) {
		
		Product product = service.findProductInfoByINo(no);
		List<ProductInfo> productInfoes = product.getProductInfoes();
		
		System.out.println(product);
		System.out.println(productInfoes);
		
		model.addObject("productInfoes", productInfoes);
		model.addObject("product", product);
		model.setViewName("product/updateProductInfo");
		
		return model;
	}
	
	
	
	@PostMapping("/checkTitle")
	@ResponseBody
	public int checkTitle(
			ModelAndView model,
			@RequestBody String title,
			@ModelAttribute Product product) {
		
		int checkTitle = 0;
////		Product selectedProduct = service.findProductByNo(service.findNoByTitle(title));
		
//		//Product selectedProduct = service.findProductByTitle(title);
		
		log.info("title 데이터 : {}", title);
		checkTitle = service.checkTitle(title);
		System.out.println(checkTitle);
////		model.addObject("selectedProduct", selectedProduct);
		
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
