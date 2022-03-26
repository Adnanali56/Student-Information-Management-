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
        if(session.getAttribute("username")==null || session.getAttribute("user_type").equals("student")){
            response.sendRedirect("index.html");
        }
        
        %>
    
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top py-3 zindex-fixed" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="facultyHomePage.jsp">S I M S</a>
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
    <img class="card-img-top" src="images/teachercase.jpg" alt="Profile">
      <div class="card-body text-center">
        <h5 class="card-title">Profile</h5>
        <p class="card-text text-center">A teacher can view his/her personal details , and information related to academia </p>
      </div>
      <div class="card-footer">
      <a href="facultyProfile" class="btn btn-warning">Go to Profile</a>
      </div>
    </div>
  </div>
  
 
  <div class="col">
  <div class="card border-dark mb-3 h-100 text-center">
  <img class="card-img-top" src="images/search.jpg" alt="Search Students">
    <div class="card-body text-center">
      <h5 class="card-title">Search A Student</h5>
      <p class="card-text text-center">To search a student by his roll no and view his details</p>
    </div>
    <div class="card-footer">
    <a href="SearchStudentProfile.jsp" class="btn btn-warning">Search</a>
    </div>
  </div>
</div>
<div class="col">
<div class="card border-dark mb-3 h-100 text-center">
<img class="card-img-top" src="images/update.jpg" alt="Update">
  <div class="card-body text-center">
    <h5 class="card-title">Update Student Details</h5>
    <p class="card-text text-center">To update details of existing students like their name, roll-no, email-id, etc. Update thier marks or even attendance</p>
  </div>
  <div class="card-footer">
  <a href="UpdateStudentSearch.jsp" class="btn btn-warning">Update</a>
  </div>
</div>
</div>
   
<div class="col">
<div class="card border-dark mb-3 h-100 text-center">
<img class="card-img-top" src="images/perf.jpg" alt="Class Performance">
  <div class="card-body text-center">
    <h5 class="card-title">Class Performance</h5>
    <p class="card-text text-center">To See the performance of the class overall</p>
  </div>
  <div class="card-footer">
  <a href="cperf" class="btn btn-warning">See Performance</a>
  </div>
</div>
</div>


<div class="col">
<div class="card border-dark mb-3 h-100 text-center">
<img class="card-img-top" src="images/attendance.jpg" alt="Class Attendance">
  <div class="card-body text-center">
    <h5 class="card-title">Class Attendance</h5>
    <p class="card-text text-center">To See the attendance of each student of the class</p>
  </div>
  <div class="card-footer">
  <a href="fattendance" class="btn btn-warning">See Attendance</a>
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