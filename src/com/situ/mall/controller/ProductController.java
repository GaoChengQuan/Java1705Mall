package com.situ.mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;
import com.situ.mall.service.vo.PageBean;
import com.situ.mall.service.vo.ProductSearchCondition;

@Controller
@RequestMapping("/product")
public class ProductController {
	private static final int DEFAULT_PAGE_SIZE = 5;

	@Autowired
	IProductService productService;

	@RequestMapping("/findAllJson")
	@ResponseBody
	public List<Product> findAllJson() {
		return productService.findAll();
	}

	@RequestMapping("/index")
	private String index(Model model) {
		PageBean<Product> pageBean = productService.getPageBean(1,
				DEFAULT_PAGE_SIZE);
		System.out.println(pageBean);
		model.addAttribute("pageBean", pageBean);
		return "products_list";
	}

	@RequestMapping("/findPageBeanByCondition")
	private String findPageBeanByCondition(ProductSearchCondition condition,
			Model model) {
		PageBean<Product> pageBean = productService.findByCondition(condition);
		model.addAttribute("condition", condition);
		model.addAttribute("pageBean", pageBean);
		return "products_list";
	}
	
	@RequestMapping("/deleteById")
	private String deleteById(int id, Model model) {
		productService.deleteById(id);
		//删除后重定向
		return "redirect:/product/index.action";
	}

}
