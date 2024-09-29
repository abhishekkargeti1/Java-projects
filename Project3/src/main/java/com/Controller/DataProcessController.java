package com.Controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import com.Entities.Product;
import com.Servicelayer.ServicelayerImpl;



@Controller
public class DataProcessController {
	@Autowired
	private ServicelayerImpl service;
	
	
	@RequestMapping(path = "/add-product" ,method = RequestMethod.POST)
	public RedirectView handleProduct(@ModelAttribute Product product, HttpServletRequest request) {
		System.out.println(product);
		service.insertProduct(product);
		RedirectView redirect=new RedirectView();
		redirect.setUrl(request.getContextPath()+"/");
		return redirect;
	}
	
	@RequestMapping("/deleteProduct/{productid}")
	public RedirectView deleteProduct( @PathVariable("productid") int productId,HttpServletRequest request) {
		service.deleteProduct(productId);
		RedirectView redirect=new RedirectView();
		redirect.setUrl(request.getContextPath()+"/");
		return redirect;
	}
	@RequestMapping("/editProduct/{productid}")
	public String editProduct(@PathVariable("productid") int productId,HttpServletRequest request,Model model) {
		
		Product productDetails = service.getProduct(productId);
		System.out.println(productDetails);
		 model.addAttribute("Details",productDetails);
		return "UpdateDetails";
	}
	

}
