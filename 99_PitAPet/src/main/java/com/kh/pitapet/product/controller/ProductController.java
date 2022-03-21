package com.kh.pitapet.product.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pitapet.common.util.FileProcess;
import com.kh.pitapet.common.util.PageInfo;
import com.kh.pitapet.member.model.vo.Member;
import com.kh.pitapet.product.model.service.ProductService;
import com.kh.pitapet.product.model.vo.Buy;
import com.kh.pitapet.product.model.vo.Cart;
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
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@GetMapping("/product")
	public ModelAndView list(ModelAndView model) {
		
		List<Product> products = new ArrayList<Product>();
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

		for(int no : resultList) {
			products.add((Product) service.findProductByNo(no));
		}
		
		model.addObject("product", product);
		model.addObject("products", products);
		model.setViewName("product/product");
		
		return model;
	}
	
	@GetMapping("/list/product")
	public ModelAndView productList(ModelAndView model,
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
	public ModelAndView productInfoList(ModelAndView model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int count,
			@RequestParam(required = false) String no) {
		
		PageInfo pageInfo = null;
		List<ProductInfo> productInfoList = null;
		List<Product> productList = null;
		
		pageInfo = new PageInfo(page, 5, service.getProductInfoCount(no), count);
		productList = service.findAllProduct();
		
		productInfoList = service.getProductInfoList(pageInfo, no);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("productList", productList);
		model.addObject("productInfoList", productInfoList);
		model.setViewName("product/productInfoList");
		
		return model;
	}

	@GetMapping("/cart/list")
	public ModelAndView cartList(ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@ModelAttribute Cart cart,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int count) {
		
		PageInfo pageInfo = null;
		List<Cart> cartList = null;
		List<Product> productList = null;
		List<ProductInfo> productInfoList = null;
		
		productList = service.findAllProduct();
		productInfoList = service.findAllProductInfo();
		int no = loginMember.getNo();
		pageInfo = new PageInfo(page, 5, service.getCartCount(no), count);
		cartList = service.findAllCart(pageInfo, no);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("cartList", cartList);
		model.addObject("productList", productList);
		model.addObject("productInfoList", productInfoList);
		model.setViewName("product/cart");
		
		return model;
	}
	
	@PostMapping("/buy/add")
	@ResponseBody
	public Map<String, Integer> addBuy(
			@RequestParam(value="productInfoNo") int productInfoNo,
			@RequestParam(value="memberNo") int memberNo,
			@RequestParam(value="count") int count,
			@RequestParam(value="amount") int amount,
			@RequestParam(value="cartNo", defaultValue = "0") int cartNo,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@ModelAttribute Buy buy) {
		
		Map<String, Integer> map = new HashMap<>();
		ProductInfo productInfo = null;
		int result = 0;
		
		productInfo = service.findProductInfoByINo(productInfoNo);
		
		log.info("productInfoNo : {}" + productInfoNo);
		log.info("memberNo : {}" + memberNo);
		log.info("count : {}" + count);
		log.info("amount : {}" + amount);
		
		buy.setProductInfoNo(productInfoNo);
		buy.setMemberNo(memberNo);
		buy.setCount(count);
		buy.setAmount(amount);
		
		result = service.saveBuyList(buy);
		
		if(result > 0) {
			if(cartNo != 0) {
				service.deleteCart(cartNo);
			}
			
			int no = productInfoNo;
			int stock = productInfo.getStock() - count;
			service.updateStock(no, stock);
		}
		
		map.put("result", result);
		
		return map;
	}
	
	@GetMapping("/buy/list")
	public ModelAndView buyList(ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@ModelAttribute Buy buy,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int count) {
		
		PageInfo pageInfo = null;
		List<Product> productList = null;
		List<ProductInfo> productInfoList = null;
		List<Buy> buyList = null;
		
		productList = service.findAllProduct();
		productInfoList = service.findAllProductInfo();
		
		int no = loginMember.getNo();
		
		pageInfo = new PageInfo(page, 5, service.getBuyCount(no), count);

		buyList = service.findAllBuy(pageInfo, no);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("productList", productList);
		model.addObject("productInfoList", productInfoList);
		model.addObject("buyList", buyList);
		model.setViewName("/product/buy");
		
		return model;
	}
	
	@GetMapping("/delete/productInfo")
	public ModelAndView deleteProductInfo(ModelAndView model,
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
	public ModelAndView addProduct(ModelAndView model,
			@ModelAttribute Product product) {
		
		int result = 0;
		
		result = service.saveProduct(product);
		
		if(result > 0) {
			model.addObject("msg", "상품 카테고리가 추가되었습니다.");
			model.addObject("script", "window.close();");
		} else {
			model.addObject("msg", "상품 카테고리 추가에 실패하였습니다.");
			model.addObject("script", "window.close();");
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
	@PostMapping("/cart/add")
	public ModelAndView addCart(ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@ModelAttribute Cart cart, 
			@RequestParam("productInfoNo") int no) {
		int result = 0;
		int count = 0;
		
		cart.setMemberNo(loginMember.getNo());
		
		count = service.getCartCountByINo(no);
		
		if(count == 0) {
			result = service.saveCart(cart);
		
			if(result > 0) {
				model.addObject("msg", "장바구니에 상품이 추가되었습니다.");
				model.addObject("location", "/product/cart/list");
			} else {
				model.addObject("msg", "상품을 장바구니에 담지 못하였습니다.");
				model.addObject("location", "/product/product");
			}
			
		} else {
			model.addObject("msg", "이미 장바구니에 담은 상품입니다.");
			model.addObject("location", "/product/product");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@PostMapping("/cart/update")
	public ModelAndView updateCart(ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@ModelAttribute Cart cart) {
		
		int result = 0;
		
		result = service.saveCart(cart);
		
		if(result > 0) {
			model.addObject("msg", "상품 수량이 수정되었습니다.");
			model.addObject("location", "/product/cart/list");
		} else {
			model.addObject("msg", "상품 수량 수정에 실패하였습니다.");
			model.addObject("location", "/product/cart/list");
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/cart/delete")
	public ModelAndView deleteProductInfo(ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam("no") int no) {
		
		int result = 0;

		result = service.deleteCart(no);
		
		if(result > 0) {
			model.addObject("msg", "상품이 삭제되었습니다.");
			model.addObject("location", "/product/cart/list");
		} else {
			model.addObject("msg", "상품 삭제에 실패하였습니다.");
			model.addObject("location", "/product/cart/list");
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/add/productInfo")
	public ModelAndView addProductInfo(ModelAndView model) {

		List<Product> productList = service.findAllProduct();
		
		model.addObject("productList", productList);
		model.setViewName("product/addProductInfo");
		
		return model;
	}
	
	@PostMapping("/add/productInfo")
	public ModelAndView addProductInfo(ModelAndView model,
			@ModelAttribute ProductInfo productInfo,
			@RequestParam("upfile") MultipartFile upfile) {
		
		int result = 0;
		
		if(upfile != null && !upfile.isEmpty()) {
			String location = null;
			String renamedFileName = null;

			try {
				location = resourceLoader.getResource("resources/upload/product").getFile().getPath();
				renamedFileName = FileProcess.save(upfile, location);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(renamedFileName != null) {
				productInfo.setOriginalFileName(upfile.getOriginalFilename());
				productInfo.setRenamedFileName(renamedFileName);
			}
		}
		
		result = service.saveProductInfo(productInfo);
		
		if(result > 0) {
			model.addObject("msg", "상품이 등록되었습니다.");
			model.addObject("script", "window.close();");
		} else {
			model.addObject("msg", "상품 등록에 실패하였습니다.");
			model.addObject("script", "window.close();");
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/update/product")
	public ModelAndView updateProduct(ModelAndView model,
			@RequestParam("no") int no) {
		
		Product product = service.findProductByPNo(no);
		
		model.addObject("product", product);
		model.setViewName("product/updateProduct");
		
		return model;
	}
	
	@PostMapping("/update/product")
	public ModelAndView updateProduct(ModelAndView model,
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
	public ModelAndView updateProductInfo(ModelAndView model,
			@RequestParam("no") int no) {
		
		ProductInfo productInfo = service.findProductInfoByINo(no);
		Product product = service.findProductByPNo(productInfo.getProductNo());
		
		model.addObject("productInfo", productInfo);
		model.addObject("product", product);
		model.setViewName("product/updateProductInfo");
		
		return model;
	}
	
	@PostMapping("/update/productInfo")
	public ModelAndView updateProductInfo(ModelAndView model,
			@ModelAttribute ProductInfo productInfo,
			@RequestParam("upfile") MultipartFile upfile) {
		int result = 0;
		
		if(upfile != null && !upfile.isEmpty()) {
			String renamedFileName = null;
			String location = null;
			
			try {
				location = resourceLoader.getResource("resources/upload/product").getFile().getPath();
				
				if(productInfo.getRenamedFileName() != null) {
					FileProcess.delete(location + "/" + productInfo.getRenamedFileName());
				}
				
				renamedFileName = FileProcess.save(upfile, location);
				
				if(renamedFileName != null) {
					productInfo.setOriginalFileName(upfile.getOriginalFilename());
					productInfo.setRenamedFileName(renamedFileName);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
		result = service.saveProductInfo(productInfo);
		
		if(result > 0) {
			model.addObject("msg", "상품 정보가 수정되었습니다.");
			model.addObject("script", "window.close();");
		} else {
			model.addObject("msg", "상품 정보 수정에 실패하였습니다.");
			model.addObject("script", "window.close();");
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
}
