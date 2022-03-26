package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.YearMonth;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClassPerformance{
	@RequestMapping(path="/cperf")
	public void sendStats(HttpServletRequest request,HttpServletResponse response) {
		try {
	       	Class.forName("com.mysql.cj.jdbc.Driver");
	       	Connection con=  DriverManager.getConnection("jdbc:mysql://localhost/sims","root","root");
	           PreparedStatement ps;
	           ResultSet rs ;  
	           int i,n;
	           float classAverageMarks,maxAttendance,minAttendance,AverageAttendance;
	           float averageMarks[]= {0,0,0,0,0};
	           String sql="select * from marks";
	           ps = con.prepareStatement(sql);
	           rs =ps.executeQuery();
	          
	           //class marks stats
	           i=0;
	           n=0;
	           classAverageMarks=0;
	           while(rs.next()){

	        	   averageMarks[i]+=rs.getInt(i+2);
	        	   averageMarks[i+1]+=rs.getInt(i+3);
	        	   averageMarks[i+2]+=rs.getInt(i+4);
	        	   averageMarks[i+3]+=rs.getInt(i+5);
	        	   averageMarks[i+4]+=rs.getInt(i+6);
	           		n++;
	           }
	           averageMarks[i]/=n;
	           averageMarks[i+1]/=n;
	           averageMarks[i+2]/=n;
	           averageMarks[i+3]/=n;
	           averageMarks[i+4]/=n;
               classAverageMarks=(averageMarks[i]+averageMarks[i+1]+averageMarks[i+2]+averageMarks[i+3]+averageMarks[i+4])/5;
               
               sql="select * from attendance";
               ps = con.prepareStatement(sql);
               rs =ps.executeQuery();
               int month,noOfRecords=0;
               YearMonth yearMonthObject =YearMonth.now();   
//               YearMonth ym=yearMonthObject.minusMonths(1);
//               int daysInMonth = ym.lengthOfMonth();
               month=yearMonthObject.getMonthValue();
               
               i=0;
               float tempatt[]=new float[]{0,0,0,0,0,0,0,0,0,0,0,0};
               float Maxatt[]=new float[]{0,0,0,0,0,0,0,0,0,0,0,0};
               float Minatt[]=new float[]{32,32,32,32,32,32,32,32,32,32,32,32};
               float maxAttPerc,minAttPerc,avgAttPerc,tempdays;
               
               while(rs.next()){
            	   for(i=0;i<=month;i++)
            	   {
	                  tempatt[i]+=rs.getInt(i+2);	                  
            	   }
            	 checkMax(Maxatt,rs);
            	 checkMin(Minatt,rs);
                   noOfRecords++;
               }
               maxAttPerc=minAttPerc=avgAttPerc=0;
               for(i=0;i<month;i++)
               {
            	   tempdays=yearMonthObject.withMonth(1).plusMonths(i).lengthOfMonth();
            	   maxAttPerc+=Maxatt[i]/tempdays;
            	   minAttPerc+=Minatt[i]/tempdays;
            	   avgAttPerc+=tempatt[i]/(tempdays*noOfRecords);
//            	   System.out.println(Minatt[i]);
               }
               
               maxAttPerc/=i;
               minAttPerc/=i;
               avgAttPerc/=i;
               maxAttPerc*=100;
               minAttPerc*=100;
               avgAttPerc*=100;
//               System.out.println(maxAttPerc+" "+minAttPerc+" "+avgAttPerc);
               float acadscore;
               acadscore=(5*((avgAttPerc+classAverageMarks)/2))/100;
//               System.out.println(acadscore);
               //(b-a)(x-min)
               //------------ + a
               //max-min
  	        request.setAttribute("maxAttPerc", maxAttPerc);
  	        request.setAttribute("minAttPerc", minAttPerc);
  	        request.setAttribute("avgAttPerc", avgAttPerc);
  	        request.setAttribute("classAvgMarks", classAverageMarks);
  	        request.setAttribute("avgMarks", averageMarks);
  	        request.setAttribute("acadscore", acadscore);
  	        
            
               con.close();
               RequestDispatcher rd=request.getRequestDispatcher("/ClassPerformance.jsp");
          		rd.forward(request, response);
		}
		catch(Exception e) {
			request.setAttribute("error", e);
		}
		
	}
	public void checkMax(float[] ar,ResultSet rs) throws Exception
	{
		int sum1=0,sum2=0,i;
		for(i=0;i<ar.length;i++)
		{
			sum1+=ar[i];
			sum2+=rs.getInt(i+2);
		}
		if(sum1<sum2)
			for(i=0;i<ar.length;i++)
				ar[i]=rs.getInt(i+2);
	}
	public void checkMin(float[] ar,ResultSet rs) throws Exception
	{
		int sum1=0,sum2=0,i;
		for(i=0;i<ar.length;i++)
		{
			sum1+=ar[i];
			sum2+=rs.getInt(i+2);
		}
		if(sum1>sum2)
			for(i=0;i<ar.length;i++)
				ar[i]=rs.getInt(i+2);
	}
}