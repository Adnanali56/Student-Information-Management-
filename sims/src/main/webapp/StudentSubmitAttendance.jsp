<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
      <head>
	<title>Student Attendance</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<style>
    body {
    background-color: #009bff;
}
.outer-div
{
     padding: 100px;
}

.container-contact1-form-btn{
    padding: 70px;
}

.contact1-form-btn{
    background-color: #000fff ;
}
.btn-warning{
    margin-top: 10px;
}

</style>
 
</head>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if(session.getAttribute("username")==null || session.getAttribute("user_type").equals("faculty")){
            response.sendRedirect("index.html");
        }
        if(session.getAttribute("details")!=null)
        if(session.getAttribute("details").equals("invalid"))
        {
        	out.println("<script>alert(\"Invalid details\");</script>");
        }
        if(session.getAttribute("attendance")!=null)
        if(session.getAttribute("attendance").equals("failed"))
        {
        	out.println("<script>alert(\"attendance already given. Cannot be given more than once in the same day\");</script>");
        }
        
        %>
    
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="studentHomePage.jsp">S I M S</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse  d-flex justify-content-end" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.html#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
  

	<div class="contact1">
		<div class="container-contact1">
			<div class="contact1-pic js-tilt" data-tilt>
				<img src="images/DB.jpg" alt="IMG">
			</div>

			<form id="attForm" class="contact1-form validate-form" action="sattendance">
				<span class="contact1-form-title">
					Give Attendance
				</span>

				<div class="wrap-input1 validate-input" data-validate = "Roll NO is required">
					<input class="input1" type="text" name="suser" placeholder="Enter Roll NO">
					<span class="shadow-input1"></span>
				</div>

				<div class="wrap-input1 validate-input" data-validate = "Password is required">
					<input class="input1" type="password" name="spass" placeholder="Password">
					<span class="shadow-input1"></span>
				</div>
				<input type="hidden" name="dateTime" id="dt">
				<input type="hidden" name="month" id="mt">
				<div class="container-contact1-form-btn">
					<button class="contact1-form-btn" onClick="sendFormData();">
						<span>
							Submit
							<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
						</span>
					</button>
				</div>
			</form>
		</div>
	</div>




<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	

<!--===============================================================================================-->
	<script src="js/main.js"></script>        
	<script src="js/submitForm.js"></script>
        </body>
</html>

