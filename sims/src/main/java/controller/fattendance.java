
package controller;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class fattendance {
	@RequestMapping(path="fattendance")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            try{
            	Class.forName("com.mysql.cj.jdbc.Driver");
            	Connection con=  DriverManager.getConnection("jdbc:mysql://localhost/sims","root","root");
                String sql="select * from attendance order by roll_no asc";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs =ps.executeQuery();
                Map<Integer, ArrayList<String>> m=new LinkedHashMap<Integer, ArrayList<String>>();
                List<String> l=new ArrayList<String>();
                int i=0;
                while(rs.next()){
                	i++;
                	l.add(rs.getString(1));
                    l.add(rs.getString(2));
                    l.add(rs.getString(3)) ;
                    l.add(rs.getString(4));
                    l.add(rs.getString(5));
                    l.add(rs.getString(6));
                    l.add(rs.getString(7));
                    l.add(rs.getString(8));
                    l.add(rs.getString(9));
                    l.add(rs.getString(10));
                    l.add(rs.getString(11));
                    l.add(rs.getString(12));
                    l.add(rs.getString(13));
                    m.put(i, new ArrayList<String>(l));
                    l.clear();
                }
                con.close();
                request.setAttribute("classAtt",m);
                RequestDispatcher rd=request.getRequestDispatcher("ClassAttendance.jsp");
                rd.include(request, response);
            }catch(Exception e){
                request.setAttribute("error", e);
            }
        }
}
