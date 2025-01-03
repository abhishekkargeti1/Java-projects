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
import com.helperclasses.OtpGenrator;
import com.helperclasses.Validation;
import com.services.ServiceLayerImpl;

@Controller
public class DataProcessController {
	@Autowired
	private UserDetails userDetails;
	@Autowired
	private ServiceLayerImpl service;
	private String otpValue;

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
		if (Validation.emailValidation(userEmail) == true) {
			// System.out.println("In Side If ");
			return "Email Already Exist  Please Go to Login Page ";
		} else if (service.insertData(userDetails)) {
			try {
				Thread.sleep(7000);
				String path = session.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "resources"
						+ File.separator + "images" + File.separator + file.getOriginalFilename();
				FileUpload upload = new FileUpload(file);
				if (upload.saveFile(path)) {
					MailerService.mailSender("Congulation Your login Id is " + userEmail + " And Password is d4ng3r",
							"Your Login Id and Password", userEmail, "customerservices1808@gmail.com");
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

	@RequestMapping(path = "/loginForm", method = RequestMethod.POST)
	public String getLoginData(@RequestParam("userName") String userName,
			@RequestParam("userPassword") String userPassword, HttpSession session) {

		userDetails = service.getUserDetails(userName, userPassword);
		// System.out.println("User Profile Details "+userDetails);
		if (userDetails == null) {
			Message message = new Message("Invalid Email and Password", "Error", "alert-danger");
			session.setAttribute("message", message);
			return "redirect:/login_Page";
		} else {
			session.setAttribute("userDetails", userDetails);
			return "redirect:/ProfileLogin";
		}
	}

	@RequestMapping("/newPassword")
	public String getNewPassword(@RequestParam("userEmail") String email, @RequestParam("newPassword") String Password,
			@RequestParam("OTP") String OTP,HttpSession session) {

		if (OTP.equals(otpValue)) {
			userDetails.setUserEmail(email);
			userDetails.setUserPassword(Password);
			userDetails.setUserPassword(Password);
			if (service.updatePassword(email, Password)) {
				Message message = new Message("Password Updated Successfully", "Success", "alert-success");
				session.setAttribute("message", message);
				return "redirect:/login_Page";
			} else {
				Message message = new Message("Password Not Updated", "Error", "alert-danger");
				session.setAttribute("message", message);
				return "redirect:/forgetPassword";
			}
		}
		Message message = new Message("Invalid OTP", "Error", "alert-danger");
		session.setAttribute("message", message);
		return "redirect:/forgetPassword";
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

	@RequestMapping(value = "/OtpGenerator", method = RequestMethod.GET)
	@ResponseBody
	public String getOtp(@RequestParam("userEmail") String email) {
		System.out.println("Hello World opt");
		otpValue = OtpGenrator.Genrator();
		String message = "Your OTP is " + otpValue;
		MailerService.mailSender(message, "Verification Code", email, "customerservices1808@gmail.com");
		return "Done";
	}

	@RequestMapping(path = "/updatedDetails", method = RequestMethod.POST)
	public String getUpdatedDetails(@RequestParam("userName") String userName,
			@RequestParam("userAddress") String userAddress, @RequestParam("userNumber") String userNumber,
			@RequestParam("userPassword") String userPassword, @RequestParam("userProfilePic") MultipartFile file,
			@RequestParam("otp") String OTP, HttpSession session) {
		if (OTP.equals(otpValue)) {
			userDetails.setUserName(userName);
			userDetails.setUserAddress(userAddress);
			userDetails.setUserNumber(userNumber);
			userDetails.setUserPassword(userPassword);
			userDetails.setUserProfilePic(file.getOriginalFilename());
			System.out.println("Hello World " + userDetails);
			Message message = new Message("Profile Details Updated Successfully", "Success", "alert-success");
			session.setAttribute("message", message);
			return "redirect:/ProfileLogin";
		} else {
			Message message = new Message("Profile Details Not Updated Successfully", "Error", "alert-danger");
			session.setAttribute("message", message);
			return "redirect:/ProfileLogin";
		}
	}

	@ExceptionHandler({ Exception.class })
	public String ExceptionHndler() {
		return "error_page";
	}

}
