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
function validation()
{
	var email=document.myform.email.value;
	var pno=document.myform.pno.value;
	var message=document.myform.message.value;

	if(email==null || email=="")
	{
		alert("email mandatary");
		return false;
	}
	else
	{
		var atpos=email.indexOf("@");
	
		var dotpos=email.lastIndexOf(".");
		
		if (atpos<1 || dotpos<atpos+2|| dotpos+2>=email.length)
		{
			alert("Not a valid e-mail address");
			return false;
		}
	}
	if(message==null || message=="")
	{
		alert("please enter message");
		return false;
	}
	if(pno==null || pno=="")
	{
		alert("pnone no mandatary");
		return false;
	}
	if(isNaN(pno))
	{
			alert("phone no should not have any character");
			return false;
	}

	if(pno.length!=10)
	{
		alert("phone no should have 10 numbers");
		return false;
	}
}
</script>


</head>

<body>
  <div id="main">		
    <header>
	  <nav>
	    <div id="menubar">
          <ul id="nav">
            <li class="current"><a href="userhome.jsp">Home</a></li>
			<li><a href="viewfiles1.jsp">view files</a></li>
			<li><a href="reports1.jsp">File DownLoad</a></li>
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
		String msg=request.getParameter("msg6");

		if(msg!=null)
		{
	
   %> <center><font color="red" size=5><%=msg%></font></center>
	<%
		}
	%>

<center>
   <table align="center" border=0>
						
						<tr>
							<td>
							</td>
							<td>
								<img src="img/contact.jpg"/>
							</td>
						</tr>
			</table>
</center>
<form action="contact1" method="post" name="myform">
                        <table align="center" border=0 cellspacing=15 cellpadding=20>
						
						<tr>
							<td>
								<font size=4>* Email</font>
							</td>

							<td>
								<input type="text" class="fields_contact_us" size="30" name="email">
							</td>
						</tr>
						<tr>
							<td>
								<font size=4>* Phone No</font>
							</td>

							<td>
								<input type="text" class="fields_contact_us" size="30" name="pno">
							</td>
						</tr>

						<tr>
							<td>
								<font size=4>* Message</font>
							</td>

							<td>
								<textarea  size="25" name="message" rows=5 cols=10></textarea>
							</td>
						</tr>
						<tr>
						
						<td colspan="2" align="center">
<input type="submit" value="Submit" size=30 style="width: 70px;" onclick="return validation()"/>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="Clear" size=30 style="width: 70px;"/>
				</td>
						</tr>
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
	  website Designed by <a href="http://www.liveieeeprojects.com">www.liveieeeprojects.com</a>
    </footer>
	
  </div><!--close main-->
  
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>
  
</body>
</html>
