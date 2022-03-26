package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Register {
	@RequestMapping(path="/Register")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
        	 
        	Class.forName("com.mysql.cj.jdbc.Driver");
             Connection con=  DriverManager.getConnection("jdbc:mysql://localhost/sims","root","root");
             String roll_no,first_name,last_name,mother_name,father_name,address,gender,state,city,pincode,branch,year_sem,email_id,password;
			 Date dob;
			 
             String sql="insert into students values (?,?,?,?,?,?,?,?,?)";
             
             roll_no=request.getParameter("roll_no");
             first_name= request.getParameter("first_name");
             last_name = request.getParameter("last_name");
             mother_name = request.getParameter("mother_name");
             father_name = request.getParameter("father_name");
             address=request.getParameter("address");
             gender=request.getParameter("gender");
             state=request.getParameter("state");
             city=request.getParameter("city");
             pincode=request.getParameter("pincode");
             branch=request.getParameter("branch");
             year_sem=request.getParameter("year_sem");
             email_id=request.getParameter("email_id");
             password=request.getParameter("password");
             dob=new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("dob"));
             java.sql.Date sqldob=new java.sql.Date(dob.getTime());
             
             PreparedStatement ps = con.prepareStatement(sql);
             ps.setString(1, roll_no);
             ps.setString(2, first_name);
             ps.setString(3, last_name);
             ps.setString(4, mother_name);
             ps.setString(5,father_name);
             ps.setString(6, address);
             ps.setString(7, gender);
             ps.setString(8, email_id);
             ps.setDate(9, sqldob);
             ps.executeUpdate();
             
             sql="insert into course values (?,?,?,?)";
             PreparedStatement ps1 = con.prepareStatement(sql);
             ps1.setString(1, roll_no);
             ps1.setString(2, pincode);
             ps1.setString(3, branch);
             ps1.setString(4, year_sem);
             ps1.executeUpdate();
             
             sql="insert into location values (?,?,?)";
             PreparedStatement ps2 = con.prepareStatement(sql);
             ps2.setString(1, pincode);
             ps2.setString(2, state);
             ps2.setString(3, city);
             ps2.executeUpdate();
             
             sql="insert into user_student values (?,?)";
             PreparedStatement ps3 = con.prepareStatement(sql);
             ps3.setString(1, roll_no);
             ps3.setString(2, password);
             ps3.executeUpdate();
             
            con.close();
            
            response.sendRedirect("studentLogin.html");             
            }
         
        }
   
    
}
