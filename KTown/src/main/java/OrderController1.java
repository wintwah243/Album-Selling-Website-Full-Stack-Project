

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.OrderDAO1;
import dao.albumDAO;
import model.Cart;
import model.Order;
import model.User;
import util.DBconnection;
/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/order")
public class OrderController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String customer_name=request.getParameter("customer_name");
		String album_name=request.getParameter("album_name");
		int o_quantity=Integer.parseInt(request.getParameter("o_quantity"));
		String address=request.getParameter("address");
		
		RequestDispatcher dispatcher=null;
		Connection con=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false","root","root");
			PreparedStatement pst=con.prepareStatement("insert into orders(customer_name,album_name,  o_quantity,address) values(?,?,?,?)");
			pst.setString(1, customer_name);
			pst.setString(2, album_name);
			pst.setInt(3, o_quantity);
			
			pst.setString(4, address);
			int rowcount=pst.executeUpdate();
			dispatcher=request.getRequestDispatcher("bill.jsp");
			if(rowcount>0) {
				request.setAttribute("status", "success");
			
			}
			response.sendRedirect("homepagestyle.jsp");
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
