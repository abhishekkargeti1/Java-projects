<%@page import="com.entities.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
	UserDetails details  = (UserDetails)session.getAttribute("userDetails");
	if(details == null){
		response.sendRedirect("login_Page")	;
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>User Profile Page</h1>
</body>
</html>