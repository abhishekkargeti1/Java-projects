<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <title>Home Page</title>
    <style>
        .jumbotron {
            background: linear-gradient(to right, #007bff, #0056b3);
            color: white;
        }
        .feature-card {
            margin: 15px 0;
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>
    
    <div class="jumbotron text-center">
        <div class="container">
            <h1 class="display-3 font-weight-bold">Welcome To Hotel Hopper</h1>
            <p class="lead">Your gateway to unforgettable travel experiences.</p>
            <a href="login_Page" class="btn btn-light btn-lg">Explore Now</a>
        </div>
    </div>

    <div class="container">
        <h2 class="my-4">Why Choose HotelHopper?</h2>
        <div class="row">
            <div class="col-md-4 feature-card">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Diverse Accommodations</h5>
                        <p class="card-text">From luxurious resorts to charming boutique hotels, we have it all.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 feature-card">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Smart Search Filters</h5>
                        <p class="card-text">Easily find the perfect stay based on your preferences.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 feature-card">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Exclusive Deals</h5>
                        <p class="card-text">Take advantage of last-minute offers and special promotions.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="bg-light py-4">
        <div class="container">
            <h2 class="text-center">User Reviews</h2>
            <p class="text-center">"Hotel Hopper made my travel planning a breeze!" - Sarah J.</p>
            <p class="text-center">"I found the perfect hotel for my family vacation!" - Mark T.</p>
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
</body>
</html>
