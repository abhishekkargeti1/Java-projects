<!doctype html>
<%@page import="com.helperclasses.Message"%>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOMlD0dvn79zfrA7LKbBq5O4fbZmL3DmRXaMy7xM"
	crossorigin="anonymous">
<title>User Login</title>
<style>
body {
	height: 100vh;
	background-color: #e9ecef;
}

.login-card {
	background: white;
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
	padding: 40px;
	width: 100%;
	max-width: 400px;
	margin-top: 30px;
}

.login-card h3 {
	margin-bottom: 30px;
}

.login-card .footer-link {
	margin-top: 20px;
}

.social-buttons a {
	margin: 0 10px;
}

input-group {
	position: relative;
}

.input-group-append {
	position: absolute;
	top: 50%;
	right: 10px; /* Adjust this for the position of the icon */
	transform: translateY(-50%);
	cursor: pointer;
	z-index: 1;
}

.form-control {
	padding-right: 40px; /* Add space for the icon */
}
</style>
</head>

<body>
	<%@include file="navbar.jsp"%>

	<div
		class="container d-flex align-items-center justify-content-center vh-100">
		<div class="login-card">
			<h3 class="text-center">Enter Your Email Address</h3>
			<%
			Message message = (Message) session.getAttribute("message");
			if (message != null) {
			%>
			<div class="alert <%=message.getCssClass()%>" role="alert">
				<%=message.getContent()%>
			</div>
			<%
			 session.removeAttribute("message");
			}
			%>
			<form action="newPassword" method="POST"
				onsubmit="return validateForm(event)">
				<div class="form-group">
					<label for="username">Username<span style="color: red;">*</span></label>
					<input type="text" class="form-control" id="userEmail"
						name="userEmail" placeholder="Enter your username"> <small
						class="form-text text-danger" id="userEmailError"></small>
				</div>
				<div class="form-group">
					<label for="New Password">New Password<span
						style="color: red;">*</span></label>
					<div class="input-group">
						<input type="password" class="form-control" id="newPassword"
							name="newPassword" placeholder="Enter your password">
						<div class="input-group-append">
							<i class="fa fa-eye-slash" id="togglePassword"></i>
						</div>
					</div>
					<small class="form-text text-danger" id="newPasswordError"></small>
				</div>
				<div class="form-group">
					<label for="OTP">Enter Your OTP <span style="color: red;">*</span></label>
					<input type="text" class="form-control" id="OTP" name="OTP"
						placeholder="Enter your OTP"><small
						class="form-text text-danger" id="OtpError"></small>
				</div>
				<div class="text-center footer-link">
					<button type="submit" class="btn btn-primary me-5">Submit</button>
					<button type="button" class="btn btn-success" id="otp_btn">Send
						OTP</button>
				</div>
			</form>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<script>
		function validateForm(event) {
			let isValid = true;

			const username = document.getElementById('userEmail').value.trim();
			const password = document.getElementById('newPassword').value.trim();
			const otpBox  = document.getElementById('OTP').value.trim();

			if (!/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(username) || "") {
				document.getElementById("userEmailError").innerText = "Enter a valid email address.";
				isValid = false;
			}

			if (password === "") {
				document.getElementById("newPasswordError").innerText = "Password cannot be empty.";
				isValid = false;
			}
			
			if (otpBox === "") {
				document.getElementById("OtpError").innerText = "Please Enter OTP.";
				isValid = false;
			}

			return isValid;
		}
		
		
		// Toggle password visibility
		const togglePassword = document.getElementById("togglePassword");
		const passwordField = document.getElementById("newPassword");

		togglePassword.addEventListener("click", function() {
		    // Check if the password is currently visible
		    const type = passwordField.type === "password" ? "text" : "password";
		    passwordField.type = type;

		    // Toggle the eye icon
		    this.classList.toggle("fa-eye");
		    this.classList.toggle("fa-eye-slash");
		});

		const btnValue = document.getElementById("otp_btn");
		btnValue.addEventListener("click", () => {
			const userEmail = document.getElementById("userEmail").value;
			const password = document.getElementById('newPassword').value.trim();
			if (userEmail === "" || password === "" ) {
		        document.getElementById("userEmailError").innerText = "Email field cannot be empty.";
		        document.getElementById("newPasswordError").innerText = "Password field cannot be empty.";
		    } else if (!/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(userEmail)) {
		        document.getElementById("userEmailError").innerText = "Enter a valid email address.";
		    }else{
		    	
		    var url = "<%=request.getContextPath()%>/OtpGenerator"; 
		    url += "?userEmail=" + encodeURIComponent(userEmail);
		    	  const xhr = new XMLHttpRequest();
				    xhr.open("GET", url);
				    xhr.onreadystatechange = function () {
				        if (xhr.readyState === 4) { 
				            if (xhr.status === 200) { 
				                const response = xhr.responseText; 
				                console.log(response); 
				                if (response.trim() === "Done") { 
				                    alert("OTP Sent Successfully On Email ");
				                } else {
				                    alert("OTP Not Sent Successfully On Email");
				                }
				            } else {
				                console.error("Error: " + xhr.statusText);
				            }
				        }
				    };
				    xhr.send();   
		}
		});
		
	</script>
</body>

</html>
