package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Product;
import com.situ.mall.service.vo.PageBean;
import com.situ.mall.service.vo.ProductSearchCondition;

public interface IProductService {
	public List<Product> findAll();

	/**
	 * 根据条件返回分页PageBean
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public PageBean<Product> getPageBean(int pageIndex, int pageSize);

	/**
	 * 根据条件返回PageBean
	 * @param condition
	 * @return
	 */
	public PageBean<Product> findByCondition(ProductSearchCondition condition);

	/**
	 * 根据id删除
	 * @param id
	 */
	public void deleteById(int id);
}
