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

String mystatus1="DownLoaded";
String mystatus2="Failed";
String key = request.getParameter("key");
System.out.println(key+"key1111111111111");
System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
/* String val = request.getParameter("ip");
String file = request.getParameter("file"); */
String val = session.getAttribute("ip").toString();
String file = session.getAttribute("file").toString();
System.out.println(val+"ZZZZZZZZZZZZZZZZZZZZZZZZZZZ");
System.out.println(file+"ZZZZZZZZZZZZZZZZZZZZZZZZZZ");

SimpleFTPClient client = null;
HttpSession ses=request.getSession();
String ownername=(String)ses.getAttribute("username");

try
{
	java.util.Date ud1 =new java.util.Date();
		
	java.sql.Date sd1 = new java.sql.Date(ud1.getTime());
	
	
	System.out.println("reqeust file name is "+file);

    if(val=="" || file=="")
	{
		System.out.println("in valid request");
		response.sendRedirect("reports1.jsp?msg3=in valid request");

    }//if
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");
	PreparedStatement pstm = null;
	PreparedStatement pstm1 = null;
	PreparedStatement pstm2 = null;
	
	pstm1 = con.prepareStatement("select * from transaction where username=? and filename=?");
	pstm1.setString(1, val);
	pstm1.setString(2, file);
	ResultSet rs1 = pstm1.executeQuery();
	if(rs1.next())
	{	
		String key1 = rs1.getString("key");
		System.out.println(key1+"    key2222222222");
		if(key.equals(key1))
		{
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
		   pstm2 = (PreparedStatement) con.prepareStatement("insert into USERTRANSACTION values(?,?,?,?,?)");
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
		}
		else
		{
			response.sendRedirect("reports1.jsp?msg4=Download Failed! Check your Key or Newwork Connection");	
		}
		
	}
}//try

catch (Exception e)
{
    
	e.printStackTrace();

}//catch

%>
</body>
</html>