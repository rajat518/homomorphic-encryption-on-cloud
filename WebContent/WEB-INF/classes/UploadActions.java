package mypack;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import db.MyConnection;

import org.apache.tomcat.util.http.fileupload.FileItem;

import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;


public class UploadActions extends HttpServlet
{

    private File tmpDir;

	String user;

	String path=null;

	String mystatus="Upload";
	String mystatus1="Success";
	String mystatus2="Failed";
	String mystatus3="Active";

		Connection con = null;

	public void init()
	{
			ServletContext sc=getServletContext();

			path=sc.getRealPath("\\WEB-INF\\classes\\myprop.properties");

			System.out.println("path============"+path);

			con=MyConnection.getConnection(path);
	}



    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		
		HttpSession ses=request.getSession();
		String ownername=(String)ses.getAttribute("username");

		String cloudname=(String)ses.getAttribute("cloudname");
		
		System.out.println("owner name is "+ownername);


        PreparedStatement pstm = null;
        PreparedStatement pstm1 = null;
        PreparedStatement pstm2 = null;
        PreparedStatement pstm3 = null;

		PrintWriter out = response.getWriter();

        DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
       
        fileItemFactory.setSizeThreshold(1 * 1024 * 1024);
		
        fileItemFactory.setRepository(tmpDir);

        ServletFileUpload uploadHandler = new ServletFileUpload(fileItemFactory);

        try
        {       

				java.util.Date ud1 =new java.util.Date();
				
			java.sql.Date sd1 = new java.sql.Date(ud1.getTime());

            List items = uploadHandler.parseRequest(request);

			System.out.println("items is "+items);
            
			Iterator itr = items.iterator();   
			
			System.out.println("itr"+itr);
            
			String fileName=null;

			FileItem item = (FileItem)itr.next();

			System.out.println("item is "+item);
            
			String fName=item.getName();

			System.out.println("fname is "+fName);
           
            pstm = con.prepareStatement("select * from TRANSACTION where filename=? and FILEOWNERNAME=?");

			pstm.setString(1,fName);
			pstm.setString(2,ownername);
            
			ResultSet rs = pstm.executeQuery();
            
			if (rs.next())
			{
				
                System.out.println("file allready exist");

				response.sendRedirect("fileupload.jsp?msg4=file allready exist");
            }
			else
			{
				System.out.println("file not exist");

                fileName = (String) item.getName();

				System.out.println("else filename is "+fileName);
               
                int x=fileName.lastIndexOf('\\');
				System.out.println("else x is "+x);

                String fN=fileName.substring(x+1, fileName.length());
                
				System.out.println("file name is :"+fN);

                SimpleFTPClient client = null;
				
				pstm3 = con.prepareStatement("select * from CLOUDDETAILS where status=? and USERNAME=?");

				pstm3.setString(1,mystatus3);
				pstm3.setString(2,cloudname);
				
				
				ResultSet rs1 = pstm3.executeQuery();
                
				String user="";
                
				String cld="";
                
				while (rs1.next())
				{
					System.out.println("in while of rs1.next");

                    client=new SimpleFTPClient();
                    
					cld=rs1.getString("ip");

                    user=rs1.getString("USERNAME");
                    
					client.setHost(rs1.getString("ip"));
                    
					client.setUser(rs1.getString("USERNAME"));
                    
					client.setPassword(rs1.getString("password"));
                    
					client.setRemoteFile(fN);

                   boolean log= client.connect();

                   if(log)
				   {
					   System.out.println("in if log");
                       if (client.uploadFile(item.getInputStream()))
					   {
							
							System.out.println("in transaction insert");
							pstm1 = (PreparedStatement) con.prepareStatement("insert into TRANSACTION values(?,?,?,?,?,?,?)");

							pstm1.setString(1,cloudname);
							pstm1.setString(2,fN);
							pstm1.setString(3,mystatus1);
							pstm1.setString(4,cld);
							pstm1.setDate(5,sd1);
							pstm1.setString(6,mystatus);
							pstm1.setString(7,ownername);
							
							pstm1.executeUpdate();

						}//third if
						else
						{
							System.out.println("in transaction insert fail");
                           System.out.println("Cloud Not Connected");
						   
						   pstm2 =(PreparedStatement) con.prepareStatement("insert into TRANSACTION values(?,?,?,?,?,?,?)");

						   pstm2.setString(1,cloudname);
							pstm2.setString(2,fN);
							pstm2.setString(3,mystatus2);
							pstm2.setString(4,cld);
							pstm2.setDate(5,sd1);
							pstm2.setString(6,mystatus);
							pstm2.setString(7,ownername);
                           
						   pstm2.executeUpdate();

						}//third else

                   }//second if
				   else
				   {
                       System.out.println("not connected");

					  System.out.println("in fail");
					  response.sendRedirect("fileupload.jsp?msg4=Not Connected"); 
                   
				   }//second else
				 
				 }//while
				 

				 System.out.println("check reports fine");

				response.sendRedirect("fileupload.jsp?msg4=File Uploadded successfully");

			}//first else
            
        }//try
		
		catch (Exception ex)
		{
            ex.printStackTrace();
            
			System.out.println("Cloud Not Connected");

			response.sendRedirect("fileupload.jsp?msg4=Cloud Not Connected");
        
		}//catch

    }//process request

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
        processRequest(request, response);

    }//doGet(-,-)

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
        doGet(request, response);

    }//doPost(-,-)
}
