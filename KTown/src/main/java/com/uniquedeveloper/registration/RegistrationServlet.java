package com.uniquedeveloper.registration;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("name");
		String uemail=request.getParameter("email");
		String upwd=request.getParameter("pass");
		String ucountry=request.getParameter("country");
		RequestDispatcher dispatcher=null;
		Connection con=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false","root","root");
			PreparedStatement pst=con.prepareStatement("insert into users(uname,upwd,uemail,country) values(?,?,?,?)");
			pst.setString(1, uname);
			pst.setString(2, upwd);
			pst.setString(3, uemail);
			pst.setString(4, ucountry);
			int rowcount=pst.executeUpdate();
		    dispatcher=request.getRequestDispatcher("login.jsp");
		    if(rowcount>0) {
		    	request.setAttribute("status", "success");
		    }else {
		    	request.setAttribute("status", "fail");
		    }
		    if(ucountry.equals("Myanmar") || ucountry.equals("Indonesia") || ucountry.equals("Philippines") || ucountry.equals("Thailand")) {
		    	request.setAttribute("status", "success");
		    }
		    else {
		    	request.setAttribute("status", "wrongCountry");
		    }
		    dispatcher.forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();	
			
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
