<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Receipt</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<!-- Payment -->
	<script src="https://www.paypalobjects.com/api/checkout.js"></script>
<script>
// Render the PayPal button
paypal.Button.render({
// Set your environment
env: 'sandbox', // sandbox | production

// Specify the style of the button
style: {
  layout: 'vertical',  // horizontal | vertical
  size:   'medium',    // medium | large | responsive
  shape:  'rect',      // pill | rect
  color:  'gold'       // gold | blue | silver | white | black
},

// Specify allowed and disallowed funding sources
//
// Options:
// - paypal.FUNDING.CARD
// - paypal.FUNDING.CREDIT
// - paypal.FUNDING.ELV
funding: {
  allowed: [
    paypal.FUNDING.CARD,
    paypal.FUNDING.CREDIT
  ],
  disallowed: []
},

// Enable Pay Now checkout flow (optional)
commit: true,

// PayPal Client IDs - replace with your own
// Create a PayPal app: https://developer.paypal.com/developer/applications/create
client: {
  sandbox: 'AZDxjDScFpQtjWTOUtWKbyN_bDt4OgqaF4eYXlewfBP4-8aqX3PiV8e1GWU6liB2CUXlkA59kJXE7M6R',
  production: '<insert production client id>'
},

payment: function (data, actions) {
  return actions.payment.create({
    payment: {
      transactions: [
        {
          amount: {
            total: '1.0',
            currency: 'INR'
          }
        }
      ]
    }
  });
},

onAuthorize: function (data, actions) {
  return actions.payment.execute()
    .then(function () {
      window.alert('Payment Complete!');
    });
}
}, '#paypal-button-container');
</script>
<script type="text/javascript">
function myFunction() {
	  window.print();
	  window.open();
	}
</script>

<style media="print">
.noprint {display:none;}
 @page {
  size: auto;
  margin: 0;
       }
</style>
</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="Home.html">FLORIDA</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="index1.jsp">Home</a></li>
			 <!-- <li><a href="about.html">About Us</a></li> -->
			<li><a href="history.jsp">History</a></li>
			<li><a href="routes.jsp">Routes</a></li>
			<li><a href="location.jsp">Location</a></li>
			<li><a href="contact.jsp">Contact Us</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="LogOut.jsp"> Logout</a></li>
		</ul>
	</div>
	</nav>
	<%
		Connection con=com.db.getConnection();
		Statement st=con.createStatement();
		String tranId=(String)request.getAttribute("tranId");
		int user_id=(Integer)session.getAttribute("user_id");
		int id=0;
		String date=(String)session.getAttribute("date");
		String route=null,type=null,time=null,tran_id=null,seatList=null;
		int payable=0,price=0,bus=0;
		String query="SELECT *FROM user_seats WHERE user_id='"+user_id+"'";
		ResultSet rs=st.executeQuery(query);
		/*String bb=(String)session.getAttribute("user_id");
		int user_id=Integer.parseInt(bb);*/
		while(rs.next())
		{
			id=rs.getInt("bus");
			//route=rs.getString("route");
			payable=rs.getInt("total_payable");
			//type=rs.getString("type");
			seatList=rs.getString("setnumber");
			date=rs.getString("date");
			//time=rs.getString("time");
			//tran_id=rs.getString("tran_id");
		}
		String query1="SELECT *FROM route WHERE id="+id;
		rs=st.executeQuery(query1);
		while(rs.next())
		{
			//user_id=rs.getInt("user_id");
			price=rs.getInt("price");
			route=rs.getString("route");
			type=rs.getString("type");
			time=rs.getString("time");
		}
	%>
	<div class="container">
		<div class="row">
			<div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
						<img src="xres/images/logo.png" height="150px" />
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 text-right">
						<p>
							<% 
                        out.print("<strong>Receipt # : "+tranId+"</strong>");
                    %>
						</p>
						<p align="right">
							<% 
						out.print("<Strong>Bus Number : "+id+"</Strong>");
					%>
						</p>
						<p>
							<% 
						out.print("	<strong>Route : "+route+"</strong>");
					%>
						</p>
						<p>
							<% 
						out.print("<strong>Dept Date: "+date+"</strong>");
					%>
						</p>
						<p>
							<%
						out.print("	<strong>Time : "+time+"</strong>");
					%>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="text-center">
						<h1>Seat #</h1>
						<% 
                    	int i;
                    	StringBuffer sb=new StringBuffer();
                    	StringTokenizer st1=new StringTokenizer(seatList,",");
                    	int nSeat=st1.countTokens();
                    	while(st1.hasMoreTokens())
                    	{
                    		sb.append(st1.nextToken()).append(" ");
                    	}
                    	sb.deleteCharAt(sb.length()-1);
                    	out.print("<h2>"+sb+"</h2>");
                    %>
						<!--  <h2>1A 1B 1C 1D</h2> -->
					</div>
					</span>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Route</th>
								<th class="text-left">Bus Type</th>
								<th class="text-center">Seat Rate</th>
								<th class="text-center">Total</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<% out.print("<td class='col-md-9'><b>"+route+"</b></h4></td>"); %>
								<% 
                           		out.print("<td class='col-md-9'><b>"+type+"</b></h4></td>"); 
                           %>
								<% 
                           		//int price=Integer.parseInt(request.getParameter("price"));
                           		out.print("<td class='col-md-1 text-center'><b>Rs."+price+"</b></h4></td>"); 
                           %>
								<% 
                          		//int payable=Integer.parseInt(request.getParameter(""));
                           		out.print("<td class='col-md-1 text-center'><b>Rs."+payable+"</b></h4></td>"); 
                           %>
							</tr>

							<tr>
								<td></td>
								<td></td>
								<td class="text-right">
									<p>
										<strong>Subtotal: </strong>
									</p>
									<p>
										<strong>Tax: </strong>
									</p>
								</td>
								<td class="text-center">
									<p>
										<%
                           		 out.print("<strong>Rs."+payable+"</strong>"); 
                            %>
									</p>
									<p>
										<%
                            	double tax=(0.18*payable);
                           		out.print("<strong>Rs."+tax+"</strong>"); 
                           		double total=payable+tax;
                            %>
									</p>
								</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td class="text-right"><h4>
										<strong>Total: </strong>
									</h4></td>
								<% out.print("<td class='text-center text-danger'><h4><strong>Rs."+total+"</strong></h4></td>"); %>
							</tr>
						</tbody>
					</table>
					<!-- <button type="button" class="btn btn-success btn-lg" onClick="myFunction()">
						Print Receipt
					</button> -->
					</td>
				</div>
			</div>
		</div>
			<div class="col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
				<div class="noprint">
					<button type="button" class="btn btn-success btn-lg" onClick="myFunction()">
							Print Receipt
						</button><br>
					<b>Pay Using</b>
					<!-- <div id="paypal-button-container"></div> -->
					<div class='pm-button'><a href='https://www.payumoney.com/paybypayumoney/#/D84DE0511D6BB39DC97C7B45D90FDB22' target='_blank'><img src='https://www.payumoney.com/media/images/payby_payumoney/new_buttons/22.png' /></a></div> 
				</div>
			</div>
</body>
</html>