package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

	@RequestMapping("")
	public String getDefaultView() {
		System.out.println("Default View");
		return "index";
	}

	@RequestMapping("/home")
	public String getHomeView() {
		System.out.println("Home View");
		return "index";
	}

	@RequestMapping("/login_Page")
	public String getLoginView() {
		System.out.println("Login View");
		return "login";
	}

	@RequestMapping("/admin_login_Page")
	public String getadmin_login_Page() {
		System.out.println("Admin Login View");
		return "admin_login";
	}

	@RequestMapping("/SignUp_Page")
	public String getSignUp_PageView() {
		System.out.println("SignUp_Page View");
		return "SignUp";
	}
	
	@RequestMapping("/forgetPassword")
	public String getNewPassword() {
		System.out.println("Forget Password");
		return"forget_Password";
	}
	
	
	
	@RequestMapping("/ProfileLogin")
	public String getProfile_Page() {
		System.out.println("Profile_Page View");
		return "ProfileLogin";
	}
	
	@ExceptionHandler({Exception.class})
	public String ExceptionHndler() {
		return "error_page";
	}

	
}
