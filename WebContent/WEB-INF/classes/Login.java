package mypack;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import db.MyConnection;

public class Login extends HttpServlet
{
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	PreparedStatement ps1=null;
	ResultSet rs1=null;
	String path=null;

	public void init()
	{
		try
		{
			ServletContext sc=getServletContext();

			path=sc.getRealPath("\\WEB-INF\\classes\\myprop.properties");

			System.out.println("path============"+path);

			con=MyConnection.getConnection(path);

		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
			
	}

	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		int result=0;
		int result1=0;



		String username=req.getParameter("uname");
		String password=req.getParameter("pwd");
		String utype=req.getParameter("ltype");

		String user="user";
		String admin="admin";
		String dataowner="dataowner";
		String csp="csp";

		if(utype.equals(dataowner))
		{
			try
			{
				ps=con.prepareStatement("select count(*) from registration where uname=? and pwd=?");

				ps.setString(1,username);
				ps.setString(2,password);

				rs=ps.executeQuery();

				while(rs.next())
				{
					result1=rs.getInt(1);
				}
	
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			if(result1==1)
			{
				HttpSession session = req.getSession() ;           
			
				session.setAttribute("username",username);
				session.setAttribute("password",password);
			
				res.sendRedirect("home.jsp");
			}
			else
			{
				res.sendRedirect("index.jsp?msg1=invalid credentials");
			}
		}
		else
		{
			
			
			if(utype.equals(user))
			{
				try
				{
					ps=con.prepareStatement("select count(*) from userregistration where uname=? and pwd=?");

					ps.setString(1,username);
					ps.setString(2,password);

					rs=ps.executeQuery();

					while(rs.next())
					{
						result=rs.getInt(1);
					}
	
				}
				catch (Exception e)
				{
					e.printStackTrace();
				}
				if(result==1)
				{
					HttpSession session = req.getSession() ;           
			
					session.setAttribute("username",username);
					session.setAttribute("password",password);
			
					res.sendRedirect("userhome.jsp");
				}
				else
				{
					res.sendRedirect("index.jsp?msg1=invalid credentials");
				}
			}
			else
			{
				
				if(username.equals(csp) && password.equals(csp))
				{
					res.sendRedirect("csphome.html");
				}
				else
				{
					if(username.equals(admin) && password.equals(admin))
					{
						res.sendRedirect("adminhome.html");
					}
					else
					{
		
						res.sendRedirect("index.jsp?msg1=invalid credentials");
					}
				}
			}
		}
	}

	public void destroy()
	{
		try
		{
			rs.close();
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
