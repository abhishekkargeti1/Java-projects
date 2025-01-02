<%@page import="com.helperclasses.Message"%>
<%@page import="com.entities.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
UserDetails details = (UserDetails) session.getAttribute("userDetails");
//System.out.println("User Details are " + details);
if (details == null) {
	//System.out.println("In the if block");
	response.sendRedirect("login_Page");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hotel Hopper</title>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand active display-3 font-weight-bold" href="home">Hotel
			Hopper</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="#about">About</a></li>
				<li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
			</ul>

			<!-- Responsive Search Bar and Logout Button -->
			<form class="form-inline ml-auto" action="abc" method="post">
				<input class="form-control mr-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-primary btn-custom my-2 my-sm-0 mr-2"
					type="submit">Search</button>
			</form>
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="loginDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fa fa-user" aria-hidden="true"></i>
				</a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="loginDropdown">
						<button class="dropdown-item" data-toggle="modal"
							data-target="#modal1">Profile Info</button>
						<button class="dropdown-item" data-toggle="modal"
							data-target="#model2">Edit Profile Info</button>
						<form action="logout" method="get" class="form-inline">
							<button class="btn btn-danger btn-sm btn-block mt-2">Log
								Out</button>
						</form>
					</div></li>
			</ul>
		</div>
	</nav>
	<!-- Nav Ends -->
	
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

	<!-- Modal1   -->
	<div class="modal fade" id="modal1" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header text-center bg-primary text-white">
					<h5 class="modal-title w-100 font-weight-bold"
						id="exampleModalLabel">Account Info</h5>
				</div>
				<!-- Image Section -->
				<div class="text-center p-3">
					<img
						src="<%=request.getContextPath() + "/resources/images/" + details.getUserProfilePic()%>"
						alt="Profile Pic"
						class="rounded-circle img-thumbnail mx-auto d-block"
						style="width: 150px; height: 150px; object-fit: cover;">

				</div>

				<!-- Modal Body -->
				<div class="modal-body">
					<table class="table table-bordered table-hover text-center">
						<thead class="thead-light">
							<tr>
								<th>Field</th>
								<th>Details</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="font-weight-bold">Name</td>
								<td><%=details.getUserName()%></td>
							</tr>
							<tr>
								<td class="font-weight-bold">Email</td>
								<td><%=details.getUserEmail()%></td>
							</tr>
							<tr>
								<td class="font-weight-bold">Address</td>
								<td><%=details.getUserAddress()%></td>
							</tr>
							<tr>
								<td class="font-weight-bold">Contact Number</td>
								<td><%=details.getUserNumber()%></td>
							</tr>
						</tbody>
					</table>
				</div>

				<!-- Modal Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">
						<i class="fa fa-times"></i> Close
					</button>
				</div>
			</div>
		</div>
	</div>




	<!-- Modal2 -->
	<form action="updatedDetails" method="POST" id="form"
		enctype="multipart/form-data" onsubmit="return validateForm(event)">

		<div class="modal fade" id="model2" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">Update
							Your Details</h5>
					</div>
					<div class="modal-body">
						<table class="table table-bordered table-hover text-center">
							<thead class="thead-light">
								<tr>
									<th>Field</th>
									<th>Details</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="font-weight-bold">Name</td>
									<td><input type="text" class="form-control"
										name="userName" value="<%=details.getUserName()%>"></td>
								</tr>
								<tr>
									<td class="font-weight-bold">Email</td>
									<td><input type="text" class="form-control"
										value="<%=details.getUserEmail()%>" id="userEmail" readonly></td>
								</tr>
								<tr>
									<td class="font-weight-bold">Address</td>
									<td><input type="text" class="form-control" name="userAddress"
										value="<%=details.getUserAddress()%>"></td>
								</tr>
								<tr>
									<td class="font-weight-bold">Contact Number</td>
									<td><input type="text" class="form-control" name="userNumber"
										value="<%=details.getUserNumber()%>"></td>
								</tr>
								<tr>
									<td class="font-weight-bold">Profile Picture</td>
									<td><input type="file" class="form-control" name="userProfilePic"></td>
								</tr>
								<tr>
									<td class="font-weight-bold">Change Password</td>
									<td>
										<div class="input-group">
											<input type="password" class="form-control" id="password"
												name="userPassword" value="<%=details.getUserPassword()%>" placeholder="Enter your password">
											<div class="input-group-append">
												<span class="input-group-text"> <i
													class="fa fa-eye-slash" id="togglePassword"
													style="cursor: pointer;"></i>
												</span>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#passwordModal" id=save_btn>Save</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Password Modal  -->


		<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">Enter Your
							OTP</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
						<div class="modal-body">
							<input type="text" class="form-control" id="otp" name="otp"
								placeholder="Enter your OTP" >
							<small class="form-text text-danger" id="otpBoxError"></small>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
				</div>
			</div>
		</div>

	</form>





	<!-- Optional JavaScript -->
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
</body>

<script>
	const togglePassword = document.querySelector('#togglePassword');
	const passwordField = document.querySelector('#password');

	togglePassword.addEventListener('click', function() {
		const type = passwordField.getAttribute('type') === 'password' ? 'text'
				: 'password';
		passwordField.setAttribute('type', type);
		this.classList.toggle('fa-eye');
		this.classList.toggle('fa-eye-slash');
	});


const btnClicked = document.getElementById("save_btn");
btnClicked.addEventListener("click", () => {
	const userEmail = document.getElementById("userEmail").value;
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
});

function validateForm(){
	 let isValid = false;
	const otpBox = document.getElementById("otp").value.trim();
	if (otpBox === "") { 
         document.getElementById("otpBoxError").innerText = "Please Enter OTP";
         return isValid ;
     }
	isValid =true;
	return isValid;
	
}

</script>


</html>
