<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.Properties,javax.mail.*,java.sql.*,javax.servlet.http.*,javax.mail.internet.*" %>
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
String path=null;
String uname=request.getParameter("user");
String fname=request.getParameter("fname");
String cloud=request.getParameter("cloud");
String owner=request.getParameter("msg");

System.out.println("username@@@@"+uname);
System.out.println("filename@@@@"+fname);
System.out.println("cloud name@@@@"+cloud);


System.out.println("owner@@@@"+owner);
String status="download";
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");

PreparedStatement ps1=con.prepareStatement("select EMAIL from userregistration where UNAME=?");
ps1.setString(1,uname);
ResultSet rs = ps1.executeQuery();
while(rs.next())
{ 
	String email = rs.getString("EMAIL");
	System.out.println("email@@@@"+email);
	
	PreparedStatement ps=con.prepareStatement("update request set status=? where username=? and filename=? and cloud=?");

	ps.setString(1,status);
	ps.setString(2,uname);
	ps.setString(3,fname);
	ps.setString(4,cloud);
	int i =ps.executeUpdate();
	try
	{
	if(i>0)
	{
		PreparedStatement ps2=con.prepareStatement("select * from transaction where FILEOWNERNAME=? and filename=?");
		ps2.setString(1,owner);
		ps2.setString(2,fname);
		ResultSet rs2 = ps2.executeQuery();
		if(rs2.next())
		{
			String key = rs2.getString("key");
			System.out.println("key@@@@"+key);
		// mail sending code
		//to=rs2.getString(5);
	try{
	String SMTP_HOST_NAME = "smtp.gmail.com";
	String SMTP_PORT = "465";
	String emailMsgTxt = "Test Message Contents";
	 String emailSubjectTxt = "A test from gmail";
	 String emailFromAddress = "v.rameshreddi@gmail.com"; 
	 String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
	// String   to=email;
	 boolean debug = true;
	 Properties props = new Properties();
	 props.put("mail.smtp.host", SMTP_HOST_NAME);
	 props.put("mail.smtp.auth", "true");
	 props.put("mail.debug", "true");
	 props.put("mail.smtp.port", SMTP_PORT);
	 props.put("mail.smtp.socketFactory.port", SMTP_PORT);
	 props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
	 props.put("mail.smtp.socketFactory.fallback", "false");
	 javax.mail.Session session1 = javax.mail.Session.getInstance(props,new javax.mail.Authenticator() {
	 protected PasswordAuthentication getPasswordAuthentication() {
	 return new PasswordAuthentication("v.rameshreddi@gmail.com", "r@me$hredd!");
	 }
	 });
	 session1.setDebug(debug);
	 Message msg = new MimeMessage(session1);
	 InternetAddress addressFrom = new InternetAddress(emailFromAddress); 
	 msg.setFrom(addressFrom);
	 InternetAddress addressTo =new InternetAddress(email);
	 msg.setRecipient(Message.RecipientType.TO, addressTo);
	 // Setting the Subject and Content Type
	 msg.setSubject("Message from Privacy Preserving Admin");
	 msg.setContent("Congratulations! you have successfully Recieved Key::'"+key+"'\n to ur mail id:: '"+email+"' ","text/plain");
	 
	 Transport.send(msg);
	 System.out.println("Message Send.....");
	}catch(Exception e){
		System.out.print(e);
	}
	    session.setAttribute("username",uname);
		response.sendRedirect("home.jsp");
	}
	}

	}
	catch(Exception e)
	{
	e.printStackTrace();	
	}
}
	%>


	</body>
	</html>