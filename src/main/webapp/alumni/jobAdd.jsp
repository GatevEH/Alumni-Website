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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/additional-methods.js"></script>
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
		
				.wrapper {	
		margin-top: 50px;
		margin-bottom: 50px;
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
    				<a class="theButtons" href="jobs.jsp">Jobs</a>
					<a class="theButtons" href="users.jsp">Users</a>
					<a class="theButtons" href="profile.jsp">My Profile</a>    	
    			</nav>    	
		    </div>
		</div>
</div>
    <div class="pageContent" style="width: 80%; min-height: 447px; margin: 0 auto;">
		<h2>Publish Job Offer</h2>
		<div class="wrapper">
	    <form id="jobForm" action="JobCRUD?action=addJob" method="post" class="form-signin" autocomplete="off">       
	      <input type="hidden" name="alumniID" value="<%=request.getSession().getAttribute("userID")%>"/>
	      <input type="text" class="form-control" name="title" placeholder="Position"/>
	      <input type="text" class="form-control" name="location" placeholder="Location"/>
	      <textarea wrap="hard" style="margin-bottom: 10px;" class="form-control" placeholder="Description" name="description"></textarea>      
	      <button style="width: 100%; background-color: #1C4269;" class="btn btn-lg btn-primary btn-block" type="submit">Publish</button>   
	    </form>
	  </div>
    </div>
<div class="theFooter">
	<h5>N. G.</h5>
	<h5>Alumni</h5>
	<h5>2022</h5>
</div>
</body>
<script>

$.validator.addMethod( "locationChecker", function( value, element ) {
    return this.optional( element ) || /^[a-zA-Z ]+$/i.test( value );
}, "The field can contain only letters!" );

$(document).ready(function() {
    $("#jobForm").validate({
    rules: {
    	title: {
    		required: true,
    		minlength: 4,
    		maxlength: 40
    	},
    	
    	location: {
    		required: true,
    		locationChecker: true,
    		minlength: 2,
    		maxlength: 20
    	},
    	
    	description: {
    		required: true, 
    		minlength: 10,
    		maxlength: 3000
    	}
    },
    messages: {
    	title: {
    		required: "You have to enter a position name!",
    		minlength: "The field must contain at least 3 symbols!",
    		maxlength: "The field must contain less than 40 symbols!"
    	},
    	location: {
    		required: "You have to enter a location!",
    		minlength: "The field must contain at least 2 symbols!",
    		maxlength: "The field must contain less than 20 symbols!"
    	},
    	description: {
    		required: "You have to enter a job description!",
    		minlength: "The field must contain at least 10 symbols!",
    		maxlength: "The field must contain less than 3000 symbols!"
    	}
	}
    });
});
</script>
</html>