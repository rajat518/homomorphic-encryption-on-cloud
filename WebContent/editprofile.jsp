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
	var name=document.myform.name.value;
	var email=document.myform.email.value;
	var pno=document.myform.pno.value;
	var city=document.myform.city.value;
	var answer=document.myform.answer.value;

	if(name==null || name=="")
	{
		alert("name mandatary");
		return false;
	}

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
	if(answer==null || answer=="")
	{
		alert("answer mandatary");
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

	if(city==null || city=="")
	{
		alert("city mandatary");
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
            <li class="current"><a href="home.jsp">Home</a></li>
            <li><a href="fileupload1.jsp" id="current">fileupload</a></li>
			<li><a href="viewfiles.jsp">view files</a></li>
			<li><a href="reports.jsp">File DownLoad</a></li>
			<li><a href="deletefiles.jsp">Delete Files</a></li>
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
		String pno=null;
		String city=null;

		String username=null;
		String password=null;


		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String path=null;

			ServletContext sc=getServletContext();

			path=sc.getRealPath("\\WEB-INF\\classes\\myprop.properties");

			System.out.println("path============"+path);

			con=MyConnection.getConnection(path);

			HttpSession myses = request.getSession() ;   

			username=(String)myses.getAttribute("username");
			
			password=(String)myses.getAttribute("password");

	%>
	<%
			ps=con.prepareStatement("select * from registration where uname=? and pwd=?");

			ps.setString(1,username);
			ps.setString(2,password);

			rs=ps.executeQuery();

			while(rs.next())
			{
				name=rs.getString(1);
				email=rs.getString(4);
				pno=rs.getString(9);
				city=rs.getString(10);
			}
	%>

	<form action="editprofile" method="post" name="myform">
<table align="center" border=0 cellspacing=20 cellpadding=25>
						
						<tr>
							<td>
								<font size=4>* Name</font>
							</td>

							<td>
								<input type="text" class="fields_contact_us" size="30" name="name" value="<%=name%>"/>
							</td>
						</tr>


						<tr>
							<td>
								<font size=4>* Email</font>
							</td>

							<td>
								<input type="text" class="fields_contact_us" size="30" name="email" value="<%=email%>"/>
							</td>
						</tr>

						<tr>
							<td>
								<font size=4>*Security Question</font>
							</td>

							<td>
								<select class="fields_contact_us" name="question">
									<option value="nickname" class="fields_contact_us">what is your nick name</option>
									<option value="dish" class="fields_contact_us">what is your favorite dish</option>
									<option value="teacher" class="fields_contact_us">what is your first teacher name</option>
								</select>
							</td>
						</tr>

						<tr>
							<td>
								<font size=4>*Answer</font>
							</td>

							<td>
								<input type="text" class="fields_contact_us" size="30" name="answer">
							</td>
						</tr>

						<tr>
							<td>
								<font size=4>* Phone No</font>
							</td>

							<td>
								<input type="text" class="fields_contact_us" size="30" name="pno" value="<%=pno%>">
							</td>
						</tr>

						<tr>
							<td>
								<font size=4>* City</font>
							</td>

							<td>
								<input type="text" class="fields_contact_us" size="30" name="city" value="<%=city%>">
							</td>
						</tr>
						<tr><td colspan="2" align="center">
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
