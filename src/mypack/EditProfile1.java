package mypack;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import java.sql.*;

import db.MyConnection;


public class EditProfile1 extends HttpServlet
{
	Connection con=null;
	PreparedStatement ps=null;
	String path=null;

	
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		int result=0;

		res.setContentType("text/html");

		PrintWriter pw=res.getWriter();

		HttpSession ses=req.getSession();
		String uname=(String)ses.getAttribute("username");
		String pwd=(String)ses.getAttribute("password");
		
		try
		{
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String question=req.getParameter("question");
			String answer=req.getParameter("answer");
			String pno=req.getParameter("pno");
			String city=req.getParameter("city");
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");
			ps=con.prepareStatement("update USERREGISTRATION set name=?,email=?,question=?,answer=?,pno=?,city=? where uname=? and pwd=?");

			ps.setString(1,name);
			ps.setString(2,email);
			ps.setString(3,question);
			ps.setString(4,answer);
			ps.setString(5,pno);
			ps.setString(6,city);
			ps.setString(7,uname);
			ps.setString(8,pwd);

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
			res.sendRedirect("userhome.jsp");
		}
		else
		{
			res.sendRedirect("eupdate.jsp");
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
