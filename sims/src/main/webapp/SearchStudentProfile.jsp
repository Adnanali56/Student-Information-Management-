<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

 <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<style>
body {
	background-color: #4158D0;
	background-image: linear-gradient(43deg, #4158D0 0%, #C850C0 46%, #FFCC70 100%);
	background-attachment:fixed;
}
</style>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="studentHomePage.jsp">S I M S</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse " id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                       <!-- <li class="nav-item"><a class="nav-link" href="sprofile">Profile</a></li>
                        <li class="nav-item"><a class="nav-link" href="sattendance.jsp">Attendance</a></li>-->
                        <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.html#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
 <div class="container my-2">       
<div class="card border-dark mb-3 h-100 text-center">
  <div class="card-header">
    SEARCH STUDENT PROFILE
  </div>
    <form class="form-inline " action="search">
    <div class="card-body w-60">
    
    <input class="form-control mr-sm-2" type="search" placeholder="ROLL NO" aria-label="Search" name="searchText">
  
  </div>
  <div class="card-footer">
  <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
  </div>
  </form>
</div>
</div>    
                
<script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>