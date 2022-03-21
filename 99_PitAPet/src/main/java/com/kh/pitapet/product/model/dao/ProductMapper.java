package com.kh.pitapet.product.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.pitapet.product.model.vo.Buy;
import com.kh.pitapet.product.model.vo.Cart;
import com.kh.pitapet.product.model.vo.Product;
import com.kh.pitapet.product.model.vo.ProductInfo;


@Mapper
public interface ProductMapper {
	
	List<Integer> selectProductNo();

	Product selectProductByNo(int no);

	int getProductInfoCount(String no);

	List<ProductInfo> selectProductInfoList(RowBounds rowBounds, @Param("no") String no);

//	List<ProductInfo> selectProductInfoList(String no);

	ProductInfo selectProductInfoByNo(int no);

	int updateStatusProductInfo(@Param("no") int no, @Param("status") String status);
	
	List<Product> selectAllProduct();
	
	int insertProductInfo(ProductInfo productInfo);
	
	int updateProductInfo(ProductInfo productInfo);
	
	ProductInfo selectProductInfoByINo(int no);
	
	int insertProduct(Product product);
	
	int updateProduct(Product product);
	
	int getProductCount();
	
	List<Product> findProduct(RowBounds rowBounds);

	int getProductInfoCountByPNo(int no);

	int deleteProduct(int no);

	Product selectProductByPNo(int no);

	int selectCartCount(int no);

	List<Cart> selectAllCart(RowBounds rowBounds, int no);

	List<ProductInfo> selectAllProductInfo();

	int insertCart(Cart cart);

	int updateCart(Cart cart);

	int deleteCart(int no);

	int selectCartCountByINo(int no);

	Cart selectCartByNo(int no);

	int insertBuy(Buy buy);

	List<Buy> selectAllBuy(RowBounds rowBounds, int no);

	int selectBuyCount(int no);

	int updateProductInfoStock(@Param("no") int no, @Param("stock") int stock);

}
