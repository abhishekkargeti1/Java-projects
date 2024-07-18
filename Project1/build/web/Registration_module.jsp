<%@page import="com.project1.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp"%>
<%@ page errorPage="Error_Page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
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
    </head>
    <body>
        <main class=" p-3">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card"> 
                        <div class="card-header text-center">
                            <span class="fa fa-user-plus fa-3x"></span>
                            <br>
                            Register Here
                        </div>

                        <div class="card-body">
                            <form action="RegisterServlet" method="POST" id="form">

                                <div class="form-group">
                                    <label for="user_name">Name</label>
                                    <input name="Fname"type="text" class="form-control" id="uesr_name" aria-describedby="emailHelp" placeholder="Enter your name" required>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="Email"type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Phone Number</label>
                                    <input name="PhoneNumber" type="text" class="form-control" name="PhoneNumber" placeholder="Phone Number" maxlength="10" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Profile</label>
                                    <input name="Profile" type="text" class="form-control" name="Profile" placeholder="Profile status" required>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Gender</label>
                                    <br>
                                    <input type="radio"  name="Gender" value="Male" required> Male
                                    <input type="radio"  name="Gender" value="Female" required> Female
                                    <input type="radio"  name="Gender" value="Other" required> Other
                                </div>


                                <div class="form-check">
                                    <input name="check1" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree Terms and Condition </label>
                                </div>
                                <button type="submit" id="submitbtn" class="btn btn-primary mt-3 text-center">Submit</button>
                                <div class="container mt-2 text-center" id="loader" style="display: none">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please Wait </h4>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
















        <!--Js link-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="javascript/script.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded");

                $('#form').on('submit', function (event) {
                    debugger;
                    event.preventDefault();
                    let form = new FormData(this);
                    $("#submitbtn").hide();
                    $("#loader").show();
                    $.ajax({
                        url: "RegisterServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#submitbtn").show();
                            $("#loader").hide();
                            if (data.trim() === 'Done') {
                                swal("Successfully Register...We are Redirecting you to the login page")
                                        .then((value) => {
                                            window.location = "Login_page.jsp";
                                        });
                            } else {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR.responseText); // Changed 'data' to 'jqXHR.responseText' for logging errors
                            $("#submitbtn").show();
                            $("#loader").hide();
                            swal("Something Went Wrong");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });

        </script>
    </body>
</html>
