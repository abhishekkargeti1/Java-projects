<%@page import="com.Entities.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./Base.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<div class="container mt-3">
		<div class=row>
			<div class="col-md-12">
				<h1 class="text-center mb-3">Welcome to Product App</h1>
				<table class="table">
					<thead class="thead-dark">
						
						<tr>
							<th scope="col">Product Id</th>
							<th scope="col">Product Name</th>
							<th scope="col">Product Description</th>
							<th scope="col">Product Price</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
					<%
								List<Product> productList= (List<Product>)request.getAttribute("product");
								for(Product p1: productList){
					%>
						<tr>
							
							<td><%= p1.getId() %></td>
							<td><%= p1.getName() %></td>
							<td><%= p1.getDescription()%></td>
							<td><%= p1.getPrice() %></td>
							<td>
							<a href="deleteProduct/<%= p1.getId() %>"><i class="fa-solid fa-trash text-danger"></i></a>
							&nbsp;&nbsp;
							<a href="editProduct/<%= p1.getId() %>"><i class="fa-solid fa-user-pen"></i></a></td>
						</tr>
					<%
								}
					%>
					</tbody>
				</table>
				<div class="container text-center">

					<a href="add-product" class="btn btn-outline-success">Add
						Product</a>
				</div>
			</div>


		</div>


	</div>
</body>
</html>