  package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uemail=request.getParameter("username");
		String upwd=request.getParameter("password");
		HttpSession session = request.getSession(); 
        session.setAttribute("username",uemail); 
        session=request.getSession();
		RequestDispatcher dispatcher=null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false","root","root");
			PreparedStatement pst=con.prepareStatement("select * from users where uname=? and upwd=?");
			pst.setString(1, uemail);
			pst.setString(2, upwd);
			User user=new User(0, upwd, upwd, upwd, upwd);
			
			ResultSet rs=pst.executeQuery();
			if(uemail.equals("admin") && upwd.equals("000")) {
				response.sendRedirect("admin.jsp");
				
			} else if(rs.next()) {
				session=request.getSession(false);
				session.setAttribute(upwd, rs);
				session.setAttribute("name",rs.getString("uname"));
				dispatcher=request.getRequestDispatcher("homepagestyle.jsp");
				
			}
			
			
			else {
				request.setAttribute("status", "failed");
				dispatcher=request.getRequestDispatcher("login.jsp");
			}
			
			dispatcher.forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}

}
