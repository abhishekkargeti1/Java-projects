package com.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.entities.UserDetails;
import com.helperclasses.FileUpload;
import com.helperclasses.MailerService;
import com.helperclasses.Message;
import com.helperclasses.Validation;
import com.services.ServiceLayerImpl;

@Controller
public class DataProcessController {
	@Autowired
	private UserDetails userDetails;
	@Autowired
	private ServiceLayerImpl service;

	@RequestMapping(path = "/adminlogin", method = RequestMethod.POST)
	public String getAdminDashBoard(@RequestParam("username") String userName,
			@RequestParam("password") String password, HttpSession session) {
		System.out.println("Admin Login");
		if (userName.equals("admin") && password.equals("admin")) {
			System.out.println("Inside If");
			return "admin_Profile";
		} else {
			Message message = new Message("Invalid Email and Password", "Error", "alert-danger");
			session.setAttribute("message", message);
			return "redirect:/admin_login_Page";
		}
	}

	@RequestMapping(path = "/registerForm", method = RequestMethod.POST)
	@ResponseBody
	public String getFormData(@RequestParam("userName") String userName, @RequestParam("userEmail") String userEmail,
			@RequestParam("userNumber") String userNumber, @RequestParam("userAddress") String userAddress,
			@RequestParam("userProfilePic") MultipartFile file, @RequestParam("userDOB") String dateString,
			HttpSession session) {

		userDetails.setUserName(userName);
		userDetails.setUserEmail(userEmail);
		userDetails.setUserNumber(userNumber);
		userDetails.setUserAddress(userAddress);
		userDetails.setUserProfilePic(file.getOriginalFilename());
		userDetails.setUserDOB(dateString);

		// System.out.println("Details " + userDetails);
		if(Validation.emailValidation(userEmail)== true) {
			//System.out.println("In Side If ");
			return "Email Already Exist  Please Go to Login Page ";
		}else if (service.insertData(userDetails)) {
			try {
				Thread.sleep(7000);
				String path = session.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "resources"
						+ File.separator + "images" + File.separator + file.getOriginalFilename();
				FileUpload upload = new FileUpload(file);
				if(upload.saveFile(path)) {
					MailerService.mailSender("Congulation Your login Id is "+userEmail+" And Password is d4ng3r", "Your Login Id and Password", userEmail, "customerservices1808@gmail.com");
					return "Done";
				}
				return "Image is not Uploaded Successfully";
			} catch (Exception e) {
				e.printStackTrace();
				return "Error Saving File in Db";
			}
			
		} else {
			return "Database insert Failed";
		}
	}
	
	@RequestMapping(path = "/loginForm",method = RequestMethod.POST)
	public String getLoginData(@RequestParam("userName")String userName,
			@RequestParam("userPassword")String userPassword,HttpSession session) {
		
		userDetails = service.getUserDetails(userName, userPassword);
		//System.out.println("User Profile Details "+userDetails);		
		if(userDetails == null) {
			Message message = new Message("Invalid Email and Password", "Error", "alert-danger");
			session.setAttribute("message", message);
			return "redirect:/login_Page";
		}else {
			session.setAttribute("userDetails", userDetails);
			return "redirect:/ProfileLogin";
		}
	}
	
	@RequestMapping("/logout")
	public String getLogout(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("LogOut View");
		HttpSession session = request.getSession();
		if (session != null) {
			session.removeAttribute("userDetails");
			Message message = new Message("LogOut Successfully", "Success", "alert-success");
			session.setAttribute("message", message);
			return "redirect:/login_Page";
		}
		return "error_page";
		
	}
	@ExceptionHandler({Exception.class})
	public String ExceptionHndler() {
		return "error_page";
	}

}
