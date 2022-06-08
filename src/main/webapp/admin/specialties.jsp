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
    <sql:query dataSource = "${snapshot}" var = "resultSpecialties">
		select * from specialties 
    </sql:query>
    
<div class="pageContent container-fluid" style="padding: 20px 20px;">
	<a class="addButton" href="#">Add specialty</a>
		
		<div class="wrapper"style="display: none;">
		<form id="specialtyForm" action="SpecialtyCRUD?action=addSpecialty" method="post" class="form-signin" autocomplete="off">
		<table class="container1" style="width: 30%;">
		<tr><td><input type="text" class="form-control" name="specName" placeholder="Specialty"/></td>
		</table>
		<button style="width: 30%; background-color: #1C4269; color: white;" class="btn btn-lg" type="submit">Add</button>
		</form>
		</div>
		<table class="table table-striped" id="mainTable" style="margin-top:10px;font-size: 20px;border: 1px solid #1C4269; width: 75%;">
			<tr>
				<th style="border: 1px solid #1C4269;">Specialty</th>
				<th style="border: 1px solid #1C4269;"></th>
			</tr>
			<c:forEach var = "row" items = "${resultSpecialties.rows}">
			<tr>
				<td style="border: 1px solid #1C4269;">${row.specialty}</td>
				<td style="border: 1px solid #1C4269; text-align: center;"><a class="editButton" href="SpecialtyCRUD?action=showSpecialtyToEdit&specialtyID=${row.specialty_id}">Edit</a></td>
			</tr>
			</c:forEach>
		</table>
    </div>
<div class="theFooter">
	<h5>N. G.</h5>
	<h5>Alumni</h5>
	<h5>2022</h5>
</div>
</body>
<script>
        $(document).ready(function() {
            $(".addButton").click(function(){
                $(".wrapper").toggle(function(){
                    if($(".wrapper").is(":visible")){
                    	$('.addButton').css("background-color","rgb(255, 28, 28)");
                    	$('.addButton').text('Hide');
                    } else {
                    	$('.addButton').css("background-color","#7CFC00");
                    	$('.addButton').text('Add specialty');
                    }
                });
            });
       
            
            $('#mainTable').each(function() {
                if ( $(this).find('td').length < 1 || $(this).find('td').is(':empty') ) {
                   $(this).hide();
                }
            });
        });
        
        $(document).ready(function() {
  		  document.getElementsByTagName("html")[0].style.visibility = "visible";
  		});
        
        $.validator.addMethod( "specialtyNameChecker", function( value, element ) {
            return this.optional( element ) || /^[a-zA-Z,. ]+$/i.test( value );
        }, "The field can only contain letters, dots and commas!" );
        
        $(document).ready(function() {
                $("#specialtyForm").validate({
                rules: {
                	specName: {
                		required: true,
                		specialtyNameChecker: true,
                		minlength: 4,
                		maxlength: 100
                	},
                },
                messages: {
                	specName: {
                		required: "You have to add a name!",
                		minlength: "The field must contain at least 4 symbols!",
                		maxlength: "The field must contain less than 100 symbols!"
                	}, 
			}});
         });
    </script>
</html>