<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Student Profile</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
               body {
              background-color: #FFFFFF;
           background-image: linear-gradient(135deg, #FFFFFF 0%, #6284FF 50%, #FF0000 100%);
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
    </head>
    <body>
        <c:set var="marksList" scope="session" value="${marksList}"/>
        <c:set var="gradeList" scope="session" value="${gradeList}"/>
        <c:set var="Attendance" scope="session" value="${stud.getAttendance()}"/>      
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top py-3 " id="mainNav">
                        <div class="container px-4 px-lg-5 justify-content-between">
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
        <div class="jumbotron" style="background: url('images/dba.jpg') no-repeat;background-size: cover;height: 300px;"></div>
            <section class="h-200 ">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col">
                            <div class="card card-registration my-4">
                                <div class="card-body p-md-5 text-black">
                                    <h3 class="mb-5 text-uppercase">Personal Details</h3>
                
                                    <div class="row g-0">
                                        <div class="col-xl-6">
                                            <div class="form-outline">
                                                <label class="form-label" for="form3Example1n">Roll NO</label>
                                                <p class="border border-dark rounded p-2">${stud.getRoll_no()}</p>
                                            </div>
                    
                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <label class="form-label" for="form3Example1m">First name</label>
                                                        <p class="border border-dark rounded p-2">${stud.getFirst_name()}</p>  
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <label class="form-label" for="form3Example1n">Last name</label>
                                                        <p class="border border-dark rounded p-2">${stud.getLast_name()}</p>
                                                    </div>
                                                </div>
                                            </div>
                        
                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <label class="form-label" for="form3Example1m1">Mother's name</label>
                                                        <p class="border border-dark rounded p-2">${stud.getMother_name()}</p>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <label class="form-label" for="form3Example1n1">Father's name</label>
                                                        <p class="border border-dark rounded p-2">${stud.getFather_name()}</p>
                                                    </div>
                                                </div>
                                            </div>
                        
                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="form3Example8">Address</label>
                                                <p class="border border-dark rounded p-2">${stud.getAddress()}</p>
                                            </div>
                        
                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="form3Example9">Gender</label>
                                                <p class="border border-dark rounded p-2">${stud.getGender()}</p>
                                            </div>
                        
                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                        
                                                    <div class="form-outline mb-4">
                                                        <label class="form-label" for="form3Example9">STATE</label>
                                                        <p class="border border-dark rounded p-2">${stud.getState()}</p>
                                                    </div>
                        
                                                </div>
                                                <div class="col-md-6 mb-4">
                        
                                                    <div class="form-outline mb-4">
                                                        <label class="form-label" for="form3Example9">CITY</label>
                                                        <p class="border border-dark rounded p-2">${stud.getCity()}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-6">
                        
                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="form3Example9">DOB</label>
                                                <p class="border border-dark rounded p-2">${stud.getDob()}</p>
                                            </div>
                        
                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="form3Example90">Pincode</label>
                                                <p class="border border-dark rounded p-2">${stud.getPincode()}</p>
                                            </div>
                        
                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="form3Example99">Branch</label>
                                                <p class="border border-dark rounded p-2">${stud.getBranch()}</p>
                                            </div>
                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="form3Example99">Year/Sem</label>
                                                <p class="border border-dark rounded p-2">${stud.getYear_sem()}</p>
                                            </div>
                                        
                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="form3Example97">Email ID</label>
                                                <p class="border border-dark rounded p-2">${stud.getEmail_id()}</p>
                                            </div>
                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        
       
 <div class="container p-0" style="background-color:#fff;color:#000;">
                        <div class="card">
                     <div class="card-body p-md-5">
                       <h3 class="mb-5 text-uppercase">Marks</h3>
                       <table class="table table-responsive-sm table-hover table-striped table-bordered border-dark">
                        <thead class=" table-dark">
                                <tr>
                                 <th scope="col">S.NO.</th>
                                 <th scope="col">Subject</th>
                                 <th scope="col">Marks</th>
                                 <th scope="col">Grade</th>
                                </tr>
                             </thead>
                            <tbody>
                            <c:forEach var="i" begin="0" end="4">
                                <tr> <td>${i+1}</td>
                                    <td>subject-${i+1} </td> 
                                    <td>${marksList[i]}</td> 
                                    <td>${gradeList[i]}</td> 
                                </tr>
                            </c:forEach>
                            </tbody></table>
                        </div></div></div><br><br> 
                         <div class="container p-0">
                            <div class="card" style="background-color:#fff;color:#000;">
                                <div class="card-body p-md-5" >
                                    <h3 class=" mb-5 text-uppercase" >Attendance of the Year</h3>
                                    <table class="table table-responsive-sm table-hover table-striped table-bordered border-dark">
                                        <thead class="table-dark">
                                             <tr>
                                               <th scope="col">S.NO.</th>
                                               <th scope="col">Month</th>
                                               <th scope="col">Present</th>
                                               <th scope="col">Month</th>
                                               <th scope="col">Present</th>
                                               <th scope="col">Month</th>
                                               <th scope="col">Present</th>
                                               <th scope="col">Month</th>
                                               <th scope="col">Present</th>
                                             </tr>
                                           </thead>
                                            <tbody>
                                            <c:forEach var="i" begin="0" end="2">
                                                <tr> 
                                                    <td> ${(i+1)}</td> 
                                                    <td>${month_names[i*4]} </td> 
                                                    <td>${Attendance[i*4]}</td> 
                                                    <td>${month_names[i*4+1]}</td> 
                                                    <td>${Attendance[i*4+1]}</td> 
                                                    <td>${month_names[i*4+2]}</td> 
                                                    <td>${Attendance[i*4+2]}</td>
                                                    <td>${month_names[i*4+3]}</td>
                                                    <td>${Attendance[i*4+3]}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody></table>
                                        </div></div></div>               
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>