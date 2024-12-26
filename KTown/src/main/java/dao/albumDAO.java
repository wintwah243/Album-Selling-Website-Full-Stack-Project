  package dao;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Albums;
import model.Cart;
import util.DBconnection;

public class albumDAO {
	static Connection connection = null;
	static ResultSet resultSet = null;
	static Statement statement = null;
	PreparedStatement preparedStatement = null;
	
	public albumDAO(Connection connection) {
        this.connection = connection;
        // Other initialization logic, if needed
    }

	public List<Albums> get() {
		List<Albums> list = null;
		Albums album = null;
		try {
		    list = new ArrayList<Albums>();
		    String sql = "SELECT * FROM albums";
		    connection = DBconnection.getConnection();
		    statement = connection.createStatement();
		    resultSet = statement.executeQuery(sql);
		    while(resultSet.next()) {
			album = new Albums();
			album.setAlbum_id(resultSet.getInt("album_id"));
			album.setAlbum_name(resultSet.getString("album_name"));
			album.setPrice(resultSet.getDouble("price"));
			album.setStatus(resultSet.getString("status"));
			album.setFilename(resultSet.getString("filename"));
			album.setPath(resultSet.getString("path"));
			list.add(album);
		          }
		   }catch(SQLException e) {
		   e.printStackTrace();
		}
		return list;
		}

	public static Albums getSingleProduct(int album_id) {
		   Albums album = null;
		   try {
			album = new Albums();
			String sql = "SELECT * FROM albums where album_id="+album_id;
			connection = DBconnection.getConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			if(resultSet.next()) {
				album.setAlbum_id(resultSet.getInt("album_id"));
				album.setAlbum_name(resultSet.getString("album_name"));
				album.setPrice(resultSet.getDouble("price"));
				album.setStatus(resultSet.getString("status"));
				album.setFilename(resultSet.getString("filename"));
				album.setPath(resultSet.getString("path"));
				}
			}catch(SQLException e) {
			e.printStackTrace();
		      }
		    return album;
		}
	
	public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    String query = "select price from albums where album_id=?";
                    preparedStatement = this.connection.prepareStatement(query);
                    preparedStatement.setInt(1, item.getAlbum_id());
                    resultSet = preparedStatement.executeQuery();
                    while (resultSet.next()) {
                        sum+=resultSet.getDouble("price")*item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }
	
	

public boolean save(Albums alb) {
	   boolean flag = false;
	   try {
		String sql = "INSERT INTO albums(album_name, price, status, images) VALUES (?,?,?,?)";
		connection = DBconnection.getConnection();
		preparedStatement = 	connection.prepareStatement(sql);
		preparedStatement.setString(1, alb.getAlbum_name());
		preparedStatement.setDouble(2, alb.getPrice());
		preparedStatement.setString(3, alb.getStatus());
		preparedStatement.setString(4,alb.getFilename());
		preparedStatement.setString(5,alb.getPath());
		int rowInserted = preparedStatement.executeUpdate();
		if (rowInserted > 0) flag = true;
		}catch(SQLException ex) {
		ex.printStackTrace();
	      }
	   return flag;
	}

public boolean delete(int album_id) {
	   boolean flag = false;
	   try {
	   String sql = "DELETE FROM albums where album_id="+album_id;
		connection = DBconnection.getConnection();
		preparedStatement = connection.prepareStatement(sql);
		int rowDeleted = preparedStatement.executeUpdate();
		if(rowDeleted>0) flag = true;
		}catch(SQLException e) {
		e.printStackTrace();
		}
	   return flag;
	}


public boolean update(Albums alb) {
	   boolean flag = false;
	   try {
		String sql = "UPDATE albums SET album_name = ?, price = ?, status = ? where album_id = ?";
		connection = DBconnection.getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, alb.getAlbum_name());
		preparedStatement.setDouble(2, alb.getPrice());
		preparedStatement.setString(3, alb.getStatus());
		preparedStatement.setInt(4, alb.getAlbum_id());
		preparedStatement.setString(5, alb.getFilename());
		int rowUpdated = preparedStatement.executeUpdate();
		if (rowUpdated>0) flag = true;
		}catch(SQLException e) {
		e.printStackTrace();
		}
		return flag;
	   }
public Albums get(int album_id) {
	   Albums album = null;
	   try {
		album = new Albums();
		String sql = "SELECT * FROM albums where album_id="+album_id;
		connection = DBconnection.getConnection();
		statement = connection.createStatement();
		resultSet = statement.executeQuery(sql);
		if(resultSet.next()) {
			album.setAlbum_id(resultSet.getInt("album_id"));			
			album.setAlbum_name(resultSet.getString("album_name"));
			album.setPrice(resultSet.getDouble("price"));
			album.setStatus(resultSet.getString("status"));
			album.setFilename(resultSet.getString("filename"));
			}
		}catch(SQLException e) {
		e.printStackTrace();
	      }
	    return album;
	}






public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
    List<Cart> book = new ArrayList<>();
    try {
        if (cartList.size() > 0) {
            for (Cart item : cartList) {
                String query = "select * from albums where album_id=?";
                preparedStatement = this.connection.prepareStatement(query);
                preparedStatement.setInt(1, item.getAlbum_id());
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    Cart row = new Cart();
                    row.setAlbum_id(resultSet.getInt("album_id"));
                    row.setAlbum_name(resultSet.getString("album_name"));
                    row.setPrice(resultSet.getDouble("price")*item.getQuantity());
                    row.setStatus(resultSet.getString("status"));
                    row.setQuantity(item.getQuantity());
                    book.add(row);
                }

            }
        }

    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println(e.getMessage());
    }
    return book;
}

}
