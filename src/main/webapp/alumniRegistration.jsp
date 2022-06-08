<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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
			margin-top: 50px;
			margin-bottom: 50px;
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

	input[type="file"] {
	  margin-bottom: 5px;
	}
	
	input[type="text"] {
	  margin-bottom: 5px;
	  height: 40px;
	}

	input[type="password"] {
	  margin-bottom: 10px;
	  height: 40px;
	}
	
	select{
	  margin-bottom: 5px;
	  height: 40px;
	}
	
	.center {
	  display: block;
	  margin-left: auto;
	  margin-right: auto;
	  width: 50%;
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

<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/alumni_1"
         user = "root"  password = "admin"/>
         <sql:query dataSource = "${snapshot}" var = "result">
        	SELECT * from specialties;
      	</sql:query>
      	
<div class="pageContent">
	<form id="registrationForm" action="AlumniCRUD?action=registerAlumni" method="post" class="form-signin" autocomplete="off" enctype="multipart/form-data">       
        <h2 style = "margin-bottom: 20px; text-align: center;"class="form-signin-heading">Alumni Registration</h2>

        <img id="blah" style="margin-bottom: 2px;" class="center"/>
        
        <input type="text" class="form-control" name="firstname" placeholder="Name" />
        
        <input type="text" class="form-control" name="lastname" placeholder="Family name" />
        
	    <input type="file" name="picture" class="form-control" id="formFile"/>
        
        <select  class="form-select" aria-label="Default select example" name="classOf">
            <option disabled="disabled" selected="selected">Class</option>
            <option value="2022">2022</option>
            <option value="2021">2021</option>
            <option value="2020">2020</option>
        </select>
        
        <select class="form-select" aria-label="Default select example" name="specialty">
            <option disabled="disabled" selected="selected">Specialty</option>
          <c:forEach var = "row" items = "${result.rows}">
              <option style="max-width: 100px;" class="form-select" value="${row.specialty_id}"><c:out value = "${row.specialty}"/></option>
           </c:forEach>
        </select>
        
        <input type="text" class="form-control" name="employer" placeholder="Workplace" />
        
        <input type="text" class="form-control" name="position" placeholder="Position" />
        
        <input type="text" class="form-control" name="email" placeholder="Email" />
        
        <input type="text" class="form-control" name="number" placeholder="Phone number" />
        
        <input id="userName" type="text" class="form-control" name="username" placeholder="Username" />
        
        <input type="password" class="form-control" name="password" placeholder="Password"/>      
        
        <button style="margin-top: 10px;width: 100%; background-color: #00FFFF;" class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
	</form>
</div>
<div class="theFooter">
	<h5>N. G.</h5>
	<h5>Alumni</h5>
	<h5>2022</h5>
</div>
</body>
</html>