<%@page import="com.project1.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <!--css link-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body{
                background:url(images/Background.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 88%, 70% 81%, 33% 100%, 0 84%, 0 0);

            }
        </style>
        <style>
        #slider{
            overflow: hidden;
        }
        #slider figure{
            position: relative;
            width: 500%;
            margin: 0;
            left: 0;
            animation: 20s slider infinite;
        }
        #slider img{
            width: 20%;
            float: left;
        }
        @keyframes slider{
            0%{
                left: 0;
            }
            20%{
                left: 0;
            }
            25%{
                left: -100%;
            }
            45%{
                left: -100%;
            }
            50%{
                left: -200%;
                }
            70%{
                left: -200%;
            }
            75%{
                left: -300%;
            }
            95%{
                left: -300%;
            }
            100%{
                left: 0;
            }
        }
    </style>
    </head>
    <body>
        <!--Banner-->
        <div class="container-fluid p-0 m-0">
            <div class=" bg-dark jumbotron text-white banner-background">
                <div class="container">
                    
                    <h3 class="display-3"><b>Welcome To NextGen Posts</b></h3>
                    <!--<h3>NextGen Post</h3>-->
                    <p>NextGen Post is an innovative social media scheduling and posting platform designed specifically for tech enthusiasts and bloggers. With a user-friendly interface and advanced automation features, NextGen Post helps you streamline your content sharing across multiple platforms effortlessly.</p>
                    <a href="Registration_module.jsp" class=" btn btn-outline-light"><span class="fa fa-user-plus"></span> Start Its Free</a>
                    <a href="Login_page.jsp" class=" btn btn-outline-light"><span class="fa fa-user-circle-o"></span> Login</a>
                </div>
                
            </div>
        </div>
        <div class="container" id="slider">
           
        <figure>
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTuZ-1eEk8seH51KPXqkWH_lgfx08GKVRe4Q&usqp=CAU" width="500px" height="500px" alt="">
            <img src="data:image/png;base64,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" width="500px" height="500px" alt="">
            <img src="data:image/png;base64,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" width="500px" height="500px" alt="">
            <img src="data:image/png;base64,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" width="500px" height="500px" alt="">
        </figure>
        </div>
        <br>
        <!--cards-->
<!--        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary text-white">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary text-white">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>-->








        <!--Js link-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="javascript/script.js" type="text/javascript"></script>
        <script>
            
        </script>


    </body>
</html>
