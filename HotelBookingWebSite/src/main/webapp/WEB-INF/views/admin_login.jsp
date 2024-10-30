<!doctype html>
<%@page import="com.helperclasses.Message"%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <title>User Login</title>
    <style>
        body {
            height: 100vh;
            background-color: #e9ecef; /* Light background color */
        }

        .login-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            padding: 40px;
            width: 100%; /* Full width on smaller screens */
            max-width: 400px; /* Limit maximum width */
            margin-top: 30px;
        }

        .login-card h3 {
            margin-bottom: 30px;
        }

        .login-card .footer-link {
            margin-top: 20px;
        }

        .form-group {
            position: relative; /* Required for positioning the icon */
        }

        .form-group .fa {
            position: absolute;
            right: 15px; /* Position the icon to the right */
            top: 50%; /* Center vertically */
            transform: translateY(-50%); /* Adjust for accurate vertical centering */
            cursor: pointer;
            z-index: 1; /* Ensure the icon is on top */
            color: #495057; /* Icon color */
        }

        .form-control {
            padding-right: 40px; /* Add padding to the right to avoid overlap with the icon */
        }
    </style>
</head>

<body>
    <%@include file="navbar.jsp"%>
    <!-- Include your navbar file -->

    <div class="container d-flex align-items-center justify-content-center vh-100">
        <div class="login-card">
            <h3 class="text-center">Admin Login</h3>
            <%
            Message message = (Message) session.getAttribute("message");
            if (message != null) {
            %>
            <div class="alert <%=message.getCssClass()%>" role="alert">
                <%=message.getContent()%>
            </div>
            <%
            session.removeAttribute("message");
            }
            %>
            <form action="adminlogin" method="POST" onsubmit="return validateForm(event)">
                <div class="form-group">
                    <label for="username">Username<span style="color: red;">*</span></label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username">
                    <small class="form-text text-danger" id="usernameError"></small>
                </div>
                <div class="form-group">
                    <label for="password">Password<span style="color: red;">*</span></label>
                    <div class="position-relative"> <!-- New wrapper for absolute positioning -->
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password">
                        <i class="fa fa-eye-slash" id="togglePassword"></i>
                    </div>
                    <small class="form-text text-danger" id="passwordError"></small>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Login</button>
            </form>
            <div class="text-center footer-link">
                <a href="#">Forgot Password?</a>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

    <script>
        function validateForm(event) {
            clearErrors();
            let isValid = true;

            const username = document.getElementById('username').value.trim();
            const password = document.getElementById('password').value.trim();

            // Check if username is a valid email
            if (username === "") {
                document.getElementById("usernameError").innerText = "Enter a valid email address.";
                isValid = false;
            }

            // Check if password is empty
            if (password === "") {
                document.getElementById("passwordError").innerText = "Password cannot be empty.";
                isValid = false;
            }

            // Prevent form submission if validation fails
            if (!isValid) {
                event.preventDefault();
            }

            return isValid;
        }

        function clearErrors() {
            document.getElementById("usernameError").innerText = "";
            document.getElementById("passwordError").innerText = "";
        }

        const togglePassword = document.querySelector('#togglePassword');
        const passwordField = document.querySelector('#password');

        togglePassword.addEventListener('click', function () {
            const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordField.setAttribute('type', type);
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });
    </script>

</body>

</html>
