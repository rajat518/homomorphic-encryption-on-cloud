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
  <li class="current"><a href="adminhome.html" id="current">Home</a></li>
        <li><a href="createcloud.jsp" id="current">Create Cloud</a></li>
			<li><a href="editcloud.jsp">Edit Cloud</a></li>
			<li><a href="viewcloud.jsp">View Cloud</a></li>
			<li><a href="viewmemberdetails.jsp">Data Owner Details</a></li>
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


		  <table border=1  align="center">
						
						<tr>
							<th>
								<b>IP</b>
							</th>
							<th>
								<b>User Name</b>
							</th>
							<th>
								<b>Password</b>
							</th>
							<th>
								<b>Status</b>
							</th>
					</tr>

<%
		String ip=null;
		String uname=null;
		String pass=null;
		String status=null;

		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String path=null;

		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");

			st=con.createStatement();

			rs=st.executeQuery("select * from CLOUDDETAILS");

			while(rs.next())
			{
				ip=rs.getString(1);
				uname=rs.getString(2);
				pass=rs.getString(3);
				status=rs.getString(4);
		%>
					</tr>
							<td>
								<%=ip%>
							</td>
							
							<td>
								<%=uname%>
							</td>
							<td>
								<%=pass%>
							</td>
							<td>
								<%=status%>
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
		<a href="adminhome.html" id="current">Home</a>||
        <a href="createcloud.jsp" id="current">Create Cloud</a>||
		<a href="editcloud.jsp">Edit Cloud</a>||
		<a href="viewcloud.jsp">View Cloud</a>||
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
