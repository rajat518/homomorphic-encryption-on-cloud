package mypack;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

import db.MyConnection;


public class DeleteFile extends HttpServlet
{
	Connection con=null;
	PreparedStatement ps=null;
	PreparedStatement ps1=null;
	ResultSet rs=null;
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

		String fname=req.getParameter("fname");
		
		try
		{
			System.out.println("srinu filename"+fname);

			HttpSession ses=req.getSession();
			String name=(String)ses.getAttribute("username");

			ps=con.prepareStatement("delete from TRANSACTION where FILENAME=? and FILEOWNERNAME=?");

			ps.setString(1,fname);
			ps.setString(2,name);

			result=ps.executeUpdate();

			ps1=con.prepareStatement("delete from request where FILENAME=? and USERNAME=?");

			ps1.setString(1,fname);
			ps1.setString(2,name);

			int result1=ps1.executeUpdate();



			if((result==1 || result==2))
			{
				res.sendRedirect("deletefiles.jsp?msg5=file deleted successfully");
			}
			else
			{
				res.sendRedirect("deletefiles.jsp?msg5=file deletion fail");
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
