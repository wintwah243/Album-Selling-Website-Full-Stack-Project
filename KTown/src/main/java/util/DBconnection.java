package util;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;


public class DBconnection {
	private static Connection connection = null;
	public static Connection getConnection() {
	try{
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/company","root","root");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            } 
            return connection;
     }



}
