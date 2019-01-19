package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.StringTokenizer;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SelectSeatServ
 */
@WebServlet("/SelectSeatServ")
public class SelectSeatServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectSeatServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int i;
		int id=Integer.parseInt(request.getParameter("id"));
		int price=0;
		StringBuffer sb=new StringBuffer();
		String[] values=request.getParameterValues("seat");
		PrintWriter pw=response.getWriter();
		StringBuffer sb1=new StringBuffer();
		for(i=0;i<values.length;i++)
		{
			sb.append(values[i]).append(",");
		}
		int nSeats=values.length;
		sb.deleteCharAt(sb.length()-1);
		String seatList=sb.toString();
		RequestDispatcher rqd=request.getRequestDispatcher("/save");
		Connection con;
		try {
			con = com.db.getConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("SELECT price FROM route WHERE id="+id);
			while(rs.next())
			{
				price=rs.getInt("price");
			}
			//String price=request.getParameter("price");
			HttpSession session=request.getSession();
			String date=request.getParameter("date");
			//System.out.print("Date:"+date);
			request.setAttribute("seatList",seatList);
			session.setAttribute("date",date);
			request.setAttribute("price",price);
			request.setAttribute("nSeats",nSeats);
			rqd.forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
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
