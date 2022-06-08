<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    <%
	    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if(request.getSession().getAttribute("userType") == null) response.sendRedirect(request.getContextPath() + "/index.jsp");
	    if(request.getSession().getAttribute("userType") == "admin") response.sendRedirect(request.getContextPath() + "/admin/home.jsp");
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
    <sql:query dataSource = "${snapshot}" var = "resultNewAlumni">
		select * from alumnis where approved = 1 and alumni_id != <%=request.getSession().getAttribute("userID") %> limit 5
    </sql:query>
    
<div class="pageContent container-fluid" style="padding: 20px 20px;">
	<div class="row" >
			<div class="col-md-5">
				<a class="linkButton" href="users.jsp" style="font-size: 20px;">New Alumni Users</a>
				<table id="table1" style="width: 100%; font-size: 20px;">
				<c:forEach var = "row" items = "${resultNewAlumni.rows}">
					<tr>
						<td><c:out value="${row.first_name} ${row.last_name}"/></td>
						<td>${row.employer}</td>
						<td><c:out value="${row.position}"/></td>
					</tr>
				</c:forEach>
				</table>
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