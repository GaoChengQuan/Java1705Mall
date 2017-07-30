package com.situ.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.mapper.ProductMapper;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.ProductExample;
import com.situ.mall.pojo.ProductExample.Criteria;
import com.situ.mall.service.IProductService;
import com.situ.mall.service.vo.PageBean;
import com.situ.mall.service.vo.ProductSearchCondition;

@Service
public class ProductServiceImpl implements IProductService{

	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public List<Product> findAll() {
		return productMapper.selectByExample(new ProductExample());
	}

	@Override
	public PageBean getPageBean(int pageIndex, int pageSize) {
		PageBean pageBean = new PageBean();
		// 1、当前页private Integer pageIndex;
		pageBean.setPageIndex(pageIndex);
		// 2、当前页显示的条数private Integer pageSize;
		pageBean.setPageSize(pageSize);
		// 3、总条数private Integer totalCount;
		int totalCount = productMapper.countByExample(null);
		pageBean.setTotalCount(totalCount);
		// 4、总页数private Integer totalPage;
		/*
		 * 总条数      当前页显示的条数        总页数   
		 * 10		3		      4
		 * 11		3			  4
		 * 12       3			  4
		 * 13       3			  5
		 */
		int totalPage = (int) Math.ceil((double)totalCount / pageSize);
		pageBean.setTotalPage(totalPage);
		// 5、当前页要显示的数据private List<Student> list = new ArrayList<Student>();
		int index = (pageIndex - 1) * pageSize;
		List<Product> list = productMapper.findPageBeanList(index, pageSize);
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public PageBean<Product> findByCondition(ProductSearchCondition condition) {
		PageBean pageBean = new PageBean();
		int pageIndex = condition.getPageIndex();
		int pageSize = condition.getPageSize();
		// 1、当前页private Integer pageIndex;
		pageBean.setPageIndex(pageIndex);
		// 2、当前页显示的条数private Integer pageSize;
		pageBean.setPageSize(pageSize);
		// 3、总条数private Integer totalCount;
		ProductExample productExample = new ProductExample();
		Criteria createCriteria = productExample.createCriteria();
		createCriteria.andNameLike("%" + condition.getName() + "%");
		int totalCount = productMapper.countByExample(productExample);
		pageBean.setTotalCount(totalCount);
		// 4、总页数private Integer totalPage;
		int totalPage = (int) Math.ceil((double)totalCount / pageSize);
		pageBean.setTotalPage(totalPage);
		// 5、当前页要显示的数据private List<Student> list = new ArrayList<Student>();
		int index = (pageIndex - 1) * pageSize;
		
		List<Product> list = productMapper.findPageBeanListByCondition(index,
				pageSize, condition.getName());
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public void deleteById(int id) {
		productMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void add(Product product) {
		productMapper.insert(product);
	}

}
