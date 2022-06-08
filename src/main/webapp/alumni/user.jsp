<%@page import="dao.AlumniDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%AlumniDAO ad = new AlumniDAO(); %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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
    				<a class="theButtons" href="jobs.jsp">Jobs</a>
					<a class="theButtons" href="users.jsp">Users</a>
					<a class="theButtons" href="profile.jsp">My Profile</a>  	
    			</nav>    	
		    </div>
		</div>
</div>
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" 
						url = "jdbc:mysql://localhost:3306/alumni_1"
						user = "root"  password = "admin"/>
    <sql:query dataSource = "${snapshot}" var = "resultAlumni">
		select * from alumnis, specialties where fk_specialty = specialty_id and alumni_id = ${userID}
    </sql:query>
    
<div class="pageContent container-fluid" style="padding: 20px 20px;">
	<div class="row" style="padding:20px 20px; width:100%;">
			<c:forEach items="${resultAlumni.rows}" var="row">
				<div class="col-3">
					<h1 style="font-weight: bold;"><c:out value="${row.first_name} ${row.last_name}"/></h1>
			    	<img src="data:profile_picture/jpg;base64, <%=ad.getAlumniPhoto(Integer.parseInt(request.getParameter("userID")))%>" width="250" height="280"/>	
			    </div>
			    <div class="col-4">
					<h1 style="font-weight: bold;">Information</h1>
					<h4 style="font-weight: bold;">Specialty</h4>
					<h5><c:out value="${row.specialty}"/></h5>
					<h4 style="font-weight: bold;">Class</h4>
					<h5><c:out value="${row.class_of}"/></h5>
					<h4 style="font-weight: bold;">Contacts</h4>
					<h5><c:out value="${row.email}"/></h5>
					<h5><c:out value="${row.phone_number}"/></h5>
					<h4 style="font-weight: bold;">Employer</h4>
					<h5><c:out value="${row.employer0}"/></h5>
					<h4 style="font-weight: bold;">Position</h4>
					<h5><c:out value="${row.position}"/></h5>
					  </div>
		    </c:forEach>
	 	<div class="col-5">
	 	</div>
	 </div>
</div>
<div class="theFooter">
	<h5>N. G.</h5>
	<h5>Alumni</h5>
	<h5>2022</h5>
</div>
</body>
</html>