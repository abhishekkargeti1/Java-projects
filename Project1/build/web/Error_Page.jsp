<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Something Went Wrong</title>
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 88%, 70% 81%, 33% 100%, 0 84%, 0 0);

            }
        </style>
        
    </head>
    <body>
        <div class="container text-center">
            <img src="images/browser.png" alt="" class="img-fluid"/>
            <h3 class="display-3 mt-3">Sorry ! Something Went Wrong.....</h3>
            <!--<h4 class="mt-3"><%=exception%></h4>-->
            <br>
            <a href ="Home.jsp"class="btn primary-background  btn-lg text-white mt-2">Home</a>
        </div>
        
        
        
        
    </body>
</html>
