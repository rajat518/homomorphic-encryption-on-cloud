package mypack;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import db.MyConnection;

public class FileDownload1 extends HttpServlet
{
	Connection con=null;	
	String path=null;


	String mystatus1="DownLoaded";
	String mystatus2="Failed";

	public void init()
	{
			ServletContext sc=getServletContext();

			path=sc.getRealPath("\\WEB-INF\\classes\\myprop.properties");

			System.out.println("path============"+path);

			con=MyConnection.getConnection(path);
	}

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		SimpleFTPClient client = null;

		HttpSession ses=request.getSession();
		String ownername=(String)ses.getAttribute("username");
		
		try
        {
			java.util.Date ud1 =new java.util.Date();
				
			java.sql.Date sd1 = new java.sql.Date(ud1.getTime());
			
			String val = request.getParameter("ip");

            String file = request.getParameter("file");

			System.out.println("reqeust file name is "+file);

            if(val=="" || file=="")
			{
				System.out.println("in valid request");
				response.sendRedirect("reports1.jsp?msg3=in valid request");

            }//if
            
			PreparedStatement pstm = null;
            
			PreparedStatement pstm1 = null;
            
			PreparedStatement pstm2 = null;
         
			pstm = con.prepareStatement("select * from CLOUDDETAILS where USERNAME=?");

			pstm.setString(1,val);
            
			ResultSet rs = pstm.executeQuery();
            
			String user =null;
		
			if (rs.next())
			{
               
			   client = new SimpleFTPClient();

			   user=rs.getString("USERNAME");
			 
			   client.setUser(rs.getString("USERNAME"));
               
			   client.setPassword(rs.getString("password"));
               
			   client.setHost(rs.getString("ip"));
               
			   client.setRemoteFile(file);
               
               client.connect();

			   System.out.println(Constant.file+file+" file to be saved into");
               
			   if(client.downloadFile(Constant.file+file))
			   {
				   
				   pstm1 = (PreparedStatement) con.prepareStatement("insert into USERTRANSACTION values(?,?,?,?,?)");

				   pstm1.setString(1,ownername);
				   pstm1.setString(2,file);
				   pstm1.setString(3,mystatus1);
				   pstm1.setString(4,val);
				   pstm1.setDate(5,sd1);
				
				   pstm1.executeUpdate();

               }//if

			   else
			   {
                   
				   pstm2 = (PreparedStatement) con.prepareStatement("insert into USERTRANSACTION values(?,?,?,?,?,?,?)");

				   pstm2.setString(1,ownername);
				   pstm2.setString(2,file);
				   pstm2.setString(3,mystatus2);
				   pstm2.setString(4,val);
				   pstm2.setDate(5,sd1);
                        
				   pstm2.executeUpdate();

                }//else

            }//if
            
			System.out.println("check Status");

			response.sendRedirect("reports1.jsp?msg3=File Downloaded successfully");

        }//try

		catch (Exception e)
		{
            
			e.printStackTrace();

        }//catch

    }//processRequest

    protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
        processRequest(request, response);

    }//service(-,-)

}//class
