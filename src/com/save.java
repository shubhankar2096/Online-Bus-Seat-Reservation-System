package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class save
 */
@WebServlet("/save")
public class save extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
	static int count=1;
	String tran="F0124567";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public save() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int i;
		HttpSession session=request.getSession();
		String date=(String)session.getAttribute("date");
		//System.out.print("Date:"+date);
		int user_id=(Integer)session.getAttribute("user_id");
		int nSeats=(Integer)request.getAttribute("nSeats");
		int payable=0;
		int price=(Integer)request.getAttribute("price");
		payable=price*nSeats;
		//System.out.println("Payable:"+pa);
		//payable=Integer.parseInt(pa);
		String seatList=(String)request.getAttribute("seatList");
		//System.out.println("Payable:"+payable);
		//System.out.println(Arrays.toString(values));
		int id=Integer.parseInt(request.getParameter("id"));
		String tranId=tran+count;
		count++;
		String query="INSERT INTO user_seats(user_id,date,bus,price,total_payable,setnumber,tran_id) VALUES("+user_id+",'"+date+"','"+id+"',"+price+","+payable+",'"+seatList+"','"+tranId+"')";
		try {
			Connection con=com.db.getConnection();
			Statement st=con.createStatement();
			st.executeUpdate(query);
			RequestDispatcher rqd=request.getRequestDispatcher("/receipt.jsp");
			request.setAttribute("tranId",tranId);
			rqd.forward(request, response);
			/*ResultSet rs=st.executeQuery("SELECT *FROM route WHERE id="+id);
			int price=0;
			String route=null,type=null,time=null;
			while(rs.next())
			{
				id=rs.getInt("id");
				route=rs.getString("route");
				price=rs.getInt("price");
				type=rs.getString("type");
				time=rs.getString("time");
			}
			PrintWriter pw=response.getWriter();
			pw.print("<input type='hidden' name='id' value='"+id+"'>");
			pw.print("<input type='hidden' name='price' value='"+price+"'>");
			pw.print("<input type='hidden' name='payable' value='"+payable+"'>");
			//request.setAttribute("id",String.valueOf(id));
			request.setAttribute("route",route);
			//request.setAttribute("price",price);
			request.setAttribute("type",type);
			request.setAttribute("time",time);
			//request.setAttribute("payable",payable);
			rqd.forward(request, response);*/
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
