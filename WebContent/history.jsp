<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.db"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="UTF-8">
	<title>Booking History</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
	<link rel="stylesheet" href="css/styleTable.css">
	<linkhref="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"rel="stylesheet" id="bootstrap-css" />
	<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
		/*Connection con=com.db.getConnection();
		Statement st=con.createStatement();
		String tranId=null;
		int bus_id=0;
		int unit_price=0;
		String date=(String)session.getAttribute("date");
		String route=null,type=null,time=null,tran_id=null,seatList=null;
		int payable=0,price=0,bus=0;
		int user_id=(Integer)session.getAttribute("user_id");
		String query="SELECT *FROM user_seats WHERE user_id='"+user_id+"'";
		ResultSet rs=st.executeQuery(query);*/
		/*while(rs.next())
		{
			bus_id=rs.getInt("bus");
			//route=rs.getString("route");
			unit_price=rs.getInt("price");
			payable=rs.getInt("total_payable");
			//type=rs.getString("type");
			seatList=rs.getString("setnumber");
			date=rs.getString("date");
			//time=rs.getString("time");
			tran_id=rs.getString("tran_id");
		}
		String query1="SELECT *FROM route WHERE id="+bus_id;
		rs=st.executeQuery(query1);
		while(rs.next())
		{
			//user_id=rs.getInt("user_id");
			//price=rs.getInt("price");
			route=rs.getString("route");
			type=rs.getString("type");
			time=rs.getString("time");
		}*/
	%>
	<div class="table">
    
    <div class="row header green">
      <div class="cell">
        Bus Id
      </div>
      <div class="cell">
        Route
      </div>
      <div class="cell">
        Date
      </div>
      <div class="cell">
        Bus Type
      </div>
      <div class="cell">
        Transaction_Id
      </div>
      <div class="cell">
        Total Paid
      </div>
      <div class="cell">
        Seat #
      </div>
    </div>
    
    <%
    Connection con=com.db.getConnection();
	Statement st=con.createStatement();
	String tranId=null;
	int bus_id=0;
	int unit_price=0;
	String date=(String)session.getAttribute("date");
	String route=null,type=null,time=null,tran_id=null,seatList=null;
	int payable=0,price=0,bus=0;
	int user_id1=(Integer)session.getAttribute("user_id");
	String query2="SELECT *FROM user_seats us join route r ON us.bus=r.id WHERE user_id="+user_id1;
	//String query="SELECT *FROM user_seats WHERE user_id='"+user_id+"'";
	ResultSet rs=st.executeQuery(query2);
    while(rs.next())
	{
		bus_id=rs.getInt("bus");
		//route=rs.getString("route");
		unit_price=rs.getInt("price");
		payable=rs.getInt("total_payable");
		//type=rs.getString("type");
		seatList=rs.getString("setnumber");
		date=rs.getString("date");
		//time=rs.getString("time");
		tran_id=rs.getString("tran_id");
		route=rs.getString("route");
		type=rs.getString("type");
		time=rs.getString("time");
		%>
	<div class="row">
      <div class="cell">
        <%= bus_id %>
      </div>
      <div class="cell">
        <%= route %>
      </div>
      <div class="cell">
        <%= date %>
      </div>
      <div class="cell">
      	<%= type %>
      </div>
      <div class="cell">
        <%= tran_id %>
      </div>
      <div class="cell">
        <%= payable %>
      </div>
      <div class="cell">
        <%= seatList %>
      </div>
    </div>
    <% 
	}
    %>
    
    <!--<div class="row">
      <div class="cell">
        Solid oak work table
      </div>
      <div class="cell">
        $800
      </div>
      <div class="cell">
        10
      </div>
      <div class="cell">
        03/15/2014
      </div>
      <div class="cell">
        Waiting for Pickup
      </div>
    </div>
    %>
    
    <div class="row">
      <div class="cell">
        Leather iPhone wallet
      </div>
      <div class="cell">
        $45
      </div>
      <div class="cell">
        120
      </div>
      <div class="cell">
        02/28/2014
      </div>
      <div class="cell">
        In Transit
      </div>
    </div>
    
    <div class="row">
      <div class="cell">
        27" Apple Thunderbolt displays
      </div>
      <div class="cell">
        $1000
      </div>
      <div class="cell">
        25
      </div>
      <div class="cell">
        02/10/2014
      </div>
      <div class="cell">
        Delivered
      </div>
    </div>
    
    <div class="row">
      <div class="cell">
        Bose studio headphones
      </div>
      <div class="cell">
        $60
      </div>
      <div class="cell">
        90
      </div>
      <div class="cell">
        01/14/2014
      </div>
      <div class="cell">
        Delivered
      </div>
    </div> -->
    
  </div>
</body>
</html>