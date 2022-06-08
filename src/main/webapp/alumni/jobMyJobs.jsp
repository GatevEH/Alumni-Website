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
			margin-bottom: 10px;
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
        SELECT * from jobs where fk_alumni = <%=request.getSession().getAttribute("userID")%>
    </sql:query>
    
    <div style="padding: 20px 20px; min-height: 68vh;position: relative;">
    <h2>My Job Offers</h2>
	    <div>
    		<a class="addButton" href="jobAdd.jsp">Add job offer</a>
    	</div>
	    <div>
	    <table class="table table-striped" id="mainTable" style="font-size: 20px;border: 1px solid #1C4269; border-radius: 5px;">
	    	<tr>
	    		<th style="border: 1px solid #1C4269;">Position</th>
	    		<th style="border: 1px solid #1C4269;">Location</th>
	    		<th style="border: 1px solid #1C4269;"></th>
	    		<th style="border: 1px solid #1C4269;"></th>
	    	</tr>
	    	<c:forEach var = "row" items = "${result.rows}">
	    	<tr>
	    		<td style="border: 1px solid #1C4269;"><a class="linkButton" href="JobCRUD?action=showJob&jobID=${row.job_id}"><c:out value="${row.job_title}"></c:out></a></td>
	    		<td style="border: 1px solid #1C4269;"><c:out value="${row.job_location}"/></td>
	    		<td style="border: 1px solid #1C4269; text-align: center;"><a class="editButton" href="JobCRUD?action=showJobToEdit&jobID=${row.job_id}">Edit</a></td>
	    		<td style="border: 1px solid #1C4269; text-align: center;"><a class="deleteButton" href="JobCRUD?action=deleteJob&jobID=${row.job_id}">Delete</a></td>
	    	</tr>
	    	</c:forEach>
	    </table>
	    </div>
    </div>
<div class="theFooter">
	<h5>N. G.</h5>
	<h5>Alumni</h5>
	<h5>2022</h5>
</div>
</body>
</html>