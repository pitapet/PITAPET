package com.kh.pitapet.product.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.pitapet.product.model.vo.Product;

public interface ProductService {

	Product findProductByNo(int no);

	List<Integer> getProductNo();



}
