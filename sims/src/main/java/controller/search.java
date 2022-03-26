package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class search {
       
    public search() {
        super();
        
    }
    @RequestMapping(path="/search")
    public void getProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{	
        	Student s=new Student();
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
                       
                       
                       sql="select * from attendance where roll_no=?";
                       ps = con.prepareStatement(sql);
                       ps.setString(1, user);
                       rs =ps.executeQuery();
                      
                       
                       i=0;
                       int tempatt[]=new int[12];
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
                       
                       RequestDispatcher rd=request.getRequestDispatcher("ShowStudentProfile.jsp");
                       rd.include(request, response);
                       
                }catch(Exception e){
                    request.setAttribute("Error",e);
                    e.printStackTrace();
                }

    }

    

}
