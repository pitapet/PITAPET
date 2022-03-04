package com.kh.pitapet.product.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pitapet.product.model.dao.ProductMapper;
import com.kh.pitapet.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper mapper;

	@Override
	public Product findProductByNo(int no) {
		
		return mapper.selectProductByNo(no);
	}

	@Override
	public List<Integer> getProductNo() {
		return mapper.selectProductNo();
	}



	

}
