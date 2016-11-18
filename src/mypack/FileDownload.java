package mypack;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;

import db.MyConnection;

public class FileDownload extends HttpServlet
{
	Connection con=null;	
	String path=null;


	String mystatus1="DownLoad Success";
	String mystatus2="Failed";
	String mystatus3="Download";

	

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		System.out.println("srinu today in process request");

		SimpleFTPClient client = null;

		HttpSession ses=request.getSession();
		String ownername=(String)ses.getAttribute("username");
		
		try
        {
			java.util.Date ud1 =new java.util.Date();
				
			java.sql.Date sd1 = new java.sql.Date(ud1.getTime());
			
			String val = request.getParameter("ip");

			System.out.println("ip is "+val);

            String file = request.getParameter("file");

			System.out.println("reqeust file name is "+file);

            if(val=="" || file=="")
			{
				System.out.println("in valid request");
				response.sendRedirect("reports.jsp?msg3=in valid request");

            }//if
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");
			PreparedStatement pstm = null;
            
			PreparedStatement pstm1 = null;
            
			PreparedStatement pstm2 = null;
         
			pstm = con.prepareStatement("select * from CLOUDDETAILS where USERNAME=?");

			pstm.setString(1,val);
            
			ResultSet rs = pstm.executeQuery();
            
			String user =null;
			String ip=null;
            
			if (rs.next())
			{
               
			   client = new SimpleFTPClient();

			   user=rs.getString("USERNAME");
			   ip=rs.getString("ip");

			   System.out.println("user is"+user);
               
			   client.setUser(rs.getString("USERNAME"));
               
			   client.setPassword(rs.getString("password"));
               
			   client.setHost(rs.getString("ip"));
               
			   client.setRemoteFile(file);
               
               client.connect();

			   System.out.println(Constant.file+file+" file to be saved into");
               
			   if(client.downloadFile(Constant.file+file))
			   {
				   
				   pstm1 = (PreparedStatement) con.prepareStatement("insert into TRANSACTION values(?,?,?,?,?,?,?)");

				   System.out.println("in download file if");

				   pstm1.setString(1,user);
				   pstm1.setString(2,file);
				   pstm1.setString(3,mystatus1);
				   pstm1.setString(4,ip);
				   pstm1.setDate(5,sd1);
				   pstm1.setString(6,mystatus3);
				   pstm1.setString(7,ownername);
                        
				   pstm1.executeUpdate();

               }//if

			   else
			   {
                   
				   pstm2 = (PreparedStatement) con.prepareStatement("insert into TRANSACTION values(?,?,?,?,?,?,?)");

				   System.out.println("in download file else");

				   pstm2.setString(1,user);
				   pstm2.setString(2,file);
				   pstm2.setString(3,mystatus2);
				   pstm2.setString(4,val);
				   pstm2.setDate(5,sd1);
				   pstm2.setString(6,mystatus3);
				   pstm2.setString(7,ownername);
                        
				   pstm2.executeUpdate();

                }//else

            }//if
            
			System.out.println("check Status");

			response.sendRedirect("reports.jsp?msg3=File Downloaded successfully");

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
