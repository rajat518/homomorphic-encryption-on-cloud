package mypack;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import java.sql.*;

import db.MyConnection;


public class ContactUs extends HttpServlet
{
	Connection con=null;
	PreparedStatement ps=null;
	String path=null;

	

	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		int result=0;

		res.setContentType("text/html");

		PrintWriter pw=res.getWriter();
		
		try
		{
			String email=req.getParameter("email");
			String pno=req.getParameter("pno");
			String message=req.getParameter("message");


			HttpSession ses=req.getSession();
			String name=(String)ses.getAttribute("username");
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");
			ps=con.prepareStatement("insert into CONTACT values(?,?,?,?)");

			ps.setString(1,name);
			ps.setString(2,email);
			ps.setString(3,pno);
			ps.setString(4,message);

			result=ps.executeUpdate();
		}
		catch (SQLException se)
		{
			se.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		if(result==1)
		{
			res.sendRedirect("contactus.jsp?msg6=we will contact soon");
		}
		else
		{
			res.sendRedirect("contactus.jsp?msg6=sending message failed try again");
		}

	}

	public void destroy()
	{
		try
		{
			ps.close();
			con.close();	
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

}
