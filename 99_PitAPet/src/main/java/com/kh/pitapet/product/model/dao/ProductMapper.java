package com.kh.pitapet.product.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.pitapet.product.model.vo.Product;

@Mapper
public interface ProductMapper {
	
	Product selectProductByNo(int no);

	List<Integer> selectProductNo();


}
