package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class fupdate {
	@RequestMapping(path="/update")
		public void searchUpdateProfile(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
			Student s=new Student();
	 	   
	 	  
	        try{	
	        	String user=request.getParameter("searchText");
	        	Class.forName("com.mysql.cj.jdbc.Driver");
	        	Connection con=  DriverManager.getConnection("jdbc:mysql://localhost/sims","root","root");
	            String sql="select * from students where roll_no=?";
	            String sql1="select * from course where roll_no=?";
	            String sql2="select * from location where pincode=?";
	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setString(1, user);
	            ResultSet rs =ps.executeQuery();
	            rs.next();
	            
	            s.setRoll_no(rs.getString(1));
	            s.setFirst_name(rs.getString(2));
	            s.setLast_name(rs.getString(3));
	            s.setMother_name(rs.getString(4));
	            s.setFather_name(rs.getString(5));
	            s.setAddress(rs.getString(6));
	            s.setGender(rs.getString(7));
	            s.setEmail_id(rs.getString(8));
	            s.setDob(rs.getDate(9).toString());
	            
	            ps=con.prepareStatement(sql1);
	            ps.setString(1, user);
	            ResultSet rs1=ps.executeQuery();
	            rs1.next();
	            
	            s.setBranch(rs1.getString(3));
	            s.setYear_sem(rs1.getString(4));
	            
	            ps=con.prepareStatement(sql2);
	            ps.setString(1,rs1.getString(2));
	            ResultSet rs2=ps.executeQuery();
	            
	            rs2.next();
	            
	            s.setState(rs2.getString(2));
	            s.setCity(rs2.getString(3));
	            s.setPincode(rs2.getString(1));
	            
	            sql="select * from marks where roll_no=?";
	            ps = con.prepareStatement(sql);
	            ps.setString(1, user);
	            rs =ps.executeQuery();
	            
	           
	            int i=0,marks;
	            int marksList[]=new int[5];
	            char gradeList[]=new char[5];
	            char grade;
	            rs.next();
	            while(i<5){
	            	i++;
	            	marks=rs.getInt(i+1);
	            	if(marks>90) grade='S';
	            	else if(marks>80) grade='A';
	            	else if(marks>70) grade='B';
	            	else if(marks>60) grade='C';
	            	else if(marks>50) grade='D';
	            	else if(marks>40) grade='E';
	            	else  grade='F';
	            	marksList[i-1]=marks;
	           		gradeList[i-1]=grade;
	            }
	      
	            		int tempatt[]=new int[12];
	                    sql="select * from attendance where roll_no=?";
	                    ps = con.prepareStatement(sql);
	                    ps.setString(1, user);
	                    rs =ps.executeQuery();
 
	                    i=0;
	                    String[] month_names= {"January","February","March","April","May","June","July","August","September","October","November","December"};
	                    rs.next();
	                    while(i<3){
	                    	 tempatt[i*4]=rs.getInt(i*4+2);
	                         tempatt[i*4+1]=rs.getInt(i*4+3);
	                         tempatt[i*4+2]=rs.getInt(i*4+4);
	                         tempatt[i*4+3]=rs.getInt(i*4+5);
	                        i++;
	                    }
	                    s.setAttendance(tempatt);      
	                    con.close();
	                    request.setAttribute("gradeList", gradeList);
	                    request.setAttribute("marksList", marksList);
	                    request.setAttribute("stud", s);
	                    request.setAttribute("month_names", month_names);      
	                    
	                    
	                    RequestDispatcher rd=request.getRequestDispatcher("UpdateStudentDetails.jsp");
	                    rd.include(request, response);
	                }catch(Exception e){
	                	request.setAttribute("error", e);
	                    e.printStackTrace();
	                }

	    }
	@RequestMapping(path="/supdate")
	public void UpdateProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		Student s=new Student();
	 	   
	 	  //students,timelog,marks,user_student,loation,couse,attendance
        try{	
        	String user=request.getParameter("prev_roll_no");
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection con=  DriverManager.getConnection("jdbc:mysql://localhost/sims","root","root");
            String sql="update students set roll_no=?,first_name=?, last_name=?,mother_name=?, father_name=?,address=?, gender=?,email_id=?, dob=? where roll_no=?";
            String sql1="update course set roll_no=?, pincode=?, branch=?, year_sem=? where roll_no=?";
            String sql2="update location set pincode=?, state=?, city=? where pincode=?";
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1,request.getParameter("roll_no"));
            ps.setString(2,request.getParameter("first_name"));
            ps.setString(3,request.getParameter("last_name"));
            ps.setString(4,request.getParameter("mother_name"));
            ps.setString(5,request.getParameter("father_name"));
            ps.setString(6,request.getParameter("address"));
            ps.setString(7,request.getParameter("gender"));
            ps.setString(8,request.getParameter("email_id"));
            ps.setString(9,request.getParameter("dob"));
            ps.setString(10, user);
          
            ps.executeUpdate();
          
            
            
            
            ps=con.prepareStatement(sql1);
            ps.setString(1,request.getParameter("roll_no"));
            ps.setString(2,request.getParameter("pincode"));
            ps.setString(3,request.getParameter("branch"));
            ps.setString(4,request.getParameter("year_sem"));
            ps.setString(5, user);
            ps.executeUpdate();
            
            
          
            
            ps=con.prepareStatement(sql2);
            ps.setString(1,request.getParameter("pincode"));
            ps.setString(2,request.getParameter("state"));
            ps.setString(3,request.getParameter("city"));
            ps.setString(4, request.getParameter("prev_pincode"));
            ps.executeUpdate();
            
            sql="update marks set roll_no=?, sub1=?, sub2=?, sub3=?, sub4=?, sub5=? where roll_no=?";
            ps = con.prepareStatement(sql);
            ps.setString(1,request.getParameter("roll_no"));
            ps.setInt(2,Integer.parseInt(request.getParameter("sub1")));
            ps.setInt(3,Integer.parseInt(request.getParameter("sub2")));
            ps.setInt(4,Integer.parseInt(request.getParameter("sub3")));
            ps.setInt(5,Integer.parseInt(request.getParameter("sub4")));
            ps.setInt(6,Integer.parseInt(request.getParameter("sub5")));
            ps.setString(7, user);
            
            ps.executeUpdate();
            
           
            
    		
            sql="update attendance set roll_no=?,  Jan=?, Feb=?, Mar=?, Apr=?, May=?, Jun=?, July=?, Aug=?, Sep=?, Oct=?, Nov=?, Decm=? where roll_no=?";
            ps = con.prepareStatement(sql);
            ps.setString(1,request.getParameter("roll_no"));
            ps.setInt(2,Integer.parseInt(request.getParameter("m1")));
            ps.setInt(3,Integer.parseInt(request.getParameter("m2")));
            ps.setInt(4,Integer.parseInt(request.getParameter("m3")));
            ps.setInt(5,Integer.parseInt(request.getParameter("m4")));
            ps.setInt(6,Integer.parseInt(request.getParameter("m5")));
            ps.setInt(7,Integer.parseInt(request.getParameter("m6")));
            ps.setInt(8,Integer.parseInt(request.getParameter("m7")));
            ps.setInt(9,Integer.parseInt(request.getParameter("m8")));
            ps.setInt(10,Integer.parseInt(request.getParameter("m9")));
            ps.setInt(11,Integer.parseInt(request.getParameter("m10")));
            ps.setInt(12,Integer.parseInt(request.getParameter("m11")));
            ps.setInt(13,Integer.parseInt(request.getParameter("m12")));
            ps.setString(14, user);
            ps.executeUpdate();
            
            sql="update user_student set uname=? where uname=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, request.getParameter("roll_no"));
            ps.setString(2, user);
            ps.executeUpdate();
            
            sql="update timelog set roll_no=? where roll_no=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, request.getParameter("roll_no"));
            ps.setString(2, user);
            ps.executeUpdate();
            
            con.close();
            RequestDispatcher rd=request.getRequestDispatcher("UpdateStudentSearch.jsp");
            rd.include(request, response);
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        }
	}

}
