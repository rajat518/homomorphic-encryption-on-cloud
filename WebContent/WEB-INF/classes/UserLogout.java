package mypack;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;


public class UserLogout extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		HttpSession session = req.getSession() ;

		session.invalidate();

		res.sendRedirect("index.htm");
	}
}
