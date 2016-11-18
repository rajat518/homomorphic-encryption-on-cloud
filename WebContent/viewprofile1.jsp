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
			<h2><center><font color="red" size=5>Welcome to <%=uname%></font></center></h2>


		<%
		String name=null;
		String email=null;
		String gen=null;
		String question=null;
		String answer=null;
		String pno=null;
		String city=null;
		String dob=null;
		
		String username=null;
		String password=null;

		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String path=null;

		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");

			HttpSession myses = request.getSession() ;   

		username=(String)myses.getAttribute("username");
			
		password=(String)myses.getAttribute("password");

			ps=con.prepareStatement("select * from USERREGISTRATION where uname=? and pwd=?");

			ps.setString(1,username);
			ps.setString(2,password);

			rs=ps.executeQuery();

			while(rs.next())
			{
				name=rs.getString(1);
				email=rs.getString(4);
				gen=rs.getString(5);
				dob=rs.getString(6);
				question=rs.getString(7);
				answer=rs.getString(8);
				pno=rs.getString(9);
				city=rs.getString(10);
			}
		
	%>



	<table align="center" border=0 cellspacing="30" cellpadding=25>
						
						<tr>
							<td>
								<font size=4>* Name</font>
							</td>

							<td>
								<%=name%>
							</td>
						</tr>


						<tr>
							<td>
								<font size=4>* Email</font>
							</td>

							<td>
								<%=email%>
							</td>
						</tr>

						<tr>
							<td>
								<font size=4>Gender</font>
							</td>
								
							<td>
								<%=gen%>
							</td>

						</tr>
						<tr>
							<td>
								<font size=4>*Date of Birth</font>
							</td>

							<td>
								<%=dob%>
							</td>
						</tr>

						<tr>
							<td>
								<font size=4>*Security Question</font>
							</td>

							<td>
								<%=question%>
							</td>
						</tr>

						<tr>
							<td>
								<font size=4>*Answer</font>
							</td>

							<td>
								<%=answer%>
							</td>
						</tr>

						<tr>
							<td>
								<font size=4>* Phone No</font>
							</td>

							<td>
								<%=pno%>
							</td>
						</tr>

						<tr>
							<td>
								<font size=4>* City</font>
							</td>

							<td>
								<%=city%>
							</td>
						</tr>
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
