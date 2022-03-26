
package controller;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FacultyProfile {

   
	@RequestMapping(path="/facultyProfile")
public void getProfile(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       try{
       	Faculty f=new Faculty();
       	HttpSession session=request.getSession();
       	String user=(String) session.getAttribute("username");
       	Class.forName("com.mysql.cj.jdbc.Driver");
       	Connection con=  DriverManager.getConnection("jdbc:mysql://localhost/sims","root","root");
           String sql="select * from faculty where faculty_id=?";
           String sql1="select * from subList where faculty_id=?";
           String sql2="select * from timeTable where faculty_id=?";
           PreparedStatement ps = con.prepareStatement(sql);
           ps.setString(1, user);
           ResultSet rs =ps.executeQuery();
           rs.next();
           
           f.setFaculty_id(rs.getString(1));
           f.setFirst_name(rs.getString(2));
           f.setLast_name(rs.getString(3));     
           f.setAddress(rs.getString(4));
           f.setEmail_id(rs.getString(5));
           f.setDob(rs.getDate(6).toString());
           f.setBranch(rs.getString(7));
           f.setDepartment(rs.getString(8));
           
           ps=con.prepareStatement(sql1);
           ps.setString(1, user);
           ResultSet rs1=ps.executeQuery();
           rs1.next();       
           			int i=0;
                   StringTokenizer st=new StringTokenizer(rs1.getString(2),":");
                   String subList[]=new String[st.countTokens()];
                   while(st.hasMoreTokens()){
                      subList[i]=st.nextToken();
                      i++;
                   }
                  
           ps=con.prepareStatement(sql2);
           ps.setString(1, user);
           ResultSet rs2=ps.executeQuery();
           rs2.next();       
   			i=0;
           int index;
		String data;
           st=new StringTokenizer(rs2.getString(2),"$");
           String timeTable[][]=new String[6][6];
           for(int k=0;k<6;k++)
        	   for(int l=0;l<6;l++)
        		   timeTable[k][l]="-";
           
           StringTokenizer st2,st3;
           while(st.hasMoreTokens()){
        	   String temp=st.nextToken();
        	   st2=new StringTokenizer(temp,":");
              for(;st2.hasMoreTokens();)
              {
            	  
            	  st3=new StringTokenizer(st2.nextToken(),"-");
            	  if(temp.equals(" "))
              		   continue;
            	  index=Integer.parseInt(st3.nextToken());
            	  data=st3.nextToken()+"-"+st3.nextToken();
            	  timeTable[i][index-1]=data;
              }
              i++;
           }
                   con.close();
                   
                   request.setAttribute("subList", subList);
                   request.setAttribute("ttList", timeTable);
                   request.setAttribute("facl", f);
                   request.setAttribute("subLength", subList.length);
                   
                   RequestDispatcher rd=request.getRequestDispatcher("FacultyProfile.jsp");
                   rd.include(request, response);
                   

               }catch(Exception e){
                  request.setAttribute("error", e);
                   e.printStackTrace();
               }

   }

}
