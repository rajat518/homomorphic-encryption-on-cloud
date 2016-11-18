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

  <script type="text/javascript">

</script>


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
            
			<br/><br/>
			
			<%
			     HttpSession ses=request.getSession();
			     String uname=(String)ses.getAttribute("username");
		    %>
			
			<h2><center><font color="red" size=5>Welcome to <%=uname%></font></center></h2>


			<%
				String cloud=request.getParameter("cname");

				session.setAttribute("cloudname",cloud);

				if(cloud==null)
				{
			%>
					<font color="red" size=4>Please Select Cloud</font>
			<%
				}
				else
				{
					response.sendRedirect("fileupload.jsp");
				}
			%>

			<br/><br/><br/>

			<%
				Connection con=null;
				Statement st=null;
				ResultSet rs=null;
				String path=null;

				String status="Active";

				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");

				st=con.createStatement();

				rs=st.executeQuery("select USERNAME	 from CLOUDDETAILS where status='"+status+"'");
			%>

			<div class="content_item">
		    <div class="form_settings">

			<form action="fileupload1.jsp" method="post">	
			
			<p>
				<span>Select cloud</span>
				
				<select name="cname">

				<%
					while(rs.next())
					{
			    %>				
						<option value="<%=rs.getString("USERNAME")%>"><%=rs.getString("USERNAME")%></option>
				<%
					}
				%>
				</select>
			</p>
            <p style="padding-top: 15px">
				<span>&nbsp;</span>
				<input class="submit" type="submit" name="contact_submitted" value="submit" onclick="return validation()"/>
			</p>
		</form>

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
