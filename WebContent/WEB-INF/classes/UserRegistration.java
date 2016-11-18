package mypack;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.text.*;

import db.MyConnection;


public class UserRegistration extends HttpServlet
{
	Connection con=null;
	PreparedStatement ps=null;
	Statement st=null;
	ResultSet rs=null;
	String path=null;

	public void init()
	{
			ServletContext sc=getServletContext();

			path=sc.getRealPath("\\WEB-INF\\classes\\myprop.properties");

			System.out.println("path============"+path);

			con=MyConnection.getConnection(path);
	}

	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		int result=0;

		res.setContentType("text/html");

		PrintWriter pw=res.getWriter();

		String uname=req.getParameter("uname");

		System.out.println("register name"+uname);
		
		try
		{

			st=con.createStatement();
			
			ResultSet rs=st.executeQuery("select * from userregistration where uname='"+uname+"'");


			if(rs.next())
			{
				res.sendRedirect("userregistration.jsp?msg=user allready exist");
			}
			else
			{
				String name=req.getParameter("name");
				String pwd=req.getParameter("pwd");
				String email=req.getParameter("email");
				String gen=req.getParameter("gender");
				String dob=req.getParameter("dob");
				String question=req.getParameter("question");
				String answer=req.getParameter("answer");
				String pno=req.getParameter("pno");
				String city=req.getParameter("city");


				SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MMM-yyyy");

				java.util.Date ud1 = sdf1.parse(dob);

				java.sql.Date sd1 = new java.sql.Date(ud1.getTime());

				ps=con.prepareStatement("insert into userregistration values(?,?,?,?,?,?,?,?,?,?)");

				ps.setString(1,name);
				ps.setString(2,uname);
				ps.setString(3,pwd);
				ps.setString(4,email);
				ps.setString(5,gen);
				ps.setDate(6,sd1);
				ps.setString(7,question);
				ps.setString(8,answer);
				ps.setString(9,pno);
				ps.setString(10,city);

				result=ps.executeUpdate();
				
				if(result==1)
				{
					res.sendRedirect("userregistration.jsp?msg=registration success");
				}
				else
				{
					res.sendRedirect("index.jsp?msg=Registration Fail");
				}
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
