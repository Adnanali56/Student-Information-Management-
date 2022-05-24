<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Student Profile</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5 ">
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
        <form action="supdate">
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
                                            <div class="row">
                                                <div class="form-outline">
                                                    <input type="hidden" class="form-control form-control-lg" name="prev_roll_no" value="${stud.getRoll_no()}">
                                                    <input type="text" class="form-control form-control-lg" name="roll_no" value="${stud.getRoll_no()}">
                                                    <label class="form-label" for="form3Example1n">Roll NO</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <input type="text" name="first_name" class="form-control form-control-lg" value="${stud.getFirst_name()}">
                                                        <label class="form-label" for="form3Example1m">First name</label>	            		  
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <input type="text" id="form3Example1n" class="form-control form-control-lg" name="last_name" value="${stud.getLast_name()}">
                                                        <label class="form-label" for="form3Example1n">Last name</label>
                                                    </div>
                                                </div>
                                            </div>
                    
                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <input type="text" id="form3Example1m1" class="form-control form-control-lg" name="mother_name" value="${stud.getMother_name()}">
                                                        <label class="form-label" for="form3Example1m1">Mother's name</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <input type="text" id="form3Example1n1" class="form-control form-control-lg" name="father_name" value="${stud.getFather_name()}">
                                                        <label class="form-label" for="form3Example1n1">Father's name</label>	            		
                                                    </div>
                                                </div>
                                            </div>
                
                                            <div class="form-outline mb-4">
                                                <input type="text" id="form3Example8" class="form-control form-control-lg" name="address" value="${stud.getAddress()}">
                                                <label class="form-label" for="form3Example8">Address</label>
                                            </div>
                
                                            <div class="form-outline mb-4">
                                                <input type="text" id="form3Example8" class="form-control form-control-lg" name="gender" value="${stud.getGender()}">
                                                <label class="form-label" for="form3Example9">Gender</label>
                                            </div>
                
                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                
                                                    <div class="form-outline mb-4">
                                                        <input type="text" id="form3Example90" class="form-control form-control-lg" name="state" value="${stud.getState()}">
                                                        <label class="form-label" for="form3Example9">STATE</label>
                                                    </div>
                
                                                </div>
                                                <div class="col-md-6 mb-4">
                
                                                    <div class="form-outline mb-4">
                                                        <input type="text" id="form3Example90" class="form-control form-control-lg" name="city" value="${stud.getCity()}">
                                                        <label class="form-label" for="form3Example9">CITY</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-6">
                
                
                                            <div class="form-outline mb-4">
                                                <input type="date" id="form3Example9" class="form-control form-control-lg" name="dob" value="${stud.getDob()}">
                                                <label class="form-label" for="form3Example9">DOB</label>
                                            </div>
                
                                            <div class="form-outline mb-4">
                                                <input type="hidden" id="form3Example90" class="form-control form-control-lg" name="prev_pincode" value="${stud.getPincode()}">
                                                <input type="text" id="form3Example90" class="form-control form-control-lg" name="pincode" value="${stud.getPincode()}">
                                                <label class="form-label" for="form3Example90">Pincode</label>
                                            </div>
                
                                            <div class="form-outline mb-4">
                                                <input type="text" id="form3Example99" class="form-control form-control-lg" name="branch" value="${stud.getBranch()}">
                                                <label class="form-label" for="form3Example99">Branch</label>
                                            </div>
                                            <div class="form-outline mb-4">
                                                <input type="text" id="form3Example99" class="form-control form-control-lg" name="year_sem" value="${stud.getYear_sem()}">
                                                <label class="form-label" for="form3Example99">Year/Sem</label>
                                            </div>
                                
                                            <div class="form-outline mb-4">
                                                <input type="text" id="form3Example97" class="form-control form-control-lg" name="email_id" value="${stud.getEmail_id()}">
                                                <label class="form-label" for="form3Example97">Email ID</label>
                                            </div>
                
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="container p-0 " style="background-color:#fff;color:#000;">
            <div class="card">
                <div class="card-body p-md-5 " style="color:#000;" >
                    <h3 class="mb-5 text-uppercase " >Marks</h3>
                    <table class="table table-responsive-sm table-hover table-striped table-bordered border-dark">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">S.NO.</th>
                                <th scope="col">Subject</th>
                                <th scope="col">Marks</th>
                                <th scope="col">Grade</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="i" begin="0" end="4">
                                <tr> 
                                    <td> ${i+1}</td> 
                                    <td>subject-${i+1} </td> 
                                    <td><input type="number" name="sub${i+1}" value="${marksList[i]}" ></td> 
                                    <td>${gradeList[i]}</td> 
                                </tr>   
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <br><br>
        <div class="container p-0" style="background-color:#fff;color:#000;">
            <div class="card">
                <div class="card-body p-md-5 " style="color:#000;">
                    <h3 class=" mb-5 text-uppercase" >Attendance of the Year</h3>
                    <table class="table table-responsive table-hover table-striped table-bordered border-dark">
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
                                    <td> ${i+1}</td> 
                                    <td>${month_names[i*4]}</td> 
                                    <td><input type="number" name="m${i*4+1}" value="${Attendance[i*4]}" ></td> 
                                    <td>${month_names[i*4+1]}</td> 
                                    <td><input type="number" name="m${i*4+2}" value="${Attendance[i*4+1]}" ></td> 
                                    <td>${month_names[i*4+2]}</td> 
                                    <td><input type="number" name="m${i*4+3}" value="${Attendance[i*4+2]}" ></td> 
                                    <td>${month_names[i*4+3]}</td> 
                                    <td><input type="number" name="m${i*4+4}" value="${Attendance[i*4+3]}" ></td> 
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <br>
        <div class="container p-0">
            <div class="card">
                <div class="card-body d-flex justify-content-center">
                    <input type="submit" class="btn btn-danger">
                </div>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    
    </body>
</html>