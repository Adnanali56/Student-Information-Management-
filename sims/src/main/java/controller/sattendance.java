package controller;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class sattendance {
	public sattendance() {
        super();
    }

    @RequestMapping(path="/sattendance")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user=request.getParameter("suser");
		String pass=request.getParameter("spass");
		String date=request.getParameter("dateTime");
		String sql;
		ResultSet rs;
		Connection con;
		HttpSession session=request.getSession();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/sims","root","root");
			sql="select upass from user_student where uname=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,user);
			rs=ps.executeQuery();
			rs.next();
			int caser;
			if(rs.getString(1).equals(pass))
			{
				session.setAttribute("details","valid");
				sql="select date from timelog where roll_no=?";
				ps=con.prepareStatement(sql);
				ps.setString(1, user);
				rs=ps.executeQuery();
				boolean flag=rs.next();
				if(!flag)
				{
					caser=0;
				}
				else if(rs.getString(1)==null)
				{
					caser=1;
					
					
				}
				else if(rs.getString(1).compareToIgnoreCase(date)>=0)
				{
					caser=2;
						session.setAttribute("attendance","failed");
						response.sendRedirect("StudentSubmitAttendance.jsp");	
				}
				else
				{
					caser=1;
				}
				switch(caser) {
				case 0:sql="insert into timelog values(?,?)";
					ps=con.prepareStatement(sql);
					ps.setString(1, user);
					ps.setString(2, date);
					ps.executeUpdate();
				case 1:
					String month=request.getParameter("month");
					sql="update timelog set date=? where roll_no=?";
					ps=con.prepareStatement(sql);
					ps.setString(1, date);
					ps.setString(2, user);
					ps.executeUpdate();
					
					sql="select "+month+" from attendance where roll_no=?";
					ps=con.prepareStatement(sql);
					
					ps.setString(1, user);
					rs=ps.executeQuery();
					flag=rs.next();
					int no_of_days;
					if(!flag)
					{
						sql="insert into attendance values(?,0,0,0,0,0,0,0,0,0,0,0,0)";
						ps=con.prepareStatement(sql);
						ps.setString(1, user);
						ps.executeUpdate();
						no_of_days=1;
					}
					else
					{
					no_of_days=rs.getInt(1)+1;
					}
					sql="update attendance set "+month+"=? where roll_no=?";
					ps=con.prepareStatement(sql);
					
					ps.setInt(1, no_of_days);
					ps.setString(2, user);
					ps.executeUpdate();
					
					session.setAttribute("attendance","passed");
					response.sendRedirect("studentHomePage.jsp");
					break;
				case 2:break;
				}
				//System.out.println("caser="+caser);	
			}
			else
			{
				
				session.setAttribute("details","invalid");
				response.sendRedirect("StudentSubmitAttendance.jsp");
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
		
	}

}
