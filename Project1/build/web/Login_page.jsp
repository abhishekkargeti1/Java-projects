<%@page import="com.project1.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<%@ page errorPage="Error_Page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
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
            .banner-background {
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 88%, 70% 81%, 33% 100%, 0 84%, 0 0);
            }
            .input-group {
                position: relative;
                width: 100%;
            }
            .input-group input {
                width: 100%;
                padding-right: 40px; /* Adjust padding to fit the icon */
            }
            .input-group .fa {
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <main class="d-flex align-items-center " style="height: 90vh">
            <div class="container pb-3">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header text-center">
                                <span class="fa fa-user-circle-o fa-3x"></span>
                                <br>
                                <p>Login here</p>
                            </div>
                            <%
                                Message message = (Message) session.getAttribute("message");
                                if (message != null) {
                            %>
                            <div class="alert <%=message.getCssClass()%>" role="alert">
                                <%= message.getContent()%>
                            </div>
                            <%
                                    session.removeAttribute("message");
                                }

                            %>
                            <div class="card-body">
                                <form action="Login_Servlet" method="POST" id="form">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="User_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <div class="input-group">
                                            <input name="User_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                                            <i class="fa fa-eye-slash" id="togglePassword" style="font-size:24px"></i>
                                        </div>
                                    </div>
                                    <div class="container text-center">
                                        <button type="submit" id="submitbtn" class="btn btn-primary mt-2">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="javascript/script.js" type="text/javascript"></script>
        <script>
            var usernameInput = document.getElementById('exampleInputEmail1');
            var username = usernameInput.value;
            console.log(username);
        </script>
        
        <script>
            const togglePassword = document.querySelector('#togglePassword');
            const password = document.querySelector('#exampleInputPassword1');
            togglePassword.addEventListener('click', function () {
                // Toggle the type attribute
                const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);
                // Toggle the eye / eye slash icon
                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
            });
        </script>
      

    </body>
</html>
