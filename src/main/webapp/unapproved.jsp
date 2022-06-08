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
			width: 200px;
		  	font-size: 20px;
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
	<p style="font-size: 25px; margin-top: 150px;">You registered succesfully!</p>
	<p style="font-size: 25px;">You have to get approved by an administrator before you can start using the system!</p>
	<a class="theButtons" href="index.jsp">To Home Page</a>
</div>
<div class="theFooter">
	<h5>N. G.</h5>
	<h5>Alumni</h5>
	<h5>2022</h5>
</div>
</body>
</html>