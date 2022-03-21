package com.kh.pitapet.product.model.service;

import java.util.List;

import com.kh.pitapet.common.util.PageInfo;
import com.kh.pitapet.product.model.vo.Buy;
import com.kh.pitapet.product.model.vo.Cart;
import com.kh.pitapet.product.model.vo.Product;
import com.kh.pitapet.product.model.vo.ProductInfo;

public interface ProductService {

	List<Integer> getProductNo();

	Product findProductByNo(int no);

	int getProductInfoCount(String no);

	List<ProductInfo> getProductInfoList(PageInfo pageInfo, String no);
	
//	List<ProductInfo> getProductInfoList(String no);

	ProductInfo findProductInfoByNo(int no);

	int deleteProductInfo(int no);

	List<Product> findAllProduct();
	
	int saveProductInfo(ProductInfo productInfo);
	
	ProductInfo findProductInfoByINo(int no);
	
	int saveProduct(Product product);
	
	int getProductCount();
	
	List<Product> getProductList(PageInfo pageInfo);
	
	int getProductInfoCountByPNo(int no);

	int deleteProduct(int no);

	Product findProductByPNo(int no);

	int getCartCount(int no);

	List<Cart> findAllCart(PageInfo pageInfo, int no);

	List<ProductInfo> findAllProductInfo();

	int saveCart(Cart cart);

	int deleteCart(int no);

	int getCartCountByINo(int no);

	Cart findCartByNo(int no);

	int saveBuyList(Buy buy);

	List<Buy> findAllBuy(PageInfo pageInfo, int no);

	int getBuyCount(int no);

	int updateStock(int no, int stock);
}
