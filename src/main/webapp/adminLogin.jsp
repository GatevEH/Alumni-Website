<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Alumni</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	.dropbtn {
		  background-color: #00FFFF;
		  color: black;
		  padding: 10px 20px;
		  border: none;
		  border-radius: 5px;
		  width: 150px;
		  font-size: 20px;
		}

		.dropdown {
		  position: relative;
		  display: inline-block;
		}
		
		.dropdown-content {
		  display: none;
		  position: absolute;
		  background-color: #FFFFFFCC;
		  min-width: 150px;
		  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		  z-index: 1;
		  border-radius: 5px;
		}
		
		.dropdown-content a {
		  color: black;
		  padding: 12px 16px;
		  text-decoration: none;
		  display: block;
		  border-radius: 5px;
		}
		
		.dropdown-content a:hover {
			background-color: #ddd;
		}
		
		.dropdown:hover .dropdown-content {
			display: block;
		}
		
		.theButtons:link, .theButtons:visited {
 			background-color: #00FFFF;
			color: black;
			border: none;
			padding: 10px 15px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			border-radius: 5px;
			width: 150px;
		  	font-size: 20px;
		}
		
		.linkButton:link, .linkButton:visited {
			color: #1C4269;
			text-decoration: none;
			font-weight: bold;
		}
		.theFooter{
			position:absolute;
			width: 100%; 
			background-color: #00FFFF;
			color: black;
			height: 100px;
		}
		
		.pageContent {
			min-height: 307px;
			text-align: center;
			margin-top: 80px;
			margin-bottom: 80px;
		}
		
		.form-signin {
		  max-width: 380px;
		  padding: 15px 35px 45px;
		  margin: 0 auto;
		  background-color: #fff;
		  border: 1px solid #00FFFF;  
		}
	
		.form-control {
		  position: relative;
		  font-size: 16px;
		  height: auto;
		  padding: 10px;
		}
	
		input[type="text"] {
		  margin-bottom: 10px;
		  border-bottom-left-radius: 0;
		  border-bottom-right-radius: 0;
		}
	
		input[type="password"] {
		  margin-bottom: 20px;
		  border-top-left-radius: 0;
		  border-top-right-radius: 0;
		}
</style>
</head>
<body>
<div class="container-fluid" style="background-color:#00FFFF; color:black; height: 100px;padding:20px;">
		<div class="row">
		    <div class="col-md-4">
		        <h1>Alumni club</h1>
		    </div>
		</div>
</div>
<div class="pageContent">
	<form class="form-signin" autocomplete="off" action="AdminLogin" method="post">       
	      <h2 style = "margin-bottom: 20px; text-align: center;"class="form-signin-heading">Admin Login</h2>
	      <input type="text" class="form-control" name="username" placeholder="Username" />
	      <input type="password" class="form-control" name="password" placeholder="Password"/>     
	      <button style="width: 100%; background-color: #00FFFF; color: black;" class="btn btn-lg btn-primary btn-block" type="submit">Login</button>   
	</form>
</div>
<div class="theFooter">
	<h5>N. G.</h5>
	<h5>Alumni</h5>
	<h5>2022</h5>
</div>
</body>
</html>