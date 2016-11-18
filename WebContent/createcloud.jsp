<!DOCTYPE html> 
<html>

<head>
  <title>PrivacyPreserving</title>
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>

  <script type="text/javascript">

function validate()
{
	var cname=document.cform.cuser.value;
	var cip=document.cform.cip.value;
	var password=document.cform.cpassword.value;
	
	if(cname==null || cname=="")
	{
		alert("name mandatary");
		return false;
	}
	if(cip==null || cip=="")
	{
		alert("ip address is mandatary");
		return false;
	}
	if(password==null || password=="")
	{
		alert("password mandatary");
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
		  <%
			String msg=request.getParameter("msg1");

			if(msg!=null)
			{
		  %>
				<center><font color="red" ><%=msg%></font></center>
		  <%
		     }
	      %>

		  <form method="post" name="cform" action="createcloud">
         
		 <table width="90%" cellspacing=15 cellpadding=20 border=0 align="center">
             
			 <tr style="height: 40px;">
				<td>Cloud Ip:</td>
				<td>
					<input type="text" size="30" style="height: 25px;" name="cip"/>
				</td>
			</tr>
			
			<tr style="height: 40px;">
				<td>User Name</td>
				<td>
					<input type="text" size="30" style="height: 25px;" name="cuser"/>
				</td>
			</tr>
			<tr style="height: 40px;">
				<td>Password</td>
				<td>
					<input type="password" size="30" style="height: 25px;" name="cpassword"/>
				</td>
			</tr>
			<tr style="height: 40px;">
				<td>Status</td>
				<td>
					<input type="radio" name="cstatus" value="Active" checked="true"/> Active
                    <input type="radio" name="cstatus" value="Disable"/> Disable
				</td>
			</tr>
			<tr>
	<td colspan="2" align="center">
<input type="submit" value="Submit" size=30 style="width: 70px;" onclick="return validate()"/>&nbsp;&nbsp;&nbsp;&nbsp;
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
		<a href="adminhome.html" id="current">Home</a>||
        <a href="createcloud.jsp" id="current">Ceate Cloud</a>||
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
