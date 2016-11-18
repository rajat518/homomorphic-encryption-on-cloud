
<html>
	<head>
		<title></title>

		<script type="text/javascript" async="" src="./Templates preview2_files/ga.js"></script>

		<link rel="stylesheet" href="./Templates preview2_files/style_new.css" type="text/css">

		<style type="text/css">
			html, body{ margin:0; padding:0; height:100%; }
		</style>
		<link rel="stylesheet" type="text/css" media="screen" href="style.css">
		
		<link href="ddmenu/ddmenu.css" rel="stylesheet" type="text/css" />
		<script src="ddmenu/ddmenu.js" type="text/javascript"></script>

<style>
	#sb{
		background:green;
		color:white;
	}
</style>
	</head>
	<body bgcolor="">

	<div id="container">
		<div id="header">
			<center><h1><font color="red" size=5><marquee>Enabling Data Dynamic and Indirect Mutual Trust for Cloud Computing Storage Systems</marquee></font></h1><center>
		</div>
		
		<div id="sideheader"></div>
			<div id="left_column">
				<div class="left_column_boxes">
					<h4>Navigation</h4>
					<div id="navcontainer">
						<ul id="navlist">
							<li id="active">
								<a href="userhome.jsp" id="current">Home
								</a>
							</li>
							<li>
								<a href="contactus1.jsp">Contact
							</a>
						</li>
						<li>
							<a href="services1.jsp">Services
							</a>
						</li>
					</ul>
				</div>
			</div>
    <div class="left_column_boxes">
     <h4>Cloud Operations</h4>

	 <table align="center" border=0 cellspacing=15 cellpadding=20>
	<tr>
		<td>
			<a href="viewfiles1.jsp">view files</a>
		</td>
	</tr>
</table>
				
    </div>
  </div>
 
  <div id="content">
		<%
			HttpSession ses=request.getSession();
			String uname=(String)ses.getAttribute("username");
		%>
<nav id="ddmenu">
    <ul>
        <li><font color="white" size=5>welcome to <%=uname%></font></li>
        <li>Account Settings
            <div class="dropToLeft2">
                <div class="column">
                    <b>
                        <font color="black" size=3><%=uname%></font></b>
                </div>
                <div class="column">
                    <b>
						<a href="editprofile1.jsp">Edit Profile</a>
						<a href="viewprofile1.jsp">View Profile</a>
						<form action="ulogout">
							<input type="submit" id="sb"value="Logout">
						</form>
					</b>
				</div>
            </div>
        </li>
    </ul>
</nav>


<br/><br/><br/><br/><br/><br/>

	<%
		String msg=request.getParameter("msg");

		if(msg!=null)
		{
	
   %> <center><font color="red" size=5><%=msg%></font></center>
	<%
		}

		String path=request.getParameter("path");

	%>
	<form action="download1.jsp">
		<table>
			<tr>
				<td>Enter Key to Download:</td>
				<td><input type="text" name="key"/></td>
			</tr>
			<tr>
				<td align="center" colspan=2><input type="submit" value="Download"></td>
			</tr>
		</table>	
	</form>

	<%
		String key=request.getParameter("key");

		if(key!=null)
		{
			String test="&key=";
			String finalpath=path+test+key;
		}
	%>
  </div>
</div>
</body></html>