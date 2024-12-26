package dao;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import util.DBconnection;
import java.util.*;

import model.Albums;
import model.Order;

import dao.albumDAO;

public class OrderDAO1 {
	
	Connection connection = null;
	ResultSet resultSet = null;
	Statement statement = null;
	PreparedStatement preparedStatement = null;

    

	

	/*public List<Order> getOrder(String name) {
		List<Order> list = null;
		Order order = null;
		try {
		    list = new ArrayList<Order>();
		    String sql = "SELECT * FROM orders where name=?";
		    connection = DBconnection.getConnection();
		    statement = connection.createStatement();
		    resultSet = statement.executeQuery(sql);
		    while(resultSet.next()) {
			order = new Order();
			order.setAlbum_id(0);
			student.setEmail(resultSet.getString("email"));
			list.add(student);
		          }
		   }catch(SQLException e) {
		   e.printStackTrace();
		}
		return list;
		}

	public boolean insertOrder(Order model) {
        boolean result = false;
        try {
            query = "insert into orders (p_id, u_id, o_quantity, o_date) values(?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, model.getOrderId());
            pst.setInt(2, model.getUid());
            pst.setInt(3, model.getQunatity());
            pst.setString(4, model.getDate());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
	

	public List<Order> userOrders(int id) {
        List<Order> list = new ArrayList<>();
        try {
            query = "select * from orders where u_id=? order by orders.o_id desc";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                albumDAO productDao = new albumDAO(this.con);
                int pId = rs.getInt("p_id");
                Albums product = new Albums();
                product=albumDAO.getSingleProduct(pId);
                order.setOrderId(rs.getInt("o_id"));
                order.setAlbum_id(pId);
                order.setAlbum_name(product.getAlbum_name());
                order.setStatus(product.getStatus());
                order.setPrice(product.getPrice()*rs.getInt("o_quantity"));
                order.setQunatity(rs.getInt("o_quantity"));
                order.setDate(rs.getString("o_date"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void cancelOrder(int id) {
        //boolean result = false;
        try {
            query = "delete from orders where o_id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            //result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        //return result;
    }
    public boolean delete(int orderId) {
 	   boolean flag = false;
 	   try {
 	   String sql = "DELETE FROM orders where orderId="+orderId;
 		Connection connection = DBconnection.getConnection();
 		PreparedStatement preparedStatement = connection.prepareStatement(sql);
 		int rowDeleted = preparedStatement.executeUpdate();
 		if(rowDeleted>0) flag = true;
 		}catch(SQLException e) {
 		e.printStackTrace();
 		}
 	   return flag;
 	}
    
    public boolean save(Order alb) {
 	   boolean flag = false;
 	   try {
 		String sql = "INSERT INTO orders(customer_name,album_name,  o_quantity,address) VALUES (?,?,?,?)";
 		Connection connection = DBconnection.getConnection();
 		PreparedStatement preparedStatement = 	connection.prepareStatement(sql);
 		preparedStatement.setString(1, alb.getCustomer_name());
 		preparedStatement.setString(1, alb.getAlbum_name());
 		preparedStatement.setInt(3, alb.getO_quantity());
 		preparedStatement.setString(4,alb.getAddress());
 		
 		int rowInserted = preparedStatement.executeUpdate();
 		if (rowInserted > 0) flag = true;
 		}catch(SQLException ex) {
 		ex.printStackTrace();
 	      }
 	   return flag;
 	}*/
	
	 Order order = null; 
	 public List<Order> get(String customer_name){ 
	   List<Order> list = new ArrayList<>(); 
	   
	  try { 
	   String sql = "SELECT * FROM orders WHERE customer_name=?"; 
	         connection = DBconnection.getConnection(); 
	         preparedStatement = connection.prepareStatement(sql); 
	         preparedStatement.setString(1,customer_name ); 
	         resultSet = preparedStatement.executeQuery(); 
	          
	         while (resultSet.next()) { 
	             Order order = new Order();
	             order.setOrderId(resultSet.getInt("orderId"));
	             order.setCustomer_name(resultSet.getString("customer_name"));
	            order.setAlbum_name(resultSet.getString("album_name"));
	            order.setO_quantity(resultSet.getInt("o_quantity"));
	            order.setAddress(resultSet.getString("address"));
	            list.add(order);
	         } 
	     } catch (SQLException e) { 
	         e.printStackTrace(); 
	          
	         } 
	  return list; 
	   
	 }
    


	public static List<Order> get() {
		// TODO Auto-generated method stub
		return null;
	}
}