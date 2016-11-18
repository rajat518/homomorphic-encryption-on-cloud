package mypack;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import java.sql.*;

import db.MyConnection;


public class EditCloud extends HttpServlet
{
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String path=null;

	

	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		int result=0;

		res.setContentType("text/html");

		PrintWriter pw=res.getWriter();

		String ip=req.getParameter("ip");
		String uname=req.getParameter("uname");
		String pass=req.getParameter("pass");
		String status=req.getParameter("status");
		try
		{
			System.out.println("srinu ip"+ip);
			System.out.println("srinu pass"+pass);
			System.out.println("srinu status"+status);
			System.out.println("srinu status"+uname);
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");
			ps=con.prepareStatement("update CLOUDDETAILS set password=?,status=? where ip=? and username=?");

			ps.setString(1,pass);
			ps.setString(2,status);
			ps.setString(3,ip);
			ps.setString(4,uname);

			
			result=ps.executeUpdate();


			if(result==1)
			{
				res.sendRedirect("editcloud.jsp?msg2=cloud updated");
			}
			else
			{
				res.sendRedirect("editcloud.jsp?msg2=cloud updation fail");
			}
		}
		catch (SQLException se)
		{
			se.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
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
