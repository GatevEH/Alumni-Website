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
    <sql:query dataSource = "${snapshot}" var = "resultAlumni">
		select * from alumnis, specialties where fk_specialty = specialty_id and approved = 0 and unapproved = 0
    </sql:query>
    
<div class="pageContent container-fluid" style="padding: 20px 20px;">
	<h2>Alumni approval requests</h2>
	  <table id="mainTable" class="table table-striped" style=" font-size: 18px;border: 1px solid #00FFFF; border-radius: 5px; text-align:center; ">
         <thead>
        <tr>
			<td><input id="search1" class="col-md-2" type="text" placeholder="Name" style="width: 100%; height: 35px;"/></td>
			<td><input id="search2" class="col-md-2" type="text" placeholder="Class" style="width: 100%; height: 35px;"/></td>
			<td><input id="search3" class="col-md-2" type="text" placeholder="Specialty" style="width: 100%; height: 35px;"/></td>
			<td><input id="search4" class="col-md-2" type="text" placeholder="Employer" style="width: 100%; height: 35px;"/></td>
		</tr>
       	<tr>
         	<th style="border: 1px solid #00FFFF;">Name</th>
         	<th style="border: 1px solid #00FFFF;">Class</th>
         	<th style="border: 1px solid #00FFFF;">Specialty</th>
         	<th style="border: 1px solid #00FFFF;">Employer</th>
         </tr>
         </thead>
         <tbody>
         <c:forEach var = "row" items = "${resultAlumni.rows}">
         	<tr>
         		<td style="border: 1px solid #00FFFF;"><a class="linkButton" href="AlumniCRUD?action=showUnapprovedAlumni&userID=${row.alumni_id}">${row.first_name} ${row.last_name}</a></td>
         		<td style="border: 1px solid #00FFFF;">${row.class_of}</td>
         		<td style="border: 1px solid #00FFFF;">${row.specialty}</td>
         		<td style="border: 1px solid #00FFFF;">${row.employer}</td>
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