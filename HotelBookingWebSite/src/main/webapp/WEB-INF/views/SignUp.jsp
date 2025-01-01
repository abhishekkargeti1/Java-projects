<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Sign Up</title>
<style>
body {
	background-color: #e9ecef; /* Light background color */
}

.navbar {
	margin-bottom: 20px; /* Space between navbar and content */
}

.signup-container {
	display: flex; /* Flexbox layout */
	justify-content: center; /* Center horizontally */
	align-items: center; /* Center vertically */
	height: calc(100vh - 60px); /* Adjust height to account for navbar */
}

.signup-card {
	background: #ffffff; /* White background for card */
	border-radius: 10px; /* Rounded corners */
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* Soft shadow */
	padding: 30px; /* Inner padding */
	width: 800px; /* Fixed width for landscape orientation */
}

.signup-card h3 {
	margin-bottom: 20px; /* Spacing below the header */
	font-weight: bold; /* Bold header */
	text-align: center; /* Center header */
}

.form-row {
	margin-bottom: 15px; /* Spacing between rows */
}

.photo-preview {
	width: 100%; /* Full width for image preview */
	height: 150px; /* Fixed height for image preview */
	object-fit: cover; /* Cover the area without distortion */
	border-radius: 5px; /* Rounded corners for preview */
	display: none; /* Hidden by default */
}

.loader {
	width: 50px;
	margin-left: 21pc;
	display: none;
	margin-top: 2pc;
	aspect-ratio: 1;
	border-radius: 50%;
	border: 8px solid lightblue;
	border-right-color: orange;
	animation: l2 1s infinite linear;
}

@keyframes l2 {to{transform: rotate(1turn)}}
</style>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<!-- Navbar included here -->
	<div class="signup-container">
		<div class="card signup-card">
			<h3 class="text-center">Create an Account</h3>
			<form action="registerForm" method="POST" id="form"
				onsubmit="return validateForm(event)" enctype="multipart/form-data">
				<div class="form-row">
					<div class="col">
						<div class="form-group">
							<label for="name">Full Name<span style="color: red;">*</span></label>
							<input type="text" class="form-control" id="name" name="userName"
								placeholder="Enter your full name"> <small
								class="form-text text-danger" id="nameError"></small>
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="email">Email Address<span style="color: red;">*</span></label>
							<input type="email" class="form-control" id="email"
								name="userEmail" placeholder="Enter your email"> <small
								class="form-text text-danger" id="emailError"></small>
						</div>
					</div>
				</div>
				<div class="form-row">
					<div class="col">
						<div class="form-group">
							<label for="phone">Contact Number<span
								style="color: red;">*</span></label> <input type="tel"
								class="form-control" id="phone" name="userNumber"
								placeholder="Enter your contact number"> <small
								class="form-text text-danger" id="phoneError"></small>
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="dob">Date of Birth<span style="color: red;">*</span></label>
							<input type="date" class="form-control" name="userDOB" id="dob">
							<small class="form-text text-danger" id="dobError"></small>
						</div>
					</div>
				</div>
				<div class="form-row">
					<div class="col">
						<div class="form-group">
							<label for="photo">Upload Profile Photo<span
								style="color: red;">*</span></label> <input type="file"
								class="form-control-file" id="photo" name="userProfilePic">
							<img id="photoPreview" class="photo-preview mt-2" src=""
								alt="Photo Preview"> <small class="form-text text-danger"
								id="photoError"></small>
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="address">Home Address<span
								style="color: red;">*</span></label>
							<textarea class="form-control" id="address" rows="3"
								name="userAddress" placeholder="Enter your address"></textarea>
							<small class="form-text text-danger" id="addressError"></small>
						</div>
					</div>
				</div>
				<button type="submit" id="signUpbtn"
					class="btn btn-primary btn-block">Sign Up</button>
				<div class="loader" id="loader"></div>

			</form>

			<div class="text-center mt-3">
				<p>
					Already have an account? <a href="login_Page">Login here</a>
				</p>
			</div>
		</div>
	</div>

	<script>
      
    </script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script>
   
    function validateForm() {
  
        clearErrors();

       
        const name = document.getElementById("name").value.trim();
        const email = document.getElementById("email").value.trim();
        const phone = document.getElementById("phone").value.trim();
        const dobInput = document.getElementById("dob").value.trim();
        const address = document.getElementById("address").value.trim();
        const dob = new Date(dobInput);
        const today = new Date();

        let isValid = true;

        if (!/^[A-Za-z\s]{3,30}$/.test(name)) {
            document.getElementById("nameError").innerText = "Name must be 3-30 characters and contain only letters and spaces.";
            isValid = false;
        }

        if (dob > today) {
            document.getElementById("dobError").innerText = "Date of Birth cannot be in the future.";
            isValid = false;
        }

        if (!/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(email)) {
            document.getElementById("emailError").innerText = "Enter a valid email address.";
            isValid = false;
        }

        if (!/^\d{10}$/.test(phone)) {
            document.getElementById("phoneError").innerText = "Phone number must be exactly 10 digits.";
            isValid = false;
        }

        if (address ==="") { 
            document.getElementById("addressError").innerText = "Please Enter Valid  Address";
            isValid = false;
        }

        return isValid;
    }

    // Function to clear error messages
    function clearErrors() {
        document.getElementById("nameError").innerText = "";
        document.getElementById("emailError").innerText = "";
        document.getElementById("phoneError").innerText = "";
        document.getElementById("dobError").innerText = ""; 
        document.getElementById("addressError").innerText = ""; 
    }
    
 // Add input event listeners for real-time validation feedback
    document.getElementById("name").addEventListener("input", function() {
        clearErrors();
        validateForm();
    });
    document.getElementById("email").addEventListener("input", function() {
        clearErrors();
        validateForm();
    });
    document.getElementById("phone").addEventListener("input", function() {
        clearErrors();
        validateForm();
    });
    document.getElementById("dob").addEventListener("input", function() {
        clearErrors();
        validateForm();
    });
    document.getElementById("address").addEventListener("input", function() {
        clearErrors();
        validateForm();
    });
</script>

	<script>
        $('#form').on('submit', function (event) {
            event.preventDefault();

            if (validateForm()) {
                let form = new FormData(this);
                $("#signUpbtn").hide();
                $("#loader").show();

                $.ajax({
                    url: "registerForm",
                    type: "POST",
                    data: form,
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        $("#signUpbtn").show();
                        $("#loader").hide();

                        if (data.trim() === 'Done') {
                            Swal.fire("Success", "Successfully Registered... Redirecting to login page", "success")
                                .then(() => {
                                    window.location = "login_Page";
                                });
                        } else {
                            Swal.fire("Error", data, "error");
                        }
                    },
                    error: function () {
                        $("#signUpbtn").show();
                        $("#loader").hide();
          	              Swal.fire("Error", "Something went wrong", "error");
                    }
                });
            } else {
                Swal.fire("Error", "Please Fill All the Fields", "warning");
            }
        });
    </script>

</body>

</html>
