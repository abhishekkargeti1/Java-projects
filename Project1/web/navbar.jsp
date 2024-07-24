<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
            <a class="navbar-brand" href="Home.jsp"><span class="fa fa-asterisk"></span> NextGen Posts </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Home.jsp">Home <span class="sr-only"></span></a>
                    </li>
                    <!--                    <li class="nav-item active">
                                            <a class="nav-link" href="#">About Us<span class="sr-only"></span></a>
                                        </li>-->
                    <!--                    <li class="nav-item active">
                                            <a class="nav-link" href="#"><span class="fa fa-address-card"></span> Contact Us<span class="sr-only"></span></a>
                                        </li>-->
                    <!--                    <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span class="fa fa-check-square-o"></span>  Categories
                                            </a>
                                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                <a class="dropdown-item" href="#"></a>
                                                <a class="dropdown-item" href="#">Programming Language</a>
                                                <a class="dropdown-item" href="#">Project Implementation</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Data Structure</a>
                                            </div>
                                        </li>-->
                    <li class="nav-item active">
                        <a class="nav-link" href="Registration_module.jsp"><span class="fa fa-user-plus"></span> Sign Up<span class="sr-only"></span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Login_page.jsp"><span class="fa fa-user-circle-o"></span> Login<span class="sr-only"></span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Login_page.jsp"><span class="fa fa-bullhorn"></span> Post<span class="sr-only"></span></a>
                    </li>


                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <div id="current-time"></div>



                    <!--                    <ul class="navbar-nav mr-auto">
                                            <li class="nav-item active">
                                                <a class="nav-link" href="Registration_module.jsp"><span class="fa fa-user-plus"></span> Sign Up<span class="sr-only"></span></a>
                                            </li>
                                            <li class="nav-item active">
                                                <a class="nav-link" href="Login_page.jsp"><span class="fa fa-user-circle-o"></span> Login<span class="sr-only"></span></a>
                                            </li>
                                        </ul>-->
                    <!--                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>-->
                </form>
            </div>
        </nav>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Function to get and format the current time
                function getCurrentTime() {
                    let now = new Date();

                    let hours = String(now.getHours()).padStart(2, '0');
                    let minutes = String(now.getMinutes()).padStart(2, '0');
                    let seconds = String(now.getSeconds()).padStart(2, '0');
                    let ampm = hours >= 12 ? 'PM' : 'AM';

                    hours = hours % 12;
                    hours = hours ? hours : 12; // the hour '0' should be '12'
                    hours = String(hours).padStart(2, '0');

                    let currentTime = hours + ':' + minutes + ':' + seconds + ' ' + ampm;

                    let timeElement = document.getElementById('current-time');
                    timeElement.innerText = "Current Time: " + currentTime;
                    timeElement.style.color = 'white';
                    timeElement.style.fontWeight ='bold';
                }

                // Call the function to set the initial time
                getCurrentTime();

                // Update the time every second
                setInterval(getCurrentTime, 1000);
            });
        </script>


    </body>
</html>
