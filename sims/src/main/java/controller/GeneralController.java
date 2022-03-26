package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GeneralController {
	@RequestMapping("/")
	public String index() {
		System.out.println("yes");
		return "index.html";
	}
	
	@RequestMapping(path="/login")
    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("Yes23");
        try (PrintWriter out = response.getWriter()) {
           
            String sql;
        	String name = request.getParameter("username");
            String pass = request.getParameter("password");
            String userType=request.getParameter("user_type");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/sims","root","root");
            if(userType.equals("student"))
            	sql="select uname,upass from user_student where uname=?";
            else if(userType.equals("faculty"))
            	sql="select uname,upass from user_teacher where uname=?";
            else
            	sql=";";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,name);
            ResultSet rs=ps.executeQuery();
            rs.next();
            if((name.equals(rs.getString(1))) & (pass.equals(rs.getString(2)))){
                HttpSession session=request.getSession();
                session.setAttribute("username",name);
                session.setAttribute("user_type",userType);
                response.sendRedirect(userType+"HomePage.jsp");
            }
            else{
                out.println("<script>alert('Sorry! Invalid Username or Password! Try Again!')</script>");
                RequestDispatcher rd = (RequestDispatcher)request.getRequestDispatcher("/index.html");
                rd.include(request,response);
            }
            con.close();
        }
        System.out.println("yes");
    }

	
	@RequestMapping(path="/logout")
    protected void logout(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    try (PrintWriter out = response.getWriter()) {
//        request.getRequestDispatcher("index.html").include(request, response);  
          
        HttpSession session=request.getSession();  
        session.invalidate();  
          
        out.println("You are successfully logged out!");  
        out.println("<script>"
        		+ "window.setTimeout(window.location.href=\"index.html\",20000);</script>");  
        out.close();  
    }
}
	
}
