<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./Base.jsp"%>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h1 class="text-center mb-3">Update Details</h1>
				<form action="${pageContext.request.contextPath}/add-product" method="post">
					<div class="form-group">
						<label for="name">Product Name</label> 
						<input type="text" class="form-control" id="name" aria-describedby="emailHelp"
							placeholder="Enter Product id" name="id" value="${Details.id}" readonly>
					</div>
					<div class="form-group">
						<label for="name">Product Name</label> 
						<input type="text" class="form-control" id="name" aria-describedby="emailHelp"
							placeholder="Enter Product Name" name="name" value="${Details.name}">
					</div>
					<div class="form-group">
						<label for="description">Product Description</label>
						<textarea rows="5" class="form-control" name="description"
							id="description">${Details.description}</textarea>
					</div>

					<div class="form-group">
						<label for="price">Product Price</label> 
						<input type="text" class="form-control" id="price" aria-describedby="emailHelp"
							placeholder="Enter Product Price" name="price" value="${Details.price}">
					</div>

					<div class="text-center container">
						<a href="${pageContext.request.contextPath}/"
							class="btn btn-outline-success">Back</a>
						<button type="submit" class="btn btn-primary">Update</button>

					</div>

				</form>
			</div>
		</div>
	</div>
</body>
</html>