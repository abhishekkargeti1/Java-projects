<%@page import="com.project1.dao.LikeandDislikeDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.project1.dao.UserDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project1.entities.Categories"%>
<%@page import="com.project1.entities.Post"%>
<%@page import="com.project1.helper.ConnectionProvider"%>
<%@page import="com.project1.dao.PostDao"%>
<%@page import="com.project1.entities.User"%>
<%@page errorPage="Error_Page.jsp" %>
<%
    User user = (User) session.getAttribute("CurrentUser");
    if (user == null) {
        response.sendRedirect("Login_page.jsp");
    }
%>
<%
    int post_id = Integer.parseInt(request.getParameter("post_id"));
    PostDao postdao = new PostDao(ConnectionProvider.getConnection());
    Post post = postdao.getPostByPostId(post_id);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=post.getTitle()%></title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            body{
                background:url(images/Background.jpg);
                background-size: cover;
                background-attachment: fixed;
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
            .sticky-column {
                position: sticky;
                top: 56px; /* Height of the navbar */
                z-index: 1000; /* Ensure it appears above the main content */
            }
            .post_title{
                font-weight: bold;
                font-size: 30px;
            }
            .post_content{
                font-weight: 100;
                font-size: 20px;
            }
            .post_Date{
                font-style: italic;
                font-weight: bold;
                margin-left: 35px;

            }
            .post_userInfo{
                font-size: 20px;
                font-weight: 400;

            }
            .row_user{
                border:1px solid #e2e2e2;
                padding-top: 15px;
            }



        </style>
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v20.0" nonce="O5FqU3GJ"></script>
</head>
<body>

    <!--navBar-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
        <a class="navbar-brand" href="Home.jsp"><span class="fa fa-asterisk"></span> NextGen Posts </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="Profile_page.jsp">Home <span class="sr-only"></span></a>
                </li>
<!--                <li class="nav-item active">
                    <a class="nav-link" href="#">About Us<span class="sr-only"></span></a>
                </li>-->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="fa fa-check-square-o"></span>  Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <%
                            PostDao postDao1 = new PostDao(ConnectionProvider.getConnection());
                            ArrayList<Categories> list3 = postDao1.getCategories();
                            for (Categories c : list3) {
                        %>
                        <a class="dropdown-item" onclick="getPosts(<%=c.getCid()%>)" value="<%=c.getCid()%>" href="Profile_page.jsp"><%=c.getName()%></a>
                        <%
                            }
                        %>
                    </div>
                </li>
<!--                <li class="nav-item active">
                    <a class="nav-link" href="#"><span class="fa fa-address-card"></span> Contact Us<span class="sr-only"></span></a>
                </li>-->
                <li class="nav-item active">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#Add_Post_Modal"><span class="fa fa-bullhorn"></span> Post<span class="sr-only"></span></a>
                </li>

            </ul>
            <ul class="navbar-nav mr-right">
                <li class="nav-item active">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#ProfileModal"><span class="fa fa-user-circle-o"></span> <%=user.getName()%><span class="sr-only"></span></a>
                </li>
                <li class="nav-item">
                    <span class="nav-link text-white" id="logout-timer"></span>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">LogOut <span class="fa-solid fa-arrow-right-from-bracket"></span><span class="sr-only"></span></a>
                </li>
            </ul>
        </div>
    </nav>
    <!--navBar end-->


    <!--Main Start-->

    <div class="container">
        <div class="row my-4">
            <div class="clo-md-8 offset-md-2">
                <div class="card ">
                    <div class="card-header bg-dark text-white text-center">
                        <h4 class="post_title"><%=post.getTitle()%></h4>
                    </div>
                    <div class="card-body " style="width: 50rem;">
                        <span><img class="card-img-top my-2 img-fluid" src="Blog_Pics/<%= post.getPicture()%>" alt="Card image cap"></span>
                        <div class="row my-3 row_user">
                            <div class="col-md-8 ">
                                <%
                                    UserDao userdao = new UserDao(ConnectionProvider.getConnection());
                                    User user1 = userdao.getUserByUserId(post.getUser_Id());
                                %>

                                <p class="post_userInfo">Posted By : <a href="#" ><%=user1.getName()%></a> </p>
                            </div>
                            <div class="col-md-4">
                                <%
                                    // Get the original date from the DataBase
                                    Date postDate = post.getDate();

                                    // Define the desired output format
                                    SimpleDateFormat outputFormat = new SimpleDateFormat("MMM-dd-yyyy");
                                    String formattedDate = outputFormat.format(postDate);

                                    Date now = new Date();
                                    SimpleDateFormat sdf = new SimpleDateFormat("hh:mm a");
                                    String currentTime = sdf.format(post.getDate());
                                %>
                                <p class="post_Date"><%= formattedDate%> <%= currentTime%></p>
                            </div>
                        </div>
                        <span class="post_content"><%=post.getContent()%></span>
                        <br>
                        <br>
                        <div class="post_code">
                            <pre><%=post.getCode()%></pre>
                        </div>
                    </div>
                    <div class="card-footer bg-dark ">
                        <%
                            LikeandDislikeDao ld = new LikeandDislikeDao(ConnectionProvider.getConnection());

                        %>
                        <a href="#" onclick="doLike(<%= post.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-primary btn-small"><i class="fa fa-thumbs-o-up "></i> <span class="like-counter" ><%=ld.countLikeOnPost(post.getPid())%></span></a>
                        <!--<a href="#" class="btn  btn-outline-success  btn-small"><i class="fa fa-commenting-o"></i><span> 20</span></a>-->
                        <a href="Profile_page.jsp" class="btn btn-outline-info btn-small">Back</a>
                    </div>
<!--                    <div class="card-footer">
                        <div class="fb-comments" data-href="http://localhost:9494/Project1/Show_post.jsp?post_id=<%= post.getPid()%>" data-width="" data-numposts="5"></div>
                    </div>-->
                </div>
            </div>
        </div>
    </div>

    <!--Main End-->

    <!--Profile modal start-->
    <div class="modal fade" id="ProfileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-dark text-white">
                    <h5 class="modal-title" id="exampleModalLongTitle">TechBlog</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container text-center">

                        <img src="images/<%=user.getUser_Profile()%>" class="img-fluid" style="border-radius:50%; max-width:150px; ">
                        <h5 class="modal-title" id="exampleModalLongTitle"><%=user.getName()%></h5>

                        <!--details-->
                        <div id="Profile_Detail">
                            <table class="table table-bordered mt-2">

                                <tbody>
                                    <tr>
                                        <th scope="row">ID</th>
                                        <td><%=user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Email</th>
                                        <td><%=user.getEmail()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Gender</th>
                                        <td colspan="2"><%=user.getGender()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Profile</th>
                                        <td colspan="2"><%=user.getProfile()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Phone Number</th>
                                        <td colspan="2"><%=user.getPhoneNumber()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Register Date and Time</th>
                                        <td colspan="2"><%=user.getDateTime()%></td>
                                    </tr>

                                </tbody>
                            </table>
                        </div

                        <!--Details Edit-->
                        <div id="Profile_Edit" style="display:none;">
                            <h2 class="mt-2">Edit Your Details </h2>
                            <form action="EditServlet" method="post" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <td>Id</td>
                                        <td><input type="text" class="form-control" readonly value="<%=user.getId()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Name</td>
                                        <td><input type="text" name="User_Name" class="form-control" value="<%=user.getName()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td><input type="email" readonly  class="form-control"value="<%=user.getEmail()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Password</td>
                                        <td><div class="input-group">
                                                <input type="password" name="User_password" readonly class="form-control" id="password" value="<%=user.getPassword()%>">
                                                <span class="fa fa-eye-slash" id="togglePassword"></span>
                                            </div></td>
                                    </tr>
                                    <tr>
                                        <td>Phone</td>
                                        <td><input type="text" class="form-control" name="User_PhoneNumber" maxlength="10" value="<%=user.getPhoneNumber()%>"</td>
                                    </tr>
                                    <tr>
                                        <td>Select Your Profile Picture </td>
                                        <td><input type="file" class="form-control" name="User_ProfilePic"></td>
                                    </tr>

                                </table>
                                <div class="container">
                                    <button type="submit" class="btn btn-outline-primary">Save</button>
                                </div>
                            </form>
                        </div>


                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" id="Profile_Edit_button" class="btn btn-primary">Edit</button>
                </div>
            </div>
        </div>
    </div>

    <!--profile modal end-->

    <!--Add Post Modal-->
    <!-- Modal -->
    <div class="modal fade" id="Add_Post_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Post Your Thoughts</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="AddPostServlet" method="Post" id="Add_Post_Form">

                        <div class="form-group">
                            <select class="form-control" name="cid">
                                <option selected disabled>----Select Category-----</option>
                                <%
                                    PostDao postDao = new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Categories> list = postDao.getCategories();
                                    for (Categories c : list) {
                                %>
                                <option value="<%=c.getCid()%>"><%=c.getName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" name="title" placeholder="Enter Post Title" class="form-control" />
                        </div>
                        <div class="form-group">
                            <textarea name="content" class="form-control"placeholder="Enter Your Content"></textarea>
                        </div>

                        <div class="form-group">
                            <textarea name="code" class="form-control" style="height: 200px"placeholder="Enter Your Code (If Any)"></textarea>
                        </div>

                        <div class="form-group">
                            <label>Select Your Picture</label>
                            <br>
                            <input name="picture" type="file" class="form-control">
                        </div>
                        <div class="container" style="margin-left: 24pc">
                            <button type="submit" class="btn btn-outline-success">Post</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
    <!--End Post Modal--> 










    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="javascript/script.js" type="text/javascript"></script>
    <script>
                            $(document).ready(function () {
                                let editStatus = false;
                                console.log("Loaded1");
                                $("#Profile_Edit_button").click(function () {
                                    if (editStatus === false) {
                                        $("#Profile_Detail").hide();
                                        $("#Profile_Edit").show();
                                        editStatus = true;
                                        $(this).text("Back");
                                    } else {
                                        $("#Profile_Detail").show();
                                        $("#Profile_Edit").hide();
                                        editStatus = false;
                                        $(this).text("Edit");
                                    }


                                });
                            });

                            $("#togglePassword").click(function () {
                                let passwordField = $("#password");
                                let type = passwordField.attr("type") === "password" ? "text" : "password";
                                passwordField.attr("type", type);
                                $(this).toggleClass("fa-eye fa-eye-slash");
                            });
    </script>

    <script>
        $(document).ready(function () {
            console.log("Loaded2");
            $("#Add_Post_Form").on("submit", function (event) {
                // this code call when the submit button is clicked
                event.preventDefault();
                console.log("you submited your post ");
                let form = new FormData(this);
                $.ajax({
                    url: "AddPostServlet",
                    type: "POST",
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        if (data.trim() === "Done") {
                            swal("Successfully Posted", "Saved Successfully ", "success")
                                    .then((value) => {
                                        window.location = "Profile_page.jsp";
                                    });
                        } else {
                            swal("Something Went Wrong", "Error", "error")
                                    .then((value) => {
                                        window.location = "Profile_page.jsp";
                                    });
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        swal("Error ", "Something Went Wrong", "error");
                    },
                    processData: false,
                    contentType: false
                })
            })
        });
    </script>

    <!--Loading post using ajax-->
    <script>
        function getPosts(catId, reference) {
            $("#loader").show();
            $("#post_container").hide();
            $(".c-link").removeClass('active');
            $.ajax({
                url: "Load_posts.jsp",
                data: {cid: catId},
                success: function (data, textStatus, jqXHR) {
                    //                        console.log(data);
                    $("#loader").hide();
                    $("#post_container").show();
                    $("#post_container").html(data);
                    $(reference).addClass('active');
                }
            });
        }



        $(document).ready(function () {
            //                console.log("Loaded3");
            let temp = $(".c-link")[0];
            getPosts(0, temp);

        });
    </script>
    <script>

        var lastActiveTimeMs = new Date().getTime(); // Set to current time on page load
        var SESSION_TIMEOUT_MILLIS = 10 * 60 * 1000; // 35 mins in milliseconds
        var CHECK_TIME_MILLIS = 1000; // 1 second in milliseconds
        var timerInterval;

        function updateTimerDisplay() {
            var currentTime = new Date().getTime();
            var remainingTime = SESSION_TIMEOUT_MILLIS - (currentTime - lastActiveTimeMs);
            if (remainingTime <= 0) {
                clearInterval(timerInterval);
                // Session timeout, perform AJAX call to invalidate session
                $.ajax({
                    url: 'LogoutServlet', // Replace with your server-side script to invalidate session
                    method: 'POST',
                    success: function (response) {
                        // Redirect to login page after session is invalidated
                        swal("Login Session Over")
                                .then((value) => {
                                    window.location.href = 'Login_page.jsp';
                                });
                    },
                    error: function (xhr, status, error) {
                        // Handle error if AJAX call fails
                        console.error('Failed to invalidate session:', error);
                        window.location.href = 'Login_page.jsp'; // Fallback to login page
                    }
                });
            } else {
                var minutes = Math.floor(remainingTime / (60 * 1000));
                var seconds = Math.floor((remainingTime % (60 * 1000)) / 1000);
                var formattedSeconds = seconds < 10 ? "0" + seconds : seconds;
                document.getElementById('logout-timer').innerText = "Auto LogOut In " + minutes + " : " + formattedSeconds;
            }
        }

        $(document).ready(function () {
            // Initialize the timer interval
            timerInterval = setInterval(updateTimerDisplay, CHECK_TIME_MILLIS);

            // Reset the timer on user activity
            $(document).on('mousemove keypress click', function () {
                lastActiveTimeMs = new Date().getTime();
            });

            updateTimerDisplay(); // Initial call to display the timer immediately
        });

    </script>
</body>
</html>
