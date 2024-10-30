<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Navbar with Bigger Search Button</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
#clock {
	color: "black"
	  font-size: 10px;
	  font-weight:bold;
}
.nav-item.dropdown:hover .dropdown-menu {
    display: block;
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand active" href="home">Home</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
        <li class="nav-item"><a class="nav-link" href="#contact">Contact <span class="fa fa-address-book"></span></a></li>
        
        <!-- Dropdown for Login -->
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="loginDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Login <span class="fa fa-sign-in"></span>
            </a>
            <div class="dropdown-menu" aria-labelledby="loginDropdown">
                <a class="dropdown-item" href="login_Page">User Login</a>
                <a class="dropdown-item" href="admin_login_Page">Admin Login</a>
            </div>
        </li>
        
        <li class="nav-item"><a class="nav-link" href="SignUp_Page">Sign Up <span class="fa fa-user-circle"></span></a></li>
    </ul>

    <div class="form-inline my-2 my-lg-0" id="clock"></div>
</div>


			<!-- Search bar and button -->
			<!--  <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-primary btn-custom my-2 my-sm-0" type="submit">
        <i class="fa fa-search"></i>
      </button>
    </form> -->
		</div>
	</nav>

	<!-- Bootstrap and Font Awesome scripts -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	
	
	
	
	<script>
	
	const clockDiv = document.getElementById("clock");
	setInterval(() => {
		let date = new Date()
		clockDiv.innerHTML=date.toDateString()+" "+date.toLocaleTimeString()
	}, 1000);


</script>
</body>
</html>
