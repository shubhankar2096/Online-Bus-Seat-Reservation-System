<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Florida Bus Services</title>
<link rel="stylesheet" type="text/css" href="xres/css/style.css" />
<link rel="icon" type="image/png" href="xres/images/favicon.png" />
<!--[if IE 6]><style type="text/css"> * html img { behavior: url("xres/iepngfix.htc") }</style><![endif]-->
<script type="text/javascript" src="xres/js/saslideshow.js"></script>
<script type="text/javascript" src="xres/js/slideshow.js"></script>
<script src="js/jquery-1.5.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="vallenato/vallenato.js" type="text/javascript"
	charset="utf-8"></script>
<link rel="stylesheet" href="vallenato/vallenato.css" type="text/css"
	media="screen" charset="utf-8">

	<script type="text/javascript">
		$("#slideshow > div:gt(0)").hide();

		setInterval(function() { 
		  $('#slideshow > div:first')
			.fadeOut(1000)
			.next()
			.fadeIn(1000)
			.end()
			.appendTo('#slideshow');
		},  3000);
	</script>
	<!--sa calendar-->
	<script type="text/javascript" src="js/datepicker.js"></script>
	<link href="css/demo.css" rel="stylesheet" type="text/css" />
	<link href="css/datepicker.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">

		function makeTwoChars(inp) {
				return String(inp).length < 2 ? "0" + inp : inp;
		}

		function initialiseInputs() {
				// Clear any old values from the inputs (that might be cached by the browser after a page reload)
				document.getElementById("sd").value = "";
				document.getElementById("ed").value = "";

				// Add the onchange event handler to the start date input
				datePickerController.addEvent(document.getElementById("sd"), "change", setReservationDates);
		}

		var initAttempts = 0;

		function setReservationDates(e) {
				// Internet Explorer will not have created the datePickers yet so we poll the datePickerController Object using a setTimeout
				// until they become available (a maximum of ten times in case something has gone horribly wrong)

				try {
						var sd = datePickerController.getDatePicker("sd");
						var ed = datePickerController.getDatePicker("ed");
				} catch (err) {
						if(initAttempts++ < 10) setTimeout("setReservationDates()", 50);
						return;
				}

				// Check the value of the input is a date of the correct format
				var dt = datePickerController.dateFormat(this.value, sd.format.charAt(0) == "m");

				// If the input's value cannot be parsed as a valid date then return
				if(dt == 0) return;

				// At this stage we have a valid YYYYMMDD date

				// Grab the value set within the endDate input and parse it using the dateFormat method
				// N.B: The second parameter to the dateFormat function, if TRUE, tells the function to favour the m-d-y date format
				var edv = datePickerController.dateFormat(document.getElementById("ed").value, ed.format.charAt(0) == "m");

				// Set the low range of the second datePicker to be the date parsed from the first
				ed.setRangeLow( dt );
				
				// If theres a value already present within the end date input and it's smaller than the start date
				// then clear the end date value
				if(edv < dt) {
						document.getElementById("ed").value = "";
				}
		}

		function removeInputEvents() {
				// Remove the onchange event handler set within the function initialiseInputs
				datePickerController.removeEvent(document.getElementById("sd"), "change", setReservationDates);
		}

		datePickerController.addEvent(window, 'load', initialiseInputs);
		datePickerController.addEvent(window, 'unload', removeInputEvents);

		//]]>
		</script>
</head>
<body>
<%
	int id;
	//HttpSession session1=request.getSession();
	//id=(int)session.getAttribute("user_id");
%>
	<div id="wrapper">
	<div id="header">
    <!--<h1><a href="index.php"><img src="xres/images/logo.png" class="logo" alt="James Buchanan Pub and Restaurant" /></a></h1>-->
        <ul id="mainnav">
			<li class="current"><a href="index1.jsp">Home</a></li>
             <!-- <li><a href="about.html">About Us</a></li> -->
            <li><a href="routes.jsp">Routes</a></li>
            <li><a href="location.html">location</a></li>
            <li><a href="contact.html">Contact Us</a></li>
            <li><a href="LogOut.jsp">Logout</a></li>
    	</ul>
	</div>
    <div id="content">
    	<div id="rotator">
              <ul>
                    <li class="show"><img src="xres/images/jb2/01.jpg" width="861" height="379"  alt="" /></li>
                    <li><img src="xres/images/jb2/02.jpg" width="861" height="379"  alt="" /></li>
                    <li><img src="xres/images/jb2/03.jpg" width="861" height="379"  alt="" /></li>
                    <li><img src="xres/images/jb2/04.jpg" width="861" height="379"  alt="" /></li>
              </ul>
			  
			  <!-- User Login -->
			  <div id="logo" style="left: 600px; height: auto; top: 23px; width: 260px; position: absolute; z-index:4;">
					
					<!-- Ticket Booking -->
					<h2 class="accordion-header" style="height: 18px; margin-bottom: 15px; color: rgb(255, 255, 255); background: none repeat scroll 0px 0px rgb(53, 48, 48);">Ticket Booking</h2>
					<div class="accordion-content" style="margin-bottom: 15px;">
						<form action="SelectSeat.jsp" method="post" style="margin-bottom:none;">
						<span style="margin-right: 11px;">Select Route: 
						<select name="route" style="width: 191px; margin-left: 15px; border: 3px double #CCCCCC; padding:5px 10px;"/>
							<option value="Pune to Mumbai">Pune to Mumbai</option>
							<option value="Pune to Chennai">Pune to Chennai</option>
							<option value="Mumbai to Pune">Mumbai to Pune</option>
							<option value="Mumbai to Chennai">Mumbai to Chennai</option>
							<option value="Chennai to Pune">Chennai to Pune</option>									
						</select>
						</span><br>
						<span style="margin-right: 11px;">Date: 
						<input type="text" class="w8em format-d-m-y highlight-days-67 range-low-today" name="date" id="sd" value="" maxlength="10" readonly="readonly" style="width: 165px; margin-left: 15px; border: 3px double #CCCCCC; padding:5px 10px;"/>
						</span><br><br>
						<input type="submit" id="submit" value="Next" style="height: 34px; margin-left: 15px; width: 191px; padding: 5px; border: 3px double rgb(204, 204, 204);" />
						</form>
					</div>
					
					<!-- Booking History -->
					<h2 class="accordion-header" style="height: 18px; margin-bottom: 15px; color: rgb(255, 255, 255); background: none repeat scroll 0px 0px rgb(53, 48, 48);">Booking History</h2>
					<div class="accordion-content" style="margin-bottom: 15px;">
						<form action="history.jsp">
							<input type="submit" id="submit" value="Click Here" style="height: 34px; margin-left: 15px; width: 191px; padding: 5px; border: 3px double rgb(204, 204, 204);" />
						</form>
					</div>
				</div>
        </div>
		
    </div>
    <div id="featured">
        <div id="items">
            <div class="item"> <a href="main-course.php"><img src="xres/images/01_featured.jpg" alt="" /></a>
            <h3><a href="#">Specials Offers</a></h3>
            <p><a href="#"><strong>Aircon Bus</strong><br />
			Come in and experience<br /> Our
			new Bus Type<br /> specials today!</a></p>  
            </div>
            <div class="item"> <a href="#"><img src="xres/images/02_featured.jpg" alt="" /></a>
            <h3><a href="#">New Route</a></h3>
            <p><a href="#"><strong>From Pune to Chennai Vice versa</strong><br />
			Have a relaxing journey. </a></p>  
			</div>
			<!--  <div class="item" style="width: 860px;"> 
				<iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fpages%2FFlorida-Bus%2F224961217554604%3Fref%3Dts%26fref%3Dts&amp;width=800&amp;height=290&amp;show_faces=true&amp;colorscheme=dark&amp;stream=false&amp;border_color&amp;header=true" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:800px; height:290px;" allowTransparency="true"></iframe>
			</div> -->
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