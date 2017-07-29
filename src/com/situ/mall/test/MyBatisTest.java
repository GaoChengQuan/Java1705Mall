package com.situ.mall.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.situ.mall.mapper.ProductMapper;
import com.situ.mall.pojo.ProductExample;
import com.situ.mall.pojo.ProductExample.Criteria;

//帮助我们创建IOC容器
@RunWith(SpringJUnit4ClassRunner.class)
//指定IOC容器使用的配置文件 
@ContextConfiguration("classpath:applicationContext.xml")
public class MyBatisTest {

	@Autowired
	private ProductMapper productMapper;
	
	@Test
	public void test1() {
		ProductExample productExample = new ProductExample();
		Criteria createCriteria = productExample.createCriteria();
		createCriteria.andNameLike("%Apple%");
		int totalCount = productMapper.countByExample(productExample);
		System.out.println("---------------" + totalCount);
	}
}
