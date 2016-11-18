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

function validate()
{
	var pass=document.ecloud.pass.value;
	
	if(pass==null || pass=="")
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
		Connection con=null;
		Statement st=null;
		Statement st1=null;
		ResultSet rs=null;
		ResultSet rs1=null;
		String path=null;

		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");

			st1=con.createStatement();

			rs1=st1.executeQuery("select username from CLOUDDETAILS");
%>
<form name="ip" action="editcloud.jsp">

<table align="left" border=0 cellspacing=10 cellpadding=15>
	
	<tr>
		<td>
			<b>Select ip</b>
		</td>
		<td>
			<select name="ip">

			<%
			while(rs1.next())
			{
%>				
<option value="<%=rs1.getString("username")%>"><%=rs1.getString("username")%></option>
<%
			}
%>
			</select>
		  </td>
		</tr>
		<tr>
		<td colspan=2 align="center">
			<input type="submit" value="Submit"/>
		</td>
	</table>
</form>
	<%
		String msg=request.getParameter("msg2");

		if(msg!=null)
		{
	
   %>   <center><font color="red" size=5><%=msg%></font></center>
	<%
		}
	%>
<form name="ecloud" action="editcloud" method="post">

<table align="left" border=0 cellspacing=10 cellpadding=15>	

<%
		String ip=null;
		String username=null;
		String password=null;
		String status=null;
		String check="Active";

			st=con.createStatement();

		String rip=request.getParameter("ip");

			rs=st.executeQuery("select * from CLOUDDETAILS where username='"+rip+"'");
%>
<%
			if(rs.next())
			{
				ip=rs.getString(1);
				username=rs.getString(2);
				password=rs.getString(3);
				status=rs.getString(4);

				if(status.equals(check))
				{
					check="Disable";
				}
				else
				{
					check="Active";
				}
%>
				<tr>
					<td>
						<b>cloud ip</b>
					</td>
					<td>
						<input type="text" name="ip" size=5 value="<%=ip%>" readonly>
					</td>
				</tr>
				<tr>
					<td>
						<b>username</b>
					</td>
					<td>
						<input type="text" name="uname" size=5 value="<%=username%>" readonly>
					</td>
				</tr>
				<tr>
					<td>
						<b>password</b>
					</td>
					<td>
						<input type="text" name="pass" size=5 value="<%=password%>">
					</td>
				</tr>
				<tr>
					<td>
						<b>status</b>
					</td>
					<td>
						<select name="status">
							<option value="<%=status%>"><%=status%></option>
							<option value="<%=check%>"><%=check%></option>
						  </select>
					  </td>
				  </tr>
				  <tr>
					  <td colspan=2 align="center">
						<input type="submit" value="Update" onclick="return validate()"/>
					   </td>
				 </tr>
	<%
			}					
	%>
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
