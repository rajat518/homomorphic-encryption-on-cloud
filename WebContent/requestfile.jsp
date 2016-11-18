<%@page import="java.sql.*"%>
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
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");

String uname = request.getParameter("username");
String ip = request.getParameter("ip");
String file = request.getParameter("file");
String owner = request.getParameter("owner");

String status= "waiting";
java.util.Date ud1 =new java.util.Date();
java.sql.Date sd1 = new java.sql.Date(ud1.getTime());
PreparedStatement ps = con.prepareStatement("insert into request values(?,?,?,?,?,?)");
ps.setString(1, uname);
ps.setString(2, file);
ps.setString(3, ip);
ps.setDate(4, sd1);
ps.setString(5, status);
ps.setString(6, owner);
int i = ps.executeUpdate();
if(i>0)
{
	  response.sendRedirect("reports1.jsp?msg4=Request sent successfully");

	}	
%>
</body>
</html>