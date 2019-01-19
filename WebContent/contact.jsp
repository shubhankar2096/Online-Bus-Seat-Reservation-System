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
            <li><a href="routes.jsp">Routes</a></li>
            <li><a href="location.jsp">location</a></li>
            <li class="current"><a href="contact.jsp">Contact Us</a></li>
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
				<div id="contactleft">
					FLORIDA BUS<br>
(G.V. FLORIDA TRANSPORT, INCORPORATED)<br>
616 DECCAN, FC ROAD, PUNE, MAHARASHTRA, 411030<br>
Phone:  +63(2)3525393<br><br>

FLORIDA BUS<br>
(G.V. FLORIDA TRANSPORT, INCORPORATED)<br>
Lacson Avenue Corner ,Ranade Road, Dadar, Mumbai<br>
Florida Bus Co., Mumbai<br>
- (02) 743-3809; 912-5354<br>
Telephone No: (632) 781-5894<br><br>


Florida Bus Terminal in Chennai, Tamilnadu by G.V. Florida Transport, Inc.<br>
Location: Diversion Road, Pengue-Ruyu Chennai<br><br>

Contact Numbers:<br>
Florida Bus Company Tuguegarao<br>
-  +63 (078) 846 4259; (078) 846-2265<br>
				</div><br>
				<div id="contactright">
					<h3>Message Form</h3>
					<form class="validate" action="messageex" method="post">
                        <p>
                            <label for="name" class="required label">Name:</label><br>
                            <input id="name" class="contactform" type="text" name="name" />
                        </p>
                        <p>
                            <label for="email" class="required label">Email:</label><br>
                            <input id="email" class="contactform" placeholder="Example: john@doe.com" type="text" name="email" />
                        </p>
                        <p>
                            <label for="subject" class="required label">Subject:</label><br>
                            <input id="subject" class="contactform" type="text" name="subject" />
                        </p>
                        <p>
                            <label id="message-label" for="message" class="required label">Message:</label><br>
                            <textarea id="message" class="contactform" name="message" cols="28" rows="5"></textarea>
                        </p>
                        <p>
                            <label></label>
                            <input class="contactform" id="submit-button" type="submit" name="Submit" value="Submit" style="height: 35px;" />
                        </p>
                    </form>
				</div>
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