package com.situ.mall.service.vo;

public class ProductSearchCondition {
	// 当前页
	private Integer pageIndex;
	// 当前页一共有多少数据  默认是5
	private Integer pageSize = 5;
	private String name;

	public ProductSearchCondition() {
		super();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	@Override
	public String toString() {
		return "ProductSearchCondition [pageIndex=" + pageIndex + ", pageSize="
				+ pageSize + ", name=" + name + "]";
	}

}
