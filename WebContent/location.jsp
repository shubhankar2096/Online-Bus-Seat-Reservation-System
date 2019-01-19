<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Welcome to Florida Bus Services</title>
<link rel="stylesheet" type="text/css" href="xres/css/style.css" />
<link rel="icon" type="image/png" href="xres/images/favicon.png" />
<link type="text/css" href="css/styles.css" rel="stylesheet" media="all" />
</head>
<body>
	<div id="wrapper">
	<div id="header">
    <h1><a href="#"><img src="xres/images/logo.png" class="logo" alt="James Buchanan Pub and Restaurant" /></a></h1>
        <ul id="mainnav">
        	<%
            	Integer user_id=(Integer)session.getAttribute("user_id");
            	//System.out.println("User_Id:"+user_id);
            	if(user_id!=null)
            	{%>
            		<li><a href="index1.jsp">Home</a></li>
            		<li><a href="history.jsp">History</a></li>
            	<% }
            	else
            	{ %>
            		<li><a href="index.html">Home</a></li>
            	<% }
            %>
            <!--  <li><a href="about.html">About Us</a></li> -->
            <li><a href="routes.jsp">Routes</a></li>
            <li class="current"><a href="location.jsp">location</a></li>
            <li><a href="contact.jsp">Contact Us</a></li>
             <%
            	//Integer user_id=(Integer)session.getAttribute("user_id");
            	//System.out.println("User_Id:"+user_id);
            	if(user_id!=null)
            	{%>
            		<li><a href="LogOut.jsp">Logout</a></li>
            	<% }
            %>
    	</ul>
	</div>
    <div id="content">
    	<div id="gallerycontainer">
			<div class="portfolio-area" style="margin:0 auto; padding:140px 20px 20px 20px; width:820px;">	
			<iframe width="100%" height="390" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.ph/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Florida+Bus+Terminal,+West+Kamias,+Quezon+City,+Metro+Manila&amp;aq=0&amp;oq=floridBarangay+West+Kamias,+Cubao,+Quezon+City,+Metro+Manila&amp;sll=14.630676,121.047814&amp;sspn=0.011772,0.021136&amp;t=h&amp;ie=UTF8&amp;hq=&amp;hnear=Florida+Bus+Terminal,+Quezon+City,+Metro+Manila&amp;ll=14.630676,121.047814&amp;spn=0.011772,0.021136&amp;z=14&amp;output=embed"></iframe><br /><small><a href="https://maps.google.com.ph/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Florida+Bus+Terminal,+West+Kamias,+Quezon+City,+Metro+Manila&amp;aq=0&amp;oq=floridBarangay+West+Kamias,+Cubao,+Quezon+City,+Metro+Manila&amp;sll=14.630676,121.047814&amp;sspn=0.011772,0.021136&amp;t=h&amp;ie=UTF8&amp;hq=&amp;hnear=Florida+Bus+Terminal,+Quezon+City,+Metro+Manila&amp;ll=14.630676,121.047814&amp;spn=0.011772,0.021136&amp;z=14" style="color:#0000FF;text-align:left">View Larger Map</a></small>
			
				<div class="column-clear"></div>
            </div>
			<div class="clearfix"></div>
        </div>
    </div>
    



<div id="footer">
	<h4>+63(2)3525393 &bull; <a href="contact-us.php">616 Deccan FC Road, Pune - 411002  </a></h4>
	<p>Hours of Operation&nbsp;&nbsp;&bull;&nbsp;&nbsp;Mon - Sun: 10:00 am - 12:00 am</p>
	<a href="index.php"><img src="xres/images/footer-logo.jpg" alt="James Buchanan Pub and Restaurant" /></a>
	<p>&copy; Copyright 2019 Florida Bus Services | All Rights Reserved <br /></p>
</div>

</div>
</body>
</html>