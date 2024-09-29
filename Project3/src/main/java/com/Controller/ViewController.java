package com.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Entities.Product;
import com.Servicelayer.ServicelayerImpl;

@Controller
public class ViewController {
	
	@Autowired
	private ServicelayerImpl service;
	
	@RequestMapping("")
	public String getDefaultView(Model model) {
		System.out.println("Hello I am Default Handler");
		List<Product> product=service.getProducts();
		model.addAttribute("product",product);
		return "index";
	}
	
	@RequestMapping("/add-product")
	public String getAddForm(Model model){
		System.out.println("Hello I am Add Form Handler");
		model.addAttribute("tittle","Add Product");
		return "AddProduct";
	}
}
