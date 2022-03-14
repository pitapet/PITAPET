package com.kh.pitapet.product.model.service;

import java.util.List;

import com.kh.pitapet.common.util.PageInfo;
import com.kh.pitapet.product.model.vo.Product;
import com.kh.pitapet.product.model.vo.ProductInfo;

public interface ProductService {

	List<Integer> getProductNo();

	Product findProductByNo(int no);

	int getProductInfoCount();

	List<Product> getProductInfoList(PageInfo pageInfo);

	ProductInfo findProductInfoByNo(int no);

	int deleteProductInfo(int no);

	List<Product> findAllProduct();
	
	int saveProductInfo(ProductInfo productInfo);
	
	Product findProductInfoByINo(int no);
	
	int saveProduct(Product product);
	
	int getProductCount();
	
	List<Product> getProductList(PageInfo pageInfo);
	
	int getProductInfoCountByPNo(int no);

	int deleteProduct(int no);

	Product findProductByPNo(int no);
	
	
	
	
	int checkTitle(String title);

	int findNoByTitle(String title);

	Product findProductByTitle(String title);

	Product findOnlyProductByNo(int no);

}
