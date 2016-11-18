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
			     String uname1=(String)ses.getAttribute("username");
		    %>
			<h2><center><font color="red" size=5>Welcome to <%=uname1%></font></center></h2>


			<%
		String msg=request.getParameter("msg8");

		if(msg!=null)
		{
	
   %> <center><font color="red" size=5><%=msg%></font></center>
	<%
		}
	%>

<table border=1 align="center">
						
						<tr>
							<th>
								<b>username</b>
							</th>
							<th>
								<b>filename</b>
							</th>
							<th>
								<b>Cloud</b>
							</th>
							<th>
								<b>Validate</b>
							</th>
					</tr>

<%
		String uname=null;
		String cloud=null;
		 String fname=null;
		 String owner=null;

		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String path=null;

		
			String status1="waiting";

			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");
			String name=(String)session.getAttribute("username");

			st=con.createStatement();

			rs=st.executeQuery("select * from request where STATUS='"+status1+"'");

			while(rs.next())
			{
				uname=rs.getString(1);
				fname=rs.getString(2);
				cloud=rs.getString(3);

				String url1="validate.jsp?user=";
				String url2="&fname=";
				String url3="&cloud=";
				String url4="&owner=";

				String url=url1+uname+url2+fname+url3+cloud;

		%>
					</tr>
							<td>
								<%=uname%>
							</td>
							
							<td>
								<%=fname%>
							</td>
							<td>
								<%=cloud%>
							</td>
							<td>
								<a href="<%=url%>&msg=<%=uname1%>">process request
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
