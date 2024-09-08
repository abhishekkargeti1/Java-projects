package com.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class ViewController {

	@RequestMapping("")
	public String getDefaultView() {
		System.out.println("Hello I am Default Controller");
		return "index";
	}

	@RequestMapping("/home")
	public String getHome() {
		System.out.println("Hello I am Home Handler");
		return "home";
	}

	@RequestMapping("/search")
	public RedirectView getSearch(@RequestParam("queryBox") String query) {
		RedirectView redirectView = new RedirectView();
		if (!query.isBlank()) {
			String url = "https://www.google.com/search?q=" + query;
			redirectView.setUrl(url);
		} else {
			redirectView.setUrl("home");
		}
		return redirectView;
	}
}
