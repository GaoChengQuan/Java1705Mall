package com.situ.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.mapper.ProductMapper;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.ProductExample;
import com.situ.mall.service.IProductService;

@Service
public class ProductServiceImpl implements IProductService{

	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public List<Product> findAll() {
		return productMapper.selectByExample(new ProductExample());
	}

}
