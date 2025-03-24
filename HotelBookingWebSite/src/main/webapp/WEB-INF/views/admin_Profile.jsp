<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
Boolean status = (Boolean) session.getAttribute("Admin");
// System.out.println("Status is " + status);
if (status == null) {
	//System.out.println("In the if block");
	response.sendRedirect("admin_login_Page");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Profile</title>
</head>
<body>
<%@include file="./CDN.jsp"%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand active display-3 font-weight-bold"
			href="/adminlogin">Hotel Hopper Admin Portal</a>
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

			<form action="Adminlogout" method="get" class="form-inline">
				<button class="btn btn-danger btn-sm btn-block mt-2">Log
					Out</button>
			</form>

		</div>
	</nav>
	<!-- Nav Ends -->
	<div class="container" id="container">

			
		<h2 class="text-center mt-4"
			style="font-family: cursive; font-weight: bold;">Bookings Dashboard</h2>



		<table class="table mt-4">
			<thead class="thead-dark">
				<tr>
					<th scope="col">S.No</th>
					<th scope="col">Booking Id</th>
					<th scope="col">Name Of Client</th>
					<th scope="col">Booking Details</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<tr>

					<th scope="row"></th>
					<td></td>
					<td></td>
					<td></td>
					<%
						if(false){
					%> 
					<td><a href="#" class="btn btn-outline-danger btn-sm">Delete</a></td>
					<td><a href="#" class="btn btn-outline-success btn-sm">Confirm Booking</a>&nbsp; &nbsp;<a href="#" class="btn btn-outline-danger btn-sm">Delete</a> </td>
					<%
					}else{
					%>
					<td><a href="#" class="btn btn-outline-primary btn-sm">Verify</a> </td>
					<%
					}
					%>
					</tr>
			</tbody>
		</table>


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
</body>
</html>