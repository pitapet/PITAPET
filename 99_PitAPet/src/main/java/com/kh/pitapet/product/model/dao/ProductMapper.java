package com.kh.pitapet.product.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.pitapet.product.model.vo.Product;
import com.kh.pitapet.product.model.vo.ProductInfo;

@Mapper
public interface ProductMapper {
	
	List<Integer> selectProductNo();

	Product selectProductByNo(int no);

	int getProductInfoCount();
	
	List<Product> findAll(RowBounds rowBounds);
	
	ProductInfo selectProductInfoByNo(int no);

	int updateStatusProductInfo(@Param("no") int no, @Param("status") String status);
	
	List<Product> selectAllProduct();
	
	int insertProductInfo(ProductInfo productInfo);
	
	int updateProductInfo(ProductInfo productInfo);
	
	Product selectProductInfoByINo(int no);
	
	int insertProduct(Product product);
	
	int updateProduct(Product product);
	
	int getProductCount();
	
	List<Product> findProduct(RowBounds rowBounds);

	int getProductInfoCountByPNo(int no);

	int deleteProduct(int no);

	Product selectProductByPNo(int no);
	
	
	
	
	int selectCountByTitle(String title);

	int selectNoByTitle(String title);

	Product selectProductByTitle(String title);

	Product selectProductByNo(List<Integer> resultList);

	Product selectOnlyProductByNo(int no);

}
