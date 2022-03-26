<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
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
<style>
    body {
    	background-color: #4158D0;
    	background-image: linear-gradient(43deg, #4158D0 0%, #C850C0 46%, #FFCC70 100%);
    	background-attachment:fixed;
}
.outer-div
{
     padding: 100px;
}

.container-contact1-form-btn{
    padding: 70px;
}

.contact1-form-btn{
    background-color: #ff001900 ;
}
.btn-warning{
    margin-top: 10px;
}

</style>
 <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if(session.getAttribute("username")==null || session.getAttribute("user_type").equals("faculty")){
            response.sendRedirect("index.html");
        }
        if(session.getAttribute("attendance")!=null)
        if(session.getAttribute("attendance").equals("passed"))
        {
        	out.println("<script>alert(\"attendance submitted successfully\");</script>");
        }
        
        %>
    
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="studentHomePage.jsp">S I M S</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.html#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
<div class="outer-div">
<div class="container">
    <h3><center></center></h3>
    <div class="row row-cols-1 row-cols-md-3 g-4">
  <div class="col">
    <div class="card border-dark mb-3 h-100 text-center">
    <img class="card-img-top" src="images/profile.jpg" alt="See Profile">
      <div class="card-body text-center">
        <h5 class="card-title">Profile</h5>
        <p class="card-text text-center">See your profile containing your personal details and Academic details like monthly attendance and marks of each subject of current semester</p>
      </div>
      <div class="card-footer">
      <a href="studentProfile" class="btn btn-warning">Go to Profile</a>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card border-dark mb-3 h-100 text-center">
        <img class="card-img-top" src="images/attendance.jpg" alt="Give attendance here">
      <div class="card-body text-center">
        <h5 class="card-title">Attendance</h5>
        <p class="card-text text-left">To mark your attendance for the current day please go to this page.</p>
      </div>
      <div class="card-footer">
      <a href="StudentSubmitAttendance.jsp" class="btn btn-warning">Give Attendance</a>
      </div>
    </div>
  </div>
</div>

</div>
</div>

<script src="./js/bootstrap.bundle.min.js"></script>
    <script src="./js/bootstrap.js"></script>
</body>
</html>