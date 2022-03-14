package com.kh.pitapet.product.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.pitapet.common.util.PageInfo;
import com.kh.pitapet.product.model.dao.ProductMapper;
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
	public int getProductInfoCount() {
		return mapper.getProductInfoCount();
	}
	
	@Override
	public List<Product> getProductInfoList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		System.out.println("offset" + offset);
		System.out.println("limit" + limit);
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findAll(rowBounds);
	}
	
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
	public Product findProductInfoByINo(int no) {
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
		System.out.println("offset" + offset);
		System.out.println("limit" + limit);
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findProduct(rowBounds);
	}

	@Override
	public int getProductInfoCountByPNo(int no) {
		return mapper.getProductInfoCountByPNo(no);
	}

	@Override
	public int deleteProduct(int no) {
		return mapper.deleteProduct(no);
	}

	@Override
	public Product findProductByPNo(int no) {
		return mapper.selectProductByPNo(no);
	}


	
	
	@Override
	public int checkTitle(String title) {
		return mapper.selectCountByTitle(title);
	}

	@Override
	public int findNoByTitle(String title) {
		return mapper.selectNoByTitle(title);
	}

	@Override
	public Product findProductByTitle(String title) {
		return mapper.selectProductByTitle(title);
	}

	@Override
	public Product findOnlyProductByNo(int no) {
		return mapper.selectOnlyProductByNo(no);
	}

}
