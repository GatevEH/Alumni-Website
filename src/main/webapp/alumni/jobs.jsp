<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <sql:query dataSource = "${snapshot}" var = "result">
        SELECT * from jobs, alumnis, specialties where fk_alumni = alumni_id and fk_specialty = specialty_id
    </sql:query>
<div class="pageContent" style="padding:20px; width: 80%; margin: 0 auto;">
    <h2>Job offers</h2>
    <table class="table table-striped" id="mainTable" style="font-size: 20px;border: 1px solid #00FFFF; border-radius: 5px;">
	    	<thead>
	        <tr>
				<td><input id="search1" class="col-md-2" type="text" placeholder="Position" style="width: 100%; height: 35px;"/></td>
				<td><input id="search2" class="col-md-2" type="text" placeholder="Location" style="width: 100%; height: 35px;"/></td>
				<td><input id="search3" class="col-md-2" type="text" placeholder="Employer" style="width: 100%; height: 35px;"/></td>
				<td><input id="search4" class="col-md-2" type="text" placeholder="Department" style="width: 100%; height: 35px;"/></td>
			</tr>
	    	<tr>
	    		<th style="border: 1px solid #00FFFF;">Position</th>
	    		<th style="border: 1px solid #00FFFF;">Location</th>
	    		<th style="border: 1px solid #00FFFF;">Employer</th>
	    		<th style="border: 1px solid #00FFFF;">Department</th>
	    	</tr>
	    	</thead>
	    	<tbody>
		    	<c:forEach var = "row" items = "${result.rows}">
		    	<tr>
		    		<td style="border: 1px solid #00FFFF;"><a class="linkButton" href="JobCRUD?action=showJob&jobID=${row.job_id}"><c:out value="${row.job_title}"/></a></td>
		    		<td style="border: 1px solid #00FFFF;">${row.job_location}</td>
		    		<td style="border: 1px solid #00FFFF;">${row.employer}</td>
		    		<td style="border: 1px solid #00FFFF;">${row.specialty}</td>
		    	</tr>
		    	</c:forEach>
	    	</tbody>
	    </table>
    </div>
<div class="theFooter">
	<h5>N. G.</h5>
	<h5>Alumni</h5>
	<h5>2022</h5>
</div>
</body>
</html>