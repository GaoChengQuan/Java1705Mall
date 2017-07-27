package com.situ.mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	IProductService productService;
	
	@RequestMapping("/listJson")
	@ResponseBody
	public List<Product> listJson() {
		return productService.findAll();
	}
	
	@RequestMapping("/findAll")
	public String findAll(Model model) {
		List<Product> list = productService.findAll();
		model.addAttribute("list", list);
		return "Product_List";
	}
}
