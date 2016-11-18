package mypack;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

import db.MyConnection;


public class Validate extends HttpServlet
{
	Connection con=null;
	PreparedStatement ps=null;
	String path=null;

	public void init()
	{
			ServletContext sc=getServletContext();

			path=sc.getRealPath("\\WEB-INF\\classes\\myprop.properties");

			System.out.println("path============"+path);

			con=MyConnection.getConnection(path);
	}

	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		int result=0;

		res.setContentType("text/html");

		PrintWriter pw=res.getWriter();

		String uname=req.getParameter("user");
		String fname=req.getParameter("fname");
		String cloud=req.getParameter("cloud");

		String status="download";
		
		try
		{

				ps=con.prepareStatement("update request set STATUS=? where USERNAME=? and FILENAME=? and CLOUD=?");

				ps.setString(1,status);
				ps.setString(2,uname);
				ps.setString(3,fname);
				ps.setString(4,cloud);
				
				result=ps.executeUpdate();
				
				if(result==1)
				{
					res.sendRedirect("processrequest.jsp?msg8=request process success");
				}
				else
				{
					res.sendRedirect("processrequest.jsp?msg8=request process fail");
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
