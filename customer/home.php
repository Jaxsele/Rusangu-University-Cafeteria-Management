<?php
session_start();
if (isset($_SESSION["username"])) {
    $username = $_SESSION["username"];
    session_write_close();
} else {
    // since the username is not set in session, the user is not-logged-in
    // he is trying to access this page unauthorized
    // so let's clear all session variables and redirect him to index
    session_unset();
    session_write_close();
    $url = "./index.php";
    header("Location: $url");
}

?>
<HTML>
<HEAD>
<TITLE>Welcome</TITLE>
<link href="css/home.css" type="text/css" rel="stylesheet" />
<link href="assets/css/phppot-style.css" type="text/css" rel="stylesheet" />
<link href="assets/css/user-registration.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<style>
    body{
        background-image:linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)),url("./assets/co.jpg");
        background-position: center; /* Center the image */
        background-repeat: no-repeat; /* Do not repeat the image */
        background-size: cover; /* Resize the background image to cover the entire container */
    }

    #home h1 {
        font-size: 45px;
        color: rgb(255, 255, 255);
        letter-spacing: 8px;
        font-style: normal;
        padding-top: 1px;
        font-weight: bold;
    }
    #home .btn {
        background: transparent;
        border-radius: 10px;
        border: 3px solid #ffffff;
        color: #ffffff;
        font-weight: bold;
        letter-spacing: 2px;
        padding: 16px 42px;
        padding-right: center;
        margin-top: 0px;
        transition: all 0.4s ease-in-out;
    }
    #home .btn:hover {
        background: #ffffff;
        color: #202020;
    }
</style>
</HEAD>
<BODY>
    
	<div class="phppot-container" >
        <div class="col btn btn-danger" style="margin-top:1% !important; font-size:25px; color:white; font-family: 'Times New Roman', Times, serif;"> Customer Dashboard</div><div class="page-header">

		</div>
    <div class="topnav">
        <a href="Logout.php">Logout</a>
        <a href="order_reports.php">Order Reports</a>
        <a href="view.php">View Avialble</a>
        <a class="active" href="billing/index.php">Make Order</a>
        <b href="#about">About</b>
    </div>
		<div class="page-content jumbotron" style="  background-color: red; background-image: linear-gradient(to right, darkgoldenrod , purple);">
  <h4 style="color:white; font-weight:bold; font-size:25px; font-family: 'Times New Roman', Times, serif;">Welcome Back <?php echo $username;?></h4></div>
  <!-- home section -->
  <br><br><br>
<!--<section id="home" class="parallax-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<a href="billing/index.php" class="smoothScroll btn btn-default">Make Order</a>
				<a href="view.php" class="smoothScroll btn btn-default">Available</a>
                <a href="order_reports.php" class="smoothScroll btn btn-default">Order Reports</a>
			</div>
		</div>
	</div>		
</section>
  <span class="login-signup btn btn-warning"><a href="logout.php" style="color:white">Logout</a></span>
	</div>-->
</BODY>
</HTML>
