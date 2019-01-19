<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.db"%>
<%@page import="java.util.*"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>CSS seat booking</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"
	type="text/javascript"></script>

<meta name="viewport" content="width=device-width">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<link rel="stylesheet" href="css/style.css">


</head>

<body>
	<%
	int i;
	char j;
	int bus_id=0;
	String route=request.getParameter("route");
	String date=request.getParameter("date");
	Connection con=com.db.getConnection();
	Statement st=con.createStatement();
	ArrayList<String> seatList1=new ArrayList<String>();
	String routeName=request.getParameter("route");
	//System.out.print(routeName);
	ResultSet rs=st.executeQuery("SELECT id FROM route WHERE route='"+routeName+"'");
	while(rs.next())
	{
		bus_id=rs.getInt("id");
	}
	String query="SELECT *FROM user_seats WHERE bus="+bus_id+" and date='"+date+"'";
	ResultSet rs1=st.executeQuery(query);
	StringTokenizer st3;
	String seatList=null;
	while(rs1.next())
	{
		seatList=rs1.getString("setnumber");
		st3=new StringTokenizer(seatList,",");
		int nSeats=st3.countTokens();
		while(st3.hasMoreTokens())
		{
			seatList1.add(st3.nextToken());
		}
	}
	%>
	
	<form action="SelectSeatServ" method="get">
		<div class="plane">
			<div class="cockpit">
				<h1>Please select a seat</h1>
			</div>
			<div class="exit exit--front fuselage"></div>
			<ol class="cabin fuselage">
				<% 
				String seat;
				String seatClass;
				for(i=1;i<10;i++)
				{
				%>
				<li class="row row--1">
					<ol class="seats" type="A">
					<% for(j='A';j<='F';j++)
					{
						seat=String.valueOf(i)+j;
						if(!(seatList1.contains(seat)))
						{ 
					%>
							<li class="seat"><input type="checkbox" id=<%=seat %> name="seat"
							value=<%=seat %> /> <label for=<%=seat %>><%=seat %></label></li>
					<% }
						else
						{
					%>		<li class="seat"><input type="checkbox" disabled id="1D"
							name="seat" value="1D" /> <label for="1D">Occupied</label></li>
					<% 	}
					}
					%>
					</ol>
				</li>
				<%}%>
				
				<li class="row row--10">
					<ol class="seats" type="A">
					<% for(j='A';j<='G';j++)
					{
						seat=String.valueOf(i)+j;
						if(!(seatList1.contains(seat)))
						{ 
					%>
							<li class="seat1"><input type="checkbox" id=<%=seat %> name="seat"
							value=<%=seat %> /> <label for=<%=seat %>><%=seat %></label></li>
					<% }
						else
						{
					%>		<li class="seat1"><input type="checkbox" disabled id="1D"
							name="seat" value="1D" /> <label for="1D">Occupied</label></li>
					<% 	}
					}
					%>
					</ol>
				</li>
			</ol>
<%
	//int id=0;
	/*String route=request.getParameter("route");
	String date=request.getParameter("date");
	Connection con=com.db.getConnection();
	Statement st=con.createStatement();
	String routeName=request.getParameter("route");
	//System.out.print(routeName);
	ResultSet rs=st.executeQuery("SELECT id FROM route WHERE route='"+routeName+"'");
	while(rs.next())
	{
		id=rs.getInt("id");
	}*/
	out.print("<input type='hidden' name='id' value='"+bus_id+"' />");
	out.print("<input type='hidden' name='date' value='"+date+"' />");
%>
			<input type="submit" value="Next" />
		</div>
	</form>

	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>



</body>

</html>
