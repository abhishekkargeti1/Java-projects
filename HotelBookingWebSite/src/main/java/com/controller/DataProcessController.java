package com.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.entities.UserDetails;
import com.helperclasses.FileUpload;
import com.helperclasses.Message;
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
		if (service.insertData(userDetails)) {
			try {
				Thread.sleep(7000);
				String path = session.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "resources"
						+ File.separator + "images" + File.separator + file.getOriginalFilename();
				FileUpload upload = new FileUpload(file);
				upload.saveFile(path);
				return "Done";
			} catch (Exception e) {
				e.printStackTrace();
				return "Error Saving File in Db";
			}

		} else {
			return "Database insert Failed";
		}
	}

}
