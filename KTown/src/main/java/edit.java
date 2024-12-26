import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Albums;



@WebServlet("/edit")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)

public class edit extends HttpServlet {
 private static final long serialVersionUID = 1L;
 public static final String UPLOAD_DIR = "images";
 public String dbFileName = "";
 protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     String albumName = request.getParameter("album_name");
     
     // Retrieve lecture details from the database based on the name
     Albums album = getAlbumByName(albumName);
     
     // Set lecture as an attribute of the request object to be accessed in the JSP
     request.setAttribute("Album", album);
     
     // Forward the request to a JSP page where the edit form is displayed
     request.getRequestDispatcher("edit.jsp").forward(request, response);
 }

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     // Retrieve form parameters
     String albumName = request.getParameter("albumName"); // Get the original lecture name
     String newName = request.getParameter("album_name"); // Get the updated lecture name
     String price = request.getParameter("price");
     String status = request.getParameter("status");
     
     // Initialize course_id with a default value
    
     Part part = request.getPart("filename");
     String fileName = extractFileName(part);//file name
    /**
      * *** Get The Absolute Path Of The Web Application ****
      */
     String applicationPath = getServletContext().getRealPath("");
     String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
     System.out.println("applicationPath:" + applicationPath);
     File fileUploadDirectory = new File(uploadPath);
     if (!fileUploadDirectory.exists()) {
         fileUploadDirectory.mkdirs();
     }
     String savePath = uploadPath + File.separator + fileName;
     System.out.println("savePath: " + savePath);
     String sRootPath = new File(savePath).getAbsolutePath();
     System.out.println("sRootPath: " + sRootPath);
     part.write(savePath + File.separator);
     File fileSaveDir1 = new File(savePath);
     /*if you may have more than one files with same name then you can calculate some random characters
      and append that characters in fileName so that it will  make your each image name identical.*/
     dbFileName = UPLOAD_DIR + File.separator + fileName;
     part.write(savePath + File.separator);
     
     // Update lecture in the database
     boolean updated = false;
     try {
         updated = updateAlbum(albumName, newName, price, status, dbFileName, savePath); // Pass original lecture name here
     } catch (SQLException e) {
         // Handle the database-related exceptions
         e.printStackTrace(); // Log the error
         // You may want to redirect to an error page or display an error message to the user
         response.sendRedirect("error.jsp");
         return; // Stop further execution
     }
     
     // Redirect the user to a suitable page
     if (updated) {
         response.sendRedirect("viewAll.jsp");
     } else {
         // Handle the case where update failed
         // For example, show an error message or redirect to an error page
         response.sendRedirect("error.jsp");
     }
 }

 private String extractFileName(Part part) {//This method will print the file name.
     String contentDisp = part.getHeader("content-disposition");
     String[] items = contentDisp.split(";");
     for (String s : items) {
         if (s.trim().startsWith("filename")) {
             return s.substring(s.indexOf("=") + 2, s.length() - 1);
         }
     }
     return "";
 }
 private Albums getAlbumByName(String album_name) {
     Albums album = null;
     try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/company", "root", "root")) {
    	    // Rest of your code...
    	

         String sql = "SELECT * FROM albums WHERE album_name=?";
         try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
             pstmt.setString(1, album_name);
             try (ResultSet rs = pstmt.executeQuery()) {
                 if (rs.next()) {
                     album = new Albums();
                     album.setAlbum_name(rs.getString("album_name"));
                     album.setPrice(rs.getDouble("price"));
                     album.setStatus(rs.getString("status"));
                     
                     album.setFilename(rs.getString("filename")); // Update filename
                     album.setPath(rs.getString("path"));
                     
                     // Retrieve other fields as needed
                 }
             }
         }
     } catch (SQLException e) {
         // Handle database errors
         e.printStackTrace();
     }
     return album;
 }

 private boolean updateAlbum(String originalName, String newName, String price, String status,  String filename, String path) throws SQLException {
	    boolean updated = false;
	    Connection connection = null;
	    try {
	        connection = DriverManager.getConnection("jdbc:mysql://localhost/company", "root", "root");
	        String sql = "UPDATE albums SET album_name=?, price=?, status=?,  filename=?, path=? WHERE album_name=?";
	        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
	            pstmt.setString(1, newName); // Updated lecture name
	            pstmt.setString(2, price);
	            pstmt.setString(3, status);
	            pstmt.setString(4, filename);
	            pstmt.setString(5, path);
	           
	            // Use original name as the WHERE clause
	            pstmt.setString(6, originalName);
	            
	            int rowsAffected = pstmt.executeUpdate();
	            updated = rowsAffected > 0;
	        }
	    } finally {
	        if (connection != null) {
	            try {
	                connection.close();
	            } catch (SQLException e) {
	                // Handle any errors closing the connection
	                e.printStackTrace();
	            }
	        }
	    }
	    return updated;
	}

	    }
