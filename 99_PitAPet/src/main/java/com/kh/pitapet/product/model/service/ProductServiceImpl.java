package com.kh.pitapet.product.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.pitapet.common.util.PageInfo;
import com.kh.pitapet.product.model.dao.ProductMapper;
import com.kh.pitapet.product.model.vo.Buy;
import com.kh.pitapet.product.model.vo.Cart;
import com.kh.pitapet.product.model.vo.Product;
import com.kh.pitapet.product.model.vo.ProductInfo;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper mapper;
	
	@Override
	public List<Integer> getProductNo() {
		return mapper.selectProductNo();
	}

	@Override
	public Product findProductByNo(int no) {
		return mapper.selectProductByNo(no);
	}

	@Override
	public int getProductInfoCount(String no) {
		return mapper.getProductInfoCount(no);
	}

	@Override
	public List<ProductInfo> getProductInfoList(PageInfo pageInfo, String no) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectProductInfoList(rowBounds, no);
	}

//	@Override
//	public List<ProductInfo> getProductInfoList(String no) {
//		return mapper.selectProductInfoList(no);
//	}
	
	@Override
	public ProductInfo findProductInfoByNo(int no) {
		return mapper.selectProductInfoByNo(no);
	}
	
	@Override
	public int deleteProductInfo(int no) {
		return mapper.updateStatusProductInfo(no, "N");
	}

	@Override
	public List<Product> findAllProduct() {
		return mapper.selectAllProduct();
	}

	@Override
	@Transactional
	public int saveProductInfo(ProductInfo productInfo) {
		int result = 0;
		
		if(productInfo.getNo() != 0) {
			result = mapper.updateProductInfo(productInfo);
		} else {
			result = mapper.insertProductInfo(productInfo);
		}
		
		return result;
	}

	@Override
	public ProductInfo findProductInfoByINo(int no) {
		return mapper.selectProductInfoByINo(no);
	}

	@Override
	@Transactional
	public int saveProduct(Product product) {
		int result = 0;
		
		if(product.getNo() != 0) {
			result = mapper.updateProduct(product);
		} else {
			result = mapper.insertProduct(product);
		}
		
		return result;
	}
	
	@Override
	public int getProductCount() {
		return mapper.getProductCount();
	}

	@Override
	public List<Product> getProductList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findProduct(rowBounds);
	}

	@Override
	public int getProductInfoCountByPNo(int no) {
		return mapper.getProductInfoCountByPNo(no);
	}

	@Override
	@Transactional
	public int deleteProduct(int no) {
		return mapper.deleteProduct(no);
	}

	@Override
	public Product findProductByPNo(int no) {
		return mapper.selectProductByPNo(no);
	}

	@Override
	public int getCartCount(int no) {
		return mapper.selectCartCount(no);
	}

	@Override
	public List<Cart> findAllCart(PageInfo pageInfo, int no) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectAllCart(rowBounds, no);
	}

	@Override
	public List<ProductInfo> findAllProductInfo() {
		return mapper.selectAllProductInfo();
	}

	@Override
	@Transactional
	public int saveCart(Cart cart) {
		int result = 0;
		
		if(cart.getNo() != 0) {
			result = mapper.updateCart(cart);
		} else {
			result = mapper.insertCart(cart);
		}
		
		return result;
	}

	@Override
	@Transactional
	public int deleteCart(int no) {
		return mapper.deleteCart(no);
	}

	@Override
	public int getCartCountByINo(int no) {
		return mapper.selectCartCountByINo(no);
	}

	@Override
	public Cart findCartByNo(int no) {
		return mapper.selectCartByNo(no);
	}

	@Override
	@Transactional
	public int saveBuyList(Buy buy) {
		return mapper.insertBuy(buy);
	}

	@Override
	public List<Buy> findAllBuy(PageInfo pageInfo,int no) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return mapper.selectAllBuy(rowBounds, no);
	}

	@Override
	public int getBuyCount(int no) {
		return mapper.selectBuyCount(no);
	}

	@Override
	@Transactional
	public int updateStock(int no, int stock) {
		return mapper.updateProductInfoStock(no, stock);
	}

}
