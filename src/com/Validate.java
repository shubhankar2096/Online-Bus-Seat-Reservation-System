package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Validate
 */
@WebServlet("/Validate")
public class Validate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	Connection con=com.db.getConnection();
	String fname,lname;
	boolean check(String email,String pass)
	{
		boolean st =false;
	    try{
	       PreparedStatement ps =con.prepareStatement
	                           ("select * from User_Info where email=? and password=?");
	       ps.setString(1,email);
	       ps.setString(2,pass);
	       st=true;
	    }catch(Exception e)
	    {
	        e.printStackTrace();
	    }
	       return st; 
	}
    public Validate() throws ClassNotFoundException, SQLException {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In Validate.");
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		RequestDispatcher rsd;
		ResultSet rs;
		int i,ch;
		char ans;
		String query;
		boolean res1;
		//Validate v;
		
			//v=new Validate();
			String email=request.getParameter("email");
			String passwd=request.getParameter("password");
			res1=check(email,passwd);
			if(res1==true)
			{
				HttpSession hs=request.getSession();
				hs.setAttribute("fname",fname);
				hs.setAttribute("lname",lname);
				response.sendRedirect("index.html");
			}
			else
			{
					pw.println("Email or password is incorrect.");
					rsd= request.getRequestDispatcher("index.html");
			        rsd.include(request, response);
			}
			//con.close();
		
	}

}