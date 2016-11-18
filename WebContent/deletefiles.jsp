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
           <li class="current"><a href="home.jsp">Home</a></li>
            <li><a href="fileupload1.jsp" id="current">Upload Files</a></li>
			<li><a href="viewfiles.jsp">View files</a></li>
			<li><a href="reports.jsp">DownLoad Files</a></li>
			<li><a href="deletefiles.jsp">Delete Files</a></li>
			 <li><a href="processrequest.jsp">Process Users Requests</a></li>
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
			<h2><center><font color="red" size=5>Welcome to <%=uname%></font></center></h2>



			<%
		String msg=request.getParameter("msg5");

		if(msg!=null)
		{
	
   %> <center><font color="red" size=5><%=msg%></font></center>
	<%
		}
	%>


<table border=1 align="center">
						<tr>
							<th>
								<b>File Name</b>
							</th>
							<th>
								<b>Cloud</b>
							</th>
							<th>
								<b>Date</b>
							</th>
							<th>
								<b>Delete</b>
							</th>
					</tr>

<%
		String fname=null;
String status="Success";
String status19="DownLoad Success";
		String cloud=null;
		java.sql.Date date=null;
		 String report=null;

		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String path=null;

		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");

			String name=(String)session.getAttribute("username");

			st=con.createStatement();

			rs=st.executeQuery("SELECT USERNAME,FILENAME,tdate FROM TRANSACTION WHERE (status='"+status+"' or status='"+status19+"') and FILEOWNERNAME='"+name+"'");

			while(rs.next())
			{
				String sfname=rs.getString("filename");
				String scloud=rs.getString("USERNAME");
				java.sql.Date sdate=rs.getDate("tdate");


		%>
					</tr>
							<td>
								<%=sfname%>
							</td>
							<td>
								<%=scloud%>
							</td>
							<td>
								<%=sdate%>
							</td>
							<td>
								<a href="deletefile?fname=<%=sfname%>">Delete</a>
							</td>
					</tr>
		<%				
			}
	%>
						</table>



            	
          </div><!--close form_settings-->
		</div><!--close content_item-->
      </div><!--close content--> 
	 
	</div><!--close site_content-->  	
 
   <footer>
	  <a href="home.jsp">Home</a> |
	  <a href="editprofile.jsp">Edit Profile</a>|
	  <a href="viewprofile.jsp">View Profile</a> |
	  <a href="contactus.jsp">Contact Us</a><br/><br/>
	  website Designed by <a href="http://www.liveieeeprojects.com">www.liveieeeprojects.com</a>
    </footer>
	
  </div><!--close main-->
  
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>
  
</body>
</html>
