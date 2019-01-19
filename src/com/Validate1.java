package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Validate1
 */
@WebServlet("/Validate1")
public class Validate1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Validate1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email,password;
		String passwd=null;
		email=request.getParameter("email");
		password=request.getParameter("password");
		PrintWriter pw=response.getWriter();
		try {
			int id=0;
			Connection con=com.db.getConnection();
			Statement st=con.createStatement();
			String query="SELECT * FROM ticket.User_Info where email='"+email+"'";
			ResultSet rs=st.executeQuery(query);
			RequestDispatcher rqd1=request.getRequestDispatcher("index1.jsp");
			RequestDispatcher rqd2=request.getRequestDispatcher("index.html");
			response.setContentType("text/html");
			while(rs.next())
			{
				id=rs.getInt(1);
				passwd=rs.getString(5);
			}
			if(passwd==null)
			{
				pw.println("Email or password is wrong");
				rqd2.include(request, response);
			}
			if(passwd.equals(password))
			{
				//pw.println("Welcome");
				HttpSession session=request.getSession();
				session.setAttribute("user_id",id);
				rqd1.forward(request, response);
			}
			else
			{
				pw.println("Email or password is wrong");
				rqd2.include(request, response);
				
			}
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
