<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <style>
        #current-date, #current-time {
            
            color: white;
        }
    </style>
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
                <div id="current-date"></div>
                &nbsp;
                <div id="current-time"></div>
            </form>
        </div>
    </nav>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
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
                timeElement.innerText = "Time: " + currentTime;
            }

            function getCurrentDate() {
                const now = new Date();

                const options = { year: 'numeric', month: 'short', day: '2-digit' };
                const formattedDate = now.toLocaleDateString('en-US', options);

                let dateElement = document.getElementById('current-date');
                dateElement.innerText = "Date: " + formattedDate;
            }

            // Call the functions to set the initial date and time
            getCurrentDate();
            getCurrentTime();

            // Update the time every second
            setInterval(getCurrentTime, 1000);
        });
    </script>
</body>
</html>
