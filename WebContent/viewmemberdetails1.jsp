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

    <center>
			<table border=1 >
						
						<tr>
							<th>
								<b>Name</b>
							</th>
							<th>
								<b>Email</b>
							</th>
							<th>
								<b>Date of Birth</b>
							</th>
							<th>
								<b>Phone No</b>
							</th>
							<th>
								<b>City</b>
							</th>
					</tr>

<%
		String name=null;
		String email=null;
		String pno=null;
		String city=null;
		String dob=null;

		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String path=null;

		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");
	%>

	<%
			st=con.createStatement();

			rs=st.executeQuery("select * from registration");

			while(rs.next())
			{
				name=rs.getString(1);
				email=rs.getString(4);
				dob=rs.getString(6);
				pno=rs.getString(9);
				city=rs.getString(10);
			
		%>
					</tr>
							<td>
								<%=name%>
							</td>
							
							<td>
								<%=email%>
							</td>
							<td>
								<%=dob%>
							</td>
							<td>
								<%=pno%>
							</td>
							<td>
								<%=city%>
							</td>
					</tr>
		<%				
			}
	%>
						</table>
</center>

            	
          </div><!--close form_settings-->
		</div><!--close content_item-->
      </div><!--close content--> 
	  
	  
	</div><!--close site_content-->  	
 	

   <footer>

   <a href="csphome.html">Home</a>|
   <a href="processrequest.jsp">Process Users Requests</a>|
   <a href="viewusers.jsp">user details</a>|
   <a href="viewmemberdetails1.jsp">View Data Owner Details</a>|
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
