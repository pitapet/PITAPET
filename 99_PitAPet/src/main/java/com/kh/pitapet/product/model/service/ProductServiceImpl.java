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
	
	@Override
	public int checkTitle(String title) {
		return mapper.selectCountByTitle(title);
	}

	@Override
	public int save(Product product) {
		return mapper.insertProduct(product);
	}

	@Override
	public int update(Product product) {
		return mapper.updateProduct(product);
	}

	@Override
	public int findNoByTitle(String title) {
		return mapper.selectNoByTitle(title);
	}

	@Override
	public Product findProductByTitle(String title) {
		return mapper.selectProductByTitle(title);
	}



	

}
