<%@page import="mypack.Constant"%>
<%@page import="mypack.SimpleFTPClient"%>
<%@page import="java.sql.*"%>
<%@page import="mypack.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Connection con=null;	
String path=null;


String mystatus1="DownLoad Success";
String mystatus2="Failed";
String mystatus3="Download";
System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
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
		   response.sendRedirect("reports.jsp?msg3=File Downloaded successfully");

       }//if


    }//if
    
	

}//try

catch (Exception e)
{
    
	e.printStackTrace();

}//catch

%>
</body>
</html>