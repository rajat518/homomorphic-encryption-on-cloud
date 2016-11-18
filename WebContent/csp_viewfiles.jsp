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
           <li class="current"><a href="csphome.html" id="current">Home</a></li>
           <!--  <li><a href="processrequest.jsp">Process Users Requests</a></li> -->
			<li><a href="viewusers.jsp">User details</a></li>
			<li><a href="viewmemberdetails1.jsp">Data Owner Details</a></li>
			<li><a href="csp_viewfiles.jsp">View files</a></li>
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
            <h2><center><font color="red" size=5>Cloud Service Provider</font></center></h2>

			<table border=1 align="center">
						
						<tr>
							<th>
								<b>File Name</b>
							</th>
							<th>
								<b>Status</b>
							</th>
							<th>
								<b>Cloud</b>
							</th>
							<th>
								<b>Date</b>
							</th>
							<th>
								<b>Data Owner</b>
							</th>
					</tr>

<%
		String fname=null;
		String status=null;
		String cloud=null;
		java.sql.Date date=null;
		 String report=null;
		 String owner=null;

		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String path=null;

		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");
			String name=(String)session.getAttribute("username");

			st=con.createStatement();

			rs=st.executeQuery("select * from TRANSACTION");

			while(rs.next())
			{
				fname=rs.getString(2);
				status=rs.getString(3);
				cloud=rs.getString(1);
				date=rs.getDate(5);
				report=rs.getString(6);
				owner=rs.getString(7);

		%>
					</tr>
							<td>
								<%=fname%>
							</td>
							
							<td>
								<%=status%>
							</td>
							<td>
								<%=cloud%>
							</td>
							<td>
								<%=date%>
							</td>
							<td>
								<%=owner%>
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
