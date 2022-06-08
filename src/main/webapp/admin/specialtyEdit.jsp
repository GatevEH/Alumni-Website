<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    <%
	    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if(request.getSession().getAttribute("userType") == null) response.sendRedirect(request.getContextPath() + "/index.jsp");
	    if(request.getSession().getAttribute("userType") == "alumni") response.sendRedirect(request.getContextPath() + "/alumni/home.jsp");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Alumni</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
		
		.theButtons:link, .theButtons:visited {
 			background-color: #DC143C;
			color: black;
			border: none;
			padding: 10px 15px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			border-radius: 5px;
			width: 140px;
		  	font-size: 20px;
		}
		
		.linkButton:link, .linkButton:visited {
			color: #DC143C;
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
			min-height: 467px;
		}
		
		.theAddButton{
			background-color: #1C4269;
			color: white;
			border: none;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			border-radius: 5px;
			width: 190px;
			font-size: 15px;
			padding: 10px 10px;
			cursor: pointer;
		}
		
		.addButton, .addButton:link {
 			background-color: #7CFC00;
			color: black;
			border: none;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			border-radius: 5px;
			width: 170px;
			font-size: 15px;
			padding: 10px 10px;
			cursor: pointer;
		}
		
		.addButton:hover{
			color:black;
		}
		
		.editButton:link, .editButton:visited {
 			background-color: yellow;
			color: black;
			border: none;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			border-radius: 5px;
			width: 140px;
			padding: 10px 10px;
		}
		
		.form-signin {
			  max-width: 380px;
			  padding: 15px 35px 45px;
			  margin: 0 auto;
			  background-color: #fff;
		}
		
		.form-control {
			  position: relative;
			  font-size: 16px;
			  height: auto;
			  padding: 10px;
		}
		
		input[type="text"] {
			  margin-bottom: 5px;
			  border-bottom-left-radius: 0;
			  border-bottom-right-radius: 0;
			  height: 40px;
		}
</style>
</head>
<body>
<div class="container-fluid" style="background-color:#00FFFF; color:black; height: 100px;padding:20px;">
		<div class="row">
		    <div class="col-md-4">
		        <h1>Alumni club</h1>
		    </div>
		    <div class="col-md-8" style=" text-align: right;">
				<nav>
    				<a class="theButtons" href="home.jsp">Home</a>
    				<a class="theButtons" href="specialties.jsp">Specialties</a>
    				<a class="theButtons" href="jobs.jsp">Jobs</a>
					<a class="theButtons" href="users.jsp">Users</a>
					<a class="theButtons" href="<%=request.getContextPath()%>/Logout">Logout</a>    	
    			</nav>    	
		    </div>
		</div>
</div>
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" 
						url = "jdbc:mysql://localhost:3306/alumni_1"
						user = "root"  password = "admin"/>
    <sql:query dataSource = "${snapshot}" var = "result">
		select * from specialties  where specialty_id = ${specialtyID}
    </sql:query>
    
<div class="pageContent container-fluid" style="padding: 20px 20px;">
<h2 style="padding-left: 20px; padding-top: 20px; margin-bottom: 80px;">Edit specialty</h2>
		<form id="specialtyEdit" action="SpecialtyCRUD?action=editSpecialty" method="post" class="form-signin" autocomplete="off">
			<c:forEach var = "row" items = "${result.rows}">
				<input type="hidden" value="${row.specialty_id}" name="specialtyID"/>
				<input class="form-control" type="text" value="${row.specialty}" name="specName"/>
			</c:forEach>
			<input type="hidden" value="${departmentID}" name="dptID"/>
			<button style="width: 100%; background-color: #00FFFF;" class="btn btn-lg btn-primary btn-block" type="submit">Edit</button>
		</form>
</div>
<div class="theFooter">
	<h5>N. G.</h5>
	<h5>Alumni</h5>
	<h5>2022</h5>
</div>
</body>
</html>