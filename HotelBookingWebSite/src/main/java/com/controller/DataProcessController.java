package com.controller;

import java.io.File;
import java.util.concurrent.CompletableFuture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
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
@EnableAsync
public class DataProcessController {
	@Autowired
	private UserDetails userDetails;
	@Autowired
	private ServiceLayerImpl service;
	private String otpValue;

	/* Admin Login Controller */
	
	@RequestMapping(path = "/adminlogin", method = RequestMethod.POST)
	public String getAdminDashBoard(@RequestParam("username") String userName,
			@RequestParam("password") String password, HttpSession session) {
		//System.out.println("Admin Login");
 		 boolean isLogedIn = false;
		if (userName.equals("admin") && password.equals("admin")) {
			//System.out.println("Inside If");
			isLogedIn = true;
			session.setAttribute("Admin", isLogedIn);
			return "redirect:/adminlogin ";
		} else {
			Message message = new Message("Invalid Email and Password", "Error", "alert-danger");
			session.setAttribute("message", message);
			return "redirect:/admin_login_Page";
		}
	}

	/* SignUp Controller */
	
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
				// Thread.sleep(7000);
				String path = session.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "resources"
						+ File.separator + "images" + File.separator + file.getOriginalFilename();
				FileUpload upload = new FileUpload(file);
				if (upload.saveFile(path)) {
					CompletableFuture.runAsync(()-> MailerService.mailSender("Congulation Your login Id is " + userEmail + " And Password is d4ng3r",
							"Your Login Id and Password", userEmail, "customerservices1808@gmail.com"));
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

	/* User Login Controller */
	
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

	/* Forget Password Controller */
	
	@RequestMapping("/newPassword")
	public String getNewPassword(@RequestParam("userEmail") String email, @RequestParam("newPassword") String Password,
			@RequestParam("OTP") String OTP, HttpSession session) {

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

	/* LogOut Controller */
	
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
	
	
	/* Admin LogOut Controller */
	
	@RequestMapping("/Adminlogout")
	public String getAdminLogout(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Admin LogOut View");
		HttpSession session = request.getSession();
		if (session != null) {
			session.removeAttribute("Admin");
			Message message = new Message("LogOut Successfully", "Success", "alert-success");
			session.setAttribute("message", message);
			return "redirect:/admin_login_Page";
		}
		return "error_page";

	}

	/* Otp Generator Controller */
	
	@RequestMapping(value = "/OtpGenerator", method = RequestMethod.GET)
	@ResponseBody
	public String getOtp(@RequestParam("userEmail") String email) {
		System.out.println("Hello World opt");
		otpValue = OtpGenrator.Genrator();
		String message = "Your OTP is " + otpValue;
		  CompletableFuture.runAsync(() -> MailerService.mailSender(message, "Verification Code", email, "customerservices1808@gmail.com"));
		//MailerService.mailSender(message, "Verification Code", email, "customerservices1808@gmail.com");
		return "Done";
	}

	/* Edit Controller */
	
	@RequestMapping(path = "/updatedDetails", method = RequestMethod.POST)
	public String getUpdatedDetails(@RequestParam("userName") String userName,
			@RequestParam("userAddress") String userAddress, @RequestParam("userNumber") String userNumber,
			@RequestParam("userPassword") String userPassword, @RequestParam("userProfilePic") MultipartFile file,
			@RequestParam("otp") String OTP, @RequestParam("userEmail") String email, HttpSession session) {
		if (OTP.equals(otpValue)) {
			if (file.getOriginalFilename() != "") {
				System.out.println("Hello File");
				userDetails.setUserName(userName);
				userDetails.setUserAddress(userAddress);
				userDetails.setUserNumber(userNumber);
				userDetails.setUserPassword(userPassword);
				userDetails.setUserProfilePic(file.getOriginalFilename());
				userDetails.setUserEmail(email);
				if (service.updateDetails(userDetails)) {
					try {
						String path = session.getServletContext().getRealPath("/") + "WEB-INF" + File.separator
								+ "resources" + File.separator + "images" + File.separator + file.getOriginalFilename();
						FileUpload upload = new FileUpload(file);
						if (upload.saveFile(path)) {
							Message message = new Message("Profile Details Updated Successfully", "Success",
									"alert-success");
							session.setAttribute("message", message);
							return "redirect:/ProfileLogin";
						} else {
							System.out.println("Error in Saving File");
							Message message = new Message("Profile Pic Not Updated ", "Error", "alert-danger");
							session.setAttribute("message", message);
							return "redirect:/ProfileLogin";
						}
					} catch (Exception e) {
						System.out.println("Error in Saving File Catch");
						e.printStackTrace();
						Message message = new Message("Profile Details Not Updated ", "Error", "alert-danger");
						session.setAttribute("message", message);
						return "redirect:/ProfileLogin";

					}

				} else {
					System.out.println("Error in Dao");
					Message message = new Message("Profile Details Not Updated ", "Error", "alert-danger");
					session.setAttribute("message", message);
					return "redirect:/ProfileLogin";
				}
			} else {
				userDetails.setUserName(userName);
				userDetails.setUserAddress(userAddress);
				userDetails.setUserNumber(userNumber);
				userDetails.setUserPassword(userPassword);
				userDetails.setUserEmail(email);
				if (service.updateDetails1(userDetails)) {
					Message message = new Message("Profile Details Updated Successfully", "Success", "alert-success");
					session.setAttribute("message", message);
					return "redirect:/ProfileLogin";
				} else {
					System.out.println("Error in Dao without Picture");
					Message message = new Message("Profile Details Not Updated ", "Error", "alert-danger");
					session.setAttribute("message", message);
					return "redirect:/ProfileLogin";
				}
			}
		} else {
			Message message = new Message("Please Enter Correct OTP ", "Error", "alert-danger");
			session.setAttribute("message", message);
			return "redirect:/ProfileLogin";
		}
	}

	
	
	@ExceptionHandler({ Exception.class })
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();
		return "error_page";
	}

}
