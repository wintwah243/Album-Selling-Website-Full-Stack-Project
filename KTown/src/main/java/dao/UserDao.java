package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Albums;
import model.User;
import util.DBconnection;

public class UserDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private Statement statement;
	private ResultSet rs;
	
	public UserDao(Connection con){
		super();
		this.con=con;
	}
	
	public List<User> get() {
		List<User> list = null;
		User user = null;
		try {
		    list = new ArrayList<User>();
		    String sql = "SELECT * FROM users";
		    con = DBconnection.getConnection();
		    statement = con.createStatement();
		    rs = statement.executeQuery(sql);
		    while(rs.next()) {
			user = new User();
			user.setUserid(rs.getInt("id"));
			user.setUsername(rs.getString("uname"));
			user.setCountry(rs.getString("country"));
			
			list.add(user);
		          }
		   }catch(SQLException e) {
		   e.printStackTrace();
		}
		return list;
		}
	public  User getUser(String ) {
		   User user = null;
		   try {
			user = new User();
			String sql = "SELECT * FROM users ";
			con = DBconnection.getConnection();
			statement = con.createStatement();
			rs = statement.executeQuery(sql);
			if(rs.next()) {
				user.setUserid(rs.getInt("id"));
				user.setUsername(rs.getString("uname"));
				
				}
			}catch(SQLException e) {
			e.printStackTrace();
		      }
		    return user;
		}
	

}
