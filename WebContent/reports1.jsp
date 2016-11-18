<%@page import="db.MyConnection"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html> 
<html>

<head>
  <title>PrivacyPreserving</title>
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
</head>

<body>
  <div id="main">		
    <header>
	  <nav>
	    <div id="menubar">
          <ul id="nav">
          <li class="current"><a href="userhome.jsp">Home</a></li>
			<li><a href="viewfiles1.jsp">View Files</a></li>
			<li><a href="reports1.jsp">DownLoad Files</a></li>
			<li><a href="viewstatus.jsp">Download Request Status</a></li>
			<li><a href="editprofile1.jsp">Edit Profile</a></li>
			<li><a href="viewprofile1.jsp">View Profile</a></li>
			<li><a href="logout">Logout</a></li>
			
          </ul>
        </div><!--close menubar-->	
      </nav>
	  <div id="banner">
	    <div id="welcome">
	      <h3>Privacy Preserving Deligated Access Control</h3>
	    </div><!--close welcome-->
	    <div id="welcome_slogan">
	      <h3><span><b>in</b></span>&nbsp;&nbsp;&nbsp;Public Clouds</h3>
	    </div><!--close welcome_slogan-->		
	  </div><!--close banner-->
    </header>
    
	<div id="site_content">	

	   <div id="content">
        <div class="content_item">
		  <div class="form_settings">
            <%
			     HttpSession ses=request.getSession();
			     String uname=(String)ses.getAttribute("username");
		    %>
			<h2><center><font color="red" >Welcome to <%=uname%></font></center></h2>


		<%
		String msg=request.getParameter("msg3");
		if(msg!=null)
		{
	
   %> <center><font color="red" ><%=msg%></font></center>
	<%
		}
		
		
		String msg1=request.getParameter("msg4");

		if(msg1!=null)
		{
	
   %> <center><font color="red" ><%=msg1%></font></center>
	<%
		}
%>
<table align="center" border=1 width="80%" cellpadding="3" cellspacing="5">
     
	 <tr>
          <th>FileName</th>

          <th>Cloud</th>

          <th>Date</th>
			<th>Data Owner</th>
          <th>Download</th>
     </tr>
<%
			try
			{
				
			String path=null;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");
			
			String name=(String)session.getAttribute("username");
	
			PreparedStatement pstm = null;

			String status="Success";
	
			String sql = "SELECT USERNAME,FILENAME,FILEOWNERNAME,tdate FROM TRANSACTION WHERE status='"+status+"'";
	
			pstm = con.prepareStatement(sql);
	
			ResultSet rs = pstm.executeQuery();
	
			while (rs.next())
			{

				String sfname=rs.getString("filename");
				String scloud=rs.getString("USERNAME");
				String owner=rs.getString("FILEOWNERNAME");
				java.sql.Date sdate=rs.getDate("tdate");

				String p1="downloadfile.jsp?ip=";
				String p11="filedownload?ip=";
				String p2="&file=";

				String spath=p1+scloud+p2+sfname;
				String spath11=p11+scloud+p2+sfname;
				System.out.println("spath11 is    "+spath11);

	%>
				<tr>

					<td><%=sfname%></td>
					<td><%=scloud%></td>
					<td><%=sdate%></td>
					<td align="center"><%=owner%></td>
					<td>
							<a href="requestfile.jsp?ip=<%=scloud%>&file=<%=sfname%>&owner=<%=owner%>&username=<%=uname%>" style="color: green">Click Here to Send Download Request</a>
						</td>
<%
			}
			}
     catch(Exception e)
     {
    	 e.printStackTrace();
     }
%>
   </table>  

            	
          </div><!--close form_settings-->
		</div><!--close content_item-->
      </div><!--close content--> 
	  
	  
	</div><!--close site_content-->  	
 	

   <footer>

    <a href="userhome.jsp">Home</a>|
	<a href="editprofile1.jsp">Edit Profile</a>|
	<a href="viewprofile1.jsp">View Profile</a>|
	<a href="contactus1.jsp">Contact Us</a>|
	<a href="logout">Logout</a>

	<br/><br/>
	  website Designed by <a href="http://www.liveieeeprojects.com">www.liveieeeprojects.com</a>
    </footer>
	
  </div><!--close main-->
  
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>
  
</body>
</html>
