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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
		select * from alumnis, specialties where fk_specialty = specialty_id and approved = 1
    </sql:query>
    
<div class="pageContent container-fluid" style="padding: 20px 20px;">
	<h2>Alumni	</h2>
	  <table id="table" class="table table-striped" style=" font-size: 18px;border: 1px solid #1C4269; border-radius: 5px; ">
         <thead>
        <tr>
			<td><input id="search1" class="col-md-2" type="text" placeholder="Name" style="width: 100%; height: 35px;"/></td>
			<td><input id="search2" class="col-md-2" type="text" placeholder="Class" style="width: 100%; height: 35px;"/></td>
			<td><input id="search3" class="col-md-2" type="text" placeholder="Specialty" style="width: 100%; height: 35px;"/></td>
			<td><input id="search4" class="col-md-2" type="text" placeholder="Employer" style="width: 100%; height: 35px;"/></td>
		</tr>
       	<tr>
         	<th style="border: 1px solid #1C4269;">Name</th>
         	<th style="border: 1px solid #1C4269;">Class</th>
         	<th style="border: 1px solid #1C4269;">Specialty</th>
         	<th style="border: 1px solid #1C4269;">Employer</th>
         </tr>
         </thead>
         <tbody>
         <c:forEach var = "row" items = "${resultAlumni.rows}">
         	<tr>
         		<td style="border: 1px solid #1C4269;"><a class="linkButton" href="AlumniCRUD?action=showAlumni&userID=${row.alumni_id}"><c:out value="${row.first_name} ${row.last_name}"/></a></td>
         		<td style="border: 1px solid #1C4269;"><c:out value="${row.class_of}"/></td>
         		<td style="border: 1px solid #1C4269;"><c:out value="${row.specialty}"/></td>
         		<td style="border: 1px solid #1C4269;"><c:out value="${row.employer}"/></td>
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
<script>
var $rows = $('#table tbody tr');
$('#search1, #search2, #search3, #search4').on('input', function() {
    var val1 = $.trim($('#search1').val()).replace(/ +/g, ' ').toLowerCase();
    var val2 = $.trim($('#search2').val()).replace(/ +/g, ' ').toLowerCase();
	var val3 = $.trim($('#search3').val()).replace(/ +/g, ' ').toLowerCase();
	var val4 = $.trim($('#search4').val()).replace(/ +/g, ' ').toLowerCase();
    
    $rows.show().filter(function() {
        var text1 = $(this).find('td:nth-child(1)').text().replace(/\s+/g, ' ').toLowerCase();
        var text2 = $(this).find('td:nth-child(2)').text().replace(/\s+/g, ' ').toLowerCase();
		var text3 = $(this).find('td:nth-child(3)').text().replace(/\s+/g, ' ').toLowerCase();
		var text4 = $(this).find('td:nth-child(4)').text().replace(/\s+/g, ' ').toLowerCase();
        return !~text1.indexOf(val1) || !~text2.indexOf(val2) || !~text3.indexOf(val3) || !~text4.indexOf(val4);;
    }).hide();
});
</script>
</html>