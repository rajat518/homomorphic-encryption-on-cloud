package mypack;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import java.sql.*;

import db.MyConnection;

public class Login extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String path=null;

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
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");
				ps=con.prepareStatement("select count(*) from registration where uname=? and pwd=?");

				ps.setString(1,username);
				ps.setString(2,password);

				rs=ps.executeQuery();

				while(rs.next())
				{
					result1=rs.getInt(1);
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
			catch (Exception e)
			{
				e.printStackTrace();
			}
			
		}
		else
		{
			if(utype.equals(user))
			{
				try
				{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con19=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");
					PreparedStatement ps19=con19.prepareStatement("SELECT * FROM `userregistration` where UNAME=? and PWD=?");
					ps19.setString(1,username);
					ps19.setString(2,password);
					ResultSet rs19=ps19.executeQuery();
					if(rs19.next())
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
				catch (Exception e)
				{
					e.printStackTrace();
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
