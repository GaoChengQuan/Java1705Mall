package com.situ.mall.mapper;

import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.ProductExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductMapper {
	int countByExample(ProductExample example);

	int deleteByExample(ProductExample example);

	int deleteByPrimaryKey(Integer id);

	int insert(Product record);

	int insertSelective(Product record);

	List<Product> selectByExample(ProductExample example);

	Product selectByPrimaryKey(Integer id);

	int updateByExampleSelective(@Param("record") Product record,
			@Param("example") ProductExample example);

	int updateByExample(@Param("record") Product record,
			@Param("example") ProductExample example);

	int updateByPrimaryKeySelective(Product record);

	int updateByPrimaryKey(Product record);

	/**
	 * 分页查找
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public List<Product> findPageBeanList(@Param("pageIndex") int pageIndex,
			@Param("pageSize") int pageSize);

	/**
	 * 分页查找根据条件
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public List<Product> findPageBeanListByCondition(
			@Param("pageIndex") int pageIndex, 
			@Param("pageSize") int pageSize,
			@Param("name") String name);
}