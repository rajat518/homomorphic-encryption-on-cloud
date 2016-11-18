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
			String val = request.getParameter("ip");

            String file = request.getParameter("file");	
            System.out.println(val+"ZZZZZZZZZZZZZZZZZZZZZZZZZZZ");
            System.out.println(file+"ZZZZZZZZZZZZZZZZZZZZZZZZZZ");
/* String url ="newdownload.jsp?ip="+val+"&file="+file;
System.out.println(url); */
            session.setAttribute("ip", val);
            session.setAttribute("file", file);
			%>
			<form action="newdownload.jsp">
		<table align="center">
			<tr>
				<td>Enter Key to Download:</td>
				<td><input type="text" name="key"/></td>
			</tr>
			<tr><td align="center" colspan=2><input type="submit" value="Download"></td></tr>
		</table>	
	</form>
            	
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
	  Website Designed by <a href="http://www.liveieeeprojects.com">www.liveieeeprojects.com</a>
    </footer>
	
  </div><!--close main-->
  
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>
  
</body>
</html>
