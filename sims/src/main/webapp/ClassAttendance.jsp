<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Students' List</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top py-3 zindex-fixed" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="facultyHomePage.jsp">S I M S</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                          <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.html#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="jumbotron" style="background: url('images/dba.jpg') no-repeat;background-size: cover;height: 300px;"></div>
        <div class="container">
            <div class="card">
                <div class="card-header text-center"><h2 class="fw-bolder display-5">Class Attendance</h2></div>
                <div class="card-body" style="background-color:#3498DB;color:#ffffff;">
                    <table class="table table-hover">
                        <thead>
                              <tr>
                                <th scope="col">S.NO.</th>
                                <th scope="col">RollNo</th>
                                <th scope="col">Jan</th>
                                <th scope="col">Feb</th>
                                <th scope="col">Mar</th>
                                <th scope="col">Apr</th>
                                <th scope="col">May</th>
                                <th scope="col">Jun</th>
                                <th scope="col">Jul</th>
                                <th scope="col">Aug</th>
                                <th scope="col">Sep</th>
                                <th scope="col">Oct</th>
                                <th scope="col">Nov</th>
                                <th scope="col">Dec</th>
                              </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="i" begin="1" end="${classAtt.size()}">
                                    <tr> 
                                        <td>${i}</td>
                                        <c:forEach var="j" begin="0" end="12">
                                            <td> ${classAtt.get(i).get(j)}</td>
                                        </c:forEach> 
                                    </tr>
                                </c:forEach>
                            </tbody>
                            </table>
                        </div></div></div></div>
                        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>