<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Welcome to FLorida Bus Services</title>
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
            <li class="current"><a href="routes.jsp">Routes</a></li>
            <li><a href="location.jsp">Location</a></li>
            <li><a href="contact.jsp">Contact Us</a></li>
            <%
            	/*Integer user_id=(Integer)session.getAttribute("user_id");*/
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
					<table cellspacing="0" cellpadding="0" border="0" style="width: 449px;"><colgroup><col width="136"> <col width="179"> <col width="134"> </colgroup>
<tbody>
<tr>
<td width="136" height="24" class="xl65"><span style="color: #000000;">ORIGIN:</span></td>
<td width="179" class="xl66"><span style="color: #000000;">PUNE,&nbsp; MAHARASHTRA</span></td>
<td width="134" class="xl67">&nbsp;</td>
</tr>
<tr>
<td width="136" height="22" class="xl66"><span style="color: #000000;">DESTINATION</span></td>
<td width="179" class="xl67"><span style="color: #000000;">DEPARTURE</span></td>
<td width="134" class="xl67"><span style="color: #000000;">TYPE</span></td>
</tr>
<tr>
<td width="136" height="22" class="xl69"><span style="color: #000000;">MUMBAI</span></td>
<td width="179" class="xl70"><span style="color: #000000;">10:30AM</span></td>
<td width="134" class="xl71"><span style="color: #000000;">DE LUXE</span></td>
</tr>
<tr>
<td width="136" height="22" class="xl69"><span style="color: #000000;">MUMBAI</span></td>
<td width="179" class="xl70"><span style="color: #000000;">6:00PM</span></td>
<td width="134" class="xl71"><span style="color: #000000;">DE LUXE</span></td>
</tr>
<tr>
<td width="136" height="22" class="xl69"><span style="color: #000000;">CHENNAI</span></td>
<td width="179" class="xl70"><span style="color: #000000;">6:30AM</span></td>
<td width="134" class="xl71"><span style="color: #000000;">SEMI DE LUXE</span></td>
</tr>

<tr>
<td width="136" height="22" class="xl69">&nbsp;</td>
<td width="179" class="xl68">&nbsp;</td>
<td width="134" class="xl68">&nbsp;</td>
</tr>
<tr>
<td width="136" height="22" class="xl69">&nbsp;</td>
<td width="179" class="xl68">&nbsp;</td>
<td width="134" class="xl68">&nbsp;</td>
</tr> 

<tr>
<td width="136" height="22" class="xl65"><span style="color: #000000;">ORIGIN:</span></td>
<td width="179" class="xl66"><span style="color: #000000;">MUMBAI, MAHARASHTRA</span></td>
<td width="134" class="xl67">&nbsp;</td>
</tr>
<tr>
<td width="136" height="22" class="xl66"><span style="color: #000000;">DESTINATION</span></td>
<td width="179" class="xl67"><span style="color: #000000;">DEPARTURE</span></td>
<td width="134" class="xl67"><span style="color: #000000;">TYPE</span></td>
</tr>
<tr>
<td width="136" height="22" class="xl69"><span style="color: #000000;">PUNE</span></td>
<td width="179" class="xl68"><span style="color: #000000;">6:30AM</span></td>
<td width="134" class="xl71"><span style="color: #000000;">AIR CON</span></td>
</tr>
<tr>
<tr>
<td width="136" height="22" class="xl69"><span style="color: #000000;">PUNE</span></td>
<td width="179" class="xl68"><span style="color: #000000;">12:30PM</span></td>
<td width="134" class="xl71"><span style="color: #000000;">DE LUXE</span></td>
</tr>
<tr>
<td width="136" height="22" class="xl69"><span style="color: #000000;">PUNE</span></td>
<td width="179" class="xl68"><span style="color: #000000;">7:30PM</span></td>
<td width="134" class="xl71"><span style="color: #000000;">SEMI DE LUXE</span></td>
</tr>
<tr>
<td width="136" height="22" class="xl69"><span style="color: #000000;">CHENNAI</span></td>
<td width="179" class="xl68"><span style="color: #000000;">1:30PM</span></td>
<td width="134" class="xl71"><span style="color: #000000;">SEMI DE LUXE</span></td>
</tr>
<tr>
<td width="136" height="22" class="xl69"><span style="color: #000000;">CHENNAI</span></td>
<td width="179" class="xl68"><span style="color: #000000;">10:30PM</span></td>
<td width="134" class="xl71"><span style="color: #000000;">AIR CON</span></td>
</tr>
<!--  <tr>
<td width="136" height="22" class="xl69"><span style="color: #000000;">CAGAYAN</span></td>
<td width="179" class="xl68"><span style="color: #000000;">7:00PM</span></td>
<td width="134" class="xl71"><span style="color: #000000;">SUPER DELUXE</span></td>
</tr>
<tr>
<td width="136" height="22" class="xl69"><span style="color: #000000;">CAGAYAN</span></td>
<td width="179" class="xl68"><span style="color: #000000;">9:15PM</span></td>
<td width="134" class="xl71"><span style="color: #000000;">SUPER DELUXE</span></td>
</tr>
<tr>
<td width="136" height="22" class="xl69"><span style="color: #000000;">LAOAG</span></td>
<td width="179" class="xl68"><span style="color: #000000;">10:00PM</span></td>
<td width="134" class="xl71"><span style="color: #000000;">SLEEPER</span></td>
</tr>
<tr>
<td width="136" height="22" class="xl69"><span style="color: #000000;">LAOAG</span></td>
<td width="179" class="xl68"><span style="color: #000000;">8:45PM</span></td>
<td width="134" class="xl71"><span style="color: #000000;">DELUXE</span></td>
</tr> -->

<tr>
<td width="136" height="22" class="xl69">&nbsp;</td>
<td width="179" class="xl68">&nbsp;</td>
<td width="134" class="xl71">&nbsp;</td>
</tr>
<tr>
<td height="22">&nbsp;</td>
<td width="179" class="xl68">&nbsp;</td>
<td width="134" class="xl71">&nbsp;</td>
</tr>

<tr>
<td width="136" height="22" class="xl65"><span style="color: #000000;">ORIGIN:</span></td>
<td width="179" class="xl66"><span style="color: #000000;">CHENNAI, TAMILNADU</span></td>
<td width="134" class="xl67">&nbsp;</td>
</tr>
<tr>
<td width="136" height="22" class="xl66"><span style="color: #000000;">DESTINATION</span></td>
<td width="179" class="xl67"><span style="color: #000000;">DEPARTURE</span></td>
<td width="134" class="xl67"><span style="color: #000000;">TYPE</span></td>
</tr>
<tr>
<td width="136" height="22" class="xl69"><span style="color: #000000;">PUNE</span></td>
<td width="179" class="xl68"><span style="color: #000000;">7:30AM</span></td>
<td width="134" class="xl71"><span style="color: #000000;">DELUXE</span></td>
</tr>
<tr>
<td width="136" height="22" class="xl69"><span style="color: #000000;">MUMBAI</span></td>
<td width="179" class="xl68"><span style="color: #000000;">10:00AM</span></td>
<td width="134" class="xl71"><span style="color: #000000;">DELUXE</span></td>
</tr>
<!-- <tr>
<td height="22"><span style="color: #000000;">CAGAYAN</span></td>
<td width="179" class="xl68"><span style="color: #000000;">5:00PM</span></td>
<td width="134" class="xl71"><span style="color: #000000;">AIRCON</span></td>
</tr> -->
<tr>
<td height="20">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
</tbody>
</table>
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