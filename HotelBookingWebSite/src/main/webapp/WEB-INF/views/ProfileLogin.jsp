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

<style>
/* Google Fonts */
@import url('https://fonts.googleapis.com/css?family=Anonymous+Pro');

/* Cursor */
.cursor {
	position: relative;
	width: 24em;
	margin: 0 auto;
	border-right: 2px solid rgba(255, 255, 255, 0.75);
	font-size: 3pc;
	text-align: center;
	font-family: fantasy; /* Corrected font-family */
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	transform: translateY(-50%);
}

/* Animation */
.typewriter-animation {
	animation: typewriter 10s steps(500) infinite normal both,
		blinkingCursor 1000ms steps(500) infinite normal;
}

@
keyframes typewriter { 0% {
	width: 0;
}

50
%
{
width
:
100%;
}
100
%
{
width
:
0;
}
}

/* Title CSS */
.glass-effect {
	background: linear-gradient(to right, rgba(85, 172, 238, 0.7),
		rgba(0, 210, 255, 0.7)); /* Blue gradient */
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	font-size: 2rem; /* Adjust as needed */
	font-weight: bold;
	position: relative;
}

.glass-effect::before {
	content: '';
	position: absolute;
	top: -5px;
	left: -5px;
	right: -5px;
	bottom: -5px;
	background: rgba(255, 255, 255, 0.15); /* Light overlay */
	border-radius: 10px;
	backdrop-filter: blur(10px); /* Frosted glass effect */
	z-index: -1;
	/* box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); */
}

/* Loader Css Start */
*, *:before, *:after {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

.wrapper {
	position: absolute;
	left: 50%;
	top: 50%;
	margin: -100px;
	width: 200px;
	height: 200px;
	background-color: transparent;
	border: none;
}

.wrapper .box-wrap {
	width: 70%;
	height: 70%;
	margin: calc(( 100% - 70%)/2) calc(( 100% - 70%)/2);
	position: relative;
	transform: rotate(-45deg);
}

.wrapper .box-wrap .box {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	background: rgba(135, 0, 0, 0.6);
	background: linear-gradient(to right, #141562, #486fbc, #eab5a1, #8dd6ff, #4973c9,
		#d07ca7, #f4915e, #f5919e, #b46f89, #141562, #486fbc);
	background-position: 0% 50%;
	background-size: 1000% 1000%;
	visibility: hidden;
}

.wrapper .box-wrap .box.one {
	animation: moveGradient 15s infinite, oneMove 3.5s infinite;
}

.wrapper .box-wrap .box.two {
	animation: moveGradient 15s infinite, twoMove 3.5s 0.15s infinite;
}

.wrapper .box-wrap .box.three {
	animation: moveGradient 15s infinite, threeMove 3.5s 0.3s infinite;
}

.wrapper .box-wrap .box.four {
	animation: moveGradient 15s infinite, fourMove 3.5s 0.575s infinite;
}

.wrapper .box-wrap .box.five {
	animation: moveGradient 15s infinite, fiveMove 3.5s 0.725s infinite;
}

.wrapper .box-wrap .box.six {
	animation: moveGradient 15s infinite, sixMove 3.5s 0.875s infinite;
}

@
keyframes moveGradient {to { background-position:100%50%;
	
}

}
@
keyframes oneMove { 0% {
	visibility: visible;
	clip-path: inset(0% 35% 70% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

14
.2857 % {
	clip-path: inset(0% 35% 70% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

28
.5714 % {
	clip-path: inset(35% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

42
.8571 % {
	clip-path: inset(35% 70% 35% 0 round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

57
.1428 % {
	clip-path: inset(35% 70% 35% 0 round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

71
.4285 % {
	clip-path: inset(0% 70% 70% 0 round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

85
.7142 % {
	clip-path: inset(0% 70% 70% 0 round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

100
%
{
clip-path
:
inset(
0%
35%
70%
round
5%
);
animation-timing-function
:
cubic-bezier(
0.86
,
0
,
0.07
,
1
);
}
}
@
keyframes twoMove { 0% {
	visibility: visible;
	clip-path: inset(0% 70% 70% 0 round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

14
.2857 % {
	clip-path: inset(0% 70% 70% 0 round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

28
.5714 % {
	clip-path: inset(0% 35% 70% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

42
.8571 % {
	clip-path: inset(0% 35% 70% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

57
.1428 % {
	clip-path: inset(35% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

71
.4285 % {
	clip-path: inset(35% 70% 35% 0 round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

85
.7142 % {
	clip-path: inset(35% 70% 35% 0 round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

100
%
{
clip-path
:
inset(
0%
70%
70%
0
round
5%
);
animation-timing-function
:
cubic-bezier(
0.86
,
0
,
0.07
,
1
);
}
}
@
keyframes threeMove { 0% {
	visibility: visible;
	clip-path: inset(35% 70% 35% 0 round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

14
.2857 % {
	clip-path: inset(35% 70% 35% 0 round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

28
.5714 % {
	clip-path: inset(0% 70% 70% 0 round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

42
.8571 % {
	clip-path: inset(0% 70% 70% 0 round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

57
.1428 % {
	clip-path: inset(0% 35% 70% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

71
.4285 % {
	clip-path: inset(0% 35% 70% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

85
.7142 % {
	clip-path: inset(35% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

100
%
{
clip-path
:
inset(
35%
70%
35%
0
round
5%
);
animation-timing-function
:
cubic-bezier(
0.86
,
0
,
0.07
,
1
);
}
}
@
keyframes fourMove { 0% {
	visibility: visible;
	clip-path: inset(35% 0% 35% 70% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

14
.2857 % {
	clip-path: inset(35% 0% 35% 70% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

28
.5714 % {
	clip-path: inset(35% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

42
.8571 % {
	clip-path: inset(70% 35% 0% 35% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

57
.1428 % {
	clip-path: inset(70% 35% 0% 35% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

71
.4285 % {
	clip-path: inset(70% 0 0 70% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

85
.7142 % {
	clip-path: inset(70% 0 0 70% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

100
%
{
clip-path
:
inset(
35%
0%
35%
70%
round
5%
);
animation-timing-function
:
cubic-bezier(
0.86
,
0
,
0.07
,
1
);
}
}
@
keyframes fiveMove { 0% {
	visibility: visible;
	clip-path: inset(70% 0 0 70% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

14
.2857 % {
	clip-path: inset(70% 0 0 70% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

28
.5714 % {
	clip-path: inset(35% 0% 35% 70% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

42
.8571 % {
	clip-path: inset(35% 0% 35% 70% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

57
.1428 % {
	clip-path: inset(35% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

71
.4285 % {
	clip-path: inset(70% 35% 0% 35% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

85
.7142 % {
	clip-path: inset(70% 35% 0% 35% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

100
%
{
clip-path
:
inset(
70%
0
0
70%
round
5%
);
animation-timing-function
:
cubic-bezier(
0.86
,
0
,
0.07
,
1
);
}
}
@
keyframes sixMove { 0% {
	visibility: visible;
	clip-path: inset(70% 35% 0% 35% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

14
.2857 % {
	clip-path: inset(70% 35% 0% 35% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

28
.5714 % {
	clip-path: inset(70% 0 0 70% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

42
.8571 % {
	clip-path: inset(70% 0 0 70% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

57
.1428 % {
	clip-path: inset(35% 0% 35% 70% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

71
.4285 % {
	clip-path: inset(35% 0% 35% 70% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}

85
.7142 % {
	clip-path: inset(35% round 5%);
	animation-timing-function: cubic-bezier(0.86, 0, 0.07, 1);
}
100
%
{
clip-path
:
inset(
70%
35%
0%
35%
round
5%
);
animation-timing-function
:
cubic-bezier(
0.86
,
0
,
0.07
,
1
);
}
}
/* Loader End */
</style>





</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand active display-3 font-weight-bold glass-effect"
			href="home">Hotel Hopper</a>

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
										value="<%=details.getUserEmail()%>" id="userEmail"
										name="userEmail" readonly></td>
								</tr>
								<tr>
									<td class="font-weight-bold">Address</td>
									<td><input type="text" class="form-control"
										name="userAddress" value="<%=details.getUserAddress()%>"></td>
								</tr>
								<tr>
									<td class="font-weight-bold">Contact Number</td>
									<td><input type="text" class="form-control"
										name="userNumber" value="<%=details.getUserNumber()%>"></td>
								</tr>
								<tr>
									<td class="font-weight-bold">Profile Picture</td>
									<td><input type="file" class="form-control"
										name="userProfilePic"></td>
								</tr>
								<tr>
									<td class="font-weight-bold">Change Password</td>
									<td>
										<div class="input-group">
											<input type="password" class="form-control" id="password"
												name="userPassword" value="<%=details.getUserPassword()%>"
												placeholder="Enter your password">
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

		<!-- OTP  Modal  -->


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
							placeholder="Enter your OTP"> <small
							class="form-text text-danger" id="otpBoxError"></small>
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


	<!-- Loader Start -->

	<div class="wrapper" id="Loader">
		<div class="box-wrap">
			<div class="box one"></div>
			<div class="box two"></div>
			<div class="box three"></div>
			<div class="box four"></div>
			<div class="box five"></div>
			<div class="box six"></div>
		</div>
	</div>

	<!-- Loader End -->







	<p class="cursor typewriter-animation mt-5">Welcome To Hotel Hopper</p>




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
                        alert("OTP Sent Successfully On Email");
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
