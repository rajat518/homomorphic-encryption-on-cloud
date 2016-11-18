<!DOCTYPE html> 
<html>

<head>
  <title>PrivacyPreserving</title>
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>

	<link rel="stylesheet" type="text/css" media="all" href="jsDatePick_ltr.min.css"/>

	<script type="text/javascript" src="jsDatePick.min.1.3.js"></script>

	<script type="text/javascript">

		window.onload = function(){
		new JsDatePick({
			useMode:2,
			target:"inputField",
			dateFormat:"%d-%M-%Y"
			});
		};

		</script>

		<script type="text/javascript">
	function mylogin()
	{
		var uname=document.rlogin.uname.value;
		var pwd=document.rlogin.pwd.value;

		if(uname==null || uname=="")
		{
			alert("user name mandatary");
			return false;
		}
		if(pwd==null || pwd=="")
		{
			alert("password mandatary");
			return false;
		}
		
	}
</script>
		<script type="text/javascript">
function validation()
{
	var name=document.myform.name.value;
	var uname=document.myform.uname.value;
	var pwd=document.myform.pwd.value;
	var repwd=document.myform.repwd.value;
	var email=document.myform.email.value;
	var answer=document.myform.answer.value;
	var pno=document.myform.pno.value;
	var city=document.myform.city.value;
	var dob=document.myform.dob.value;

	if(uname==null || uname=="")
	{
		alert("user name mandatary");
		return false;
	}
	if(name==null || name=="")
	{
		alert("name mandatary");

		return false;
	}
	if(pwd==null || pwd=="")
	{
		alert("password mandatary");
		return false;
	}
	if(repwd==null || repwd=="")
	{
		alert("Re Enter password mandatary");
		return false;
	}

	if(repwd!=pwd)
	{
		alert("password and Re Enter password should match");
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

	if(dob==null || dob=="")
	{
		alert("date of birth mandatary");
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
		alert(pno.length);

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
            <li class="current"><a href="index.jsp">Home</a></li>
            <li><a href="aboutus.html">AboutUs</a></li>
            <li><a href="services.html">OurServices</a></li>
            <li><a href="contact.jsp">Contact Us</a></li>
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
	
	  <div class="sidebar_container">       
		<div class="sidebar">
          <div class="sidebar_item">
            <h2>User Registration</h2>
            <p><a href="userregistration.jsp" i style="color: red">Register Here</a></p>
          </div><!--close sidebar_item--> 
        </div><!--close sidebar-->     		
		<div class="sidebar">
          <div class="sidebar_item">

		  <%
				String msg1=request.getParameter("msg1");

				if(msg1!=null)
				{
	
		 %>
					<h2><%=msg1%></h2>
		 <%
				}
				else
				{
		    %>
					<h2>Login Here</h2>
			<%
				}
			%>
			<form id="login" name="rlogin" method="post" action="./login" >

			
			<p>
				<span>User Name</span>
				
				<input type="text" name="uname"/>
			</p>
			<p>
				<span>Password</span>
				
				<input type="password" name="pwd"/>
			</p>

			<p>
				<span>Select User Type</span>
				
				<select name="ltype" style="width: 140px;">
					
					<option value="user">User</option>
					
					<option value="dataowner">Data Owner</option>
					
					<option value="csp">CSP</option>
					
					<option value="admin">Admin</option>
				
				</select>

			</p>
				<br/><input style="height:30px;width:100px"type="submit" name="submit" value="Login" onclick="return mylogin()"/>
		</form>
		  </div><!--close sidebar_item--> 
        </div><!--close sidebar-->
		 		
        <div class="sidebar">
          <div class="sidebar_item">
            <h2>Contact</h2>
            <p>Phone: +9246588912</p>
            <p>Email: <a href="dsnrorbit@gmail.com">dsnrorbit@gmail.com</a></p>
          </div><!--close sidebar_item--> 
        </div><!--close sidebar-->
       </div><!--close sidebar_container-->		

      <div class="slideshow">
	    <ul class="slideshow">
          <li class="show"><img width="680" height="250" src="images/home_1.jpg" alt="&quot;Security as a Service,PlatForm as a Service&quot;" /></li>
          <li><img width="680" height="250" src="images/home_2.jpg" alt="&quot;Storage as a service,Infrastracture as a service&quot;" /></li>
        </ul> 
	  </div> 
	   
	   <div id="content">
        <div class="content_item">
		  <div class="form_settings">
            
			 <%
				String msg=request.getParameter("msg");

				if(msg!=null)
				{
	
		    %>
					<h2 i style="color: green"><%=msg%></h2>
		    <%
				}
				else
				{
		    %>
					<h2>Data Owner Registration</h2>
			<%
				}	
			%>

            <p style="padding-bottom: 15px;">you can access our services by registring here</p>           
		 
	<form id="login" name="myform" method="post" class="form_settings" action="registration">	
			
			<p>
				<span>Name</span>
				
				<input class="contact" type="text" name="name"/>
			</p>

			<p>
				<span>User Name</span>
				
				<input class="contact" type="text" name="uname"/>
			</p>
			<p>
				<span>Date of Birth</span>

				<input type="text" class="contact" id="inputField" readonly size="30" name="dob">
				<br/>
			</p>

			<p>
				<span>Password</span>
				
				<input class="contact" type="text" name="pwd"/>
			</p>
			<p>
				<span>Re-Enter Password</span>
				
				<input class="contact" type="text" name="repwd"/>
			</p>
            <p>
				<span>Email Address</span>
				
				<input class="contact" type="text" name="email"/>
			</p>

			<p>
				<span>Gender</span>				
				<input class="contact" type="radio" name="gender" value="male" value="select" checked="true"/>Male		
				<input class="contact" type="radio" name="gender" value="female"/>Female
			</p>
			
			<p>
				<span>Security Question</span>
				<select name="question">
					
					<option value="nickname" class="contact">what is your nick name</option>

					<option value="dish" class="contact">what is your favorite dish</option>

					<option value="teacher" class="contact">what is your first teacher name</option>

				</select>

			</p>

            <p>
				<span>Answer</span>
				<input type="text" class="contact" size="30" name="answer">

			</p>

			<p>
				<span>Phone No</span>
				<input type="text" class="contact" name="pno">

			</p>
			<p>
				<span>City</span>
				<input type="text" class="contact" size="30" name="city">
			</p>
            <p style="padding-top: 15px">
				<span>&nbsp;</span>
				<input class="submit" type="submit" name="contact_submitted" value="Register" onclick="return validation()"/>
			</p>
		</form>

          </div><!--close form_settings-->
		</div><!--close content_item-->
      </div><!--close content-->   
	</div><!--close site_content-->  	
 	

   <footer>
	  <a href="index.jsp">Home</a> | <a href="aboutus.html">AboutUs</a> | <a href="services.html">OurServices</a> | <a href="contact.jsp">Contact Us</a><br/><br/>
	  website Designed by <a href="http://www.liveieeeprojects.com">www.liveieeeprojects.com</a>
    </footer>
	
  </div><!--close main-->
  
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>
  
</body>
</html>
