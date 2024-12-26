<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="model.Albums" %>
<%@page import="java.sql.Connection" import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Album</title>
    <style>
    	:root{
  --main-color:skyblue;
  --color-dark:#1D2231;
  --text-grey:#8390A2;
}

*{
  margin: 0;
  padding: 0;
  outline: 0;
  font-family: 'Poppins',sans-serif;
  background-color:skyblue;
}

table{
  position: absolute;
  z-index: 2;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  width: 60%;
  height: 500px;
  background-color: #fff;
  text-align: center;
  border-collapse: collapse;
  overflow: hidden;
  border-radius: 12px 12px 12px 12px;
  border-spacing: 1;
  box-shadow: 0 2px 12px rbga(32,32,32,.3);
  columns:white;
}
tr,td{
  padding: 12px 100px;
}

td{
  text-transform: uppercase;
  color: purple;
}
a{
  text-decoration:none;
  text-transform:uppercase;
  display:block;
}

button{
  width: 100px;
  border-radius:25px;
  text-transform:uppercase;
  background:purple;
  color:white;
}



input{
  padding: 5px 20px;
  display:square;
  background:purple;
  color:white;
  border-radius:15px;
}
nav{
	max-width: var(--max-width);
	margin:auto;
	padding:2rem 1rem;
	display:flex;
	align-items: center;
	justify-content: space-between;
}

.nav_logo{
	font-size: 1.5rem;
	font-weight: 600;
	color:var(--text-dark);
}

.nav_links{
	list-style: none;
	display: flex;
	align-items: center;
	gap:2rem;
}

.link a{
	font-weight: 500;
	color: var(--text-light);
	transition: 0.3s;
}

.link a:hover{
	color:var(--primary-color);
}
a{
	text-decoration: none;
}
    </style>
</head>
<body>
    <nav>
<div class="nav_logo">Editing Form</div>
<ul class="nav_links">
<li class="link"><a href="admin.jsp">Home</a></li>
<li class="link"><a href="order-list.jsp">Order list</a></li>
<li class="link"><a href="login.jsp">Log out</a></li>

</ul>
</nav>
    
    <form action="edit" method="post" enctype="multipart/form-data">
        <%-- Retrieve lecture details passed from servlet --%>
        <%
            // Retrieve lecture object from request attribute
            model.Albums album = (model.Albums) request.getAttribute("Album");

            // Check if lecture object is not null
            if (album != null) {
        %>
        <table width="400px" align="center" border=2>
        <tr>
                    <td align="center" colspan="2">EDIT Album Details</td>
                </tr>
        <input type="hidden" name="albumName" value="<%= album.getAlbum_name() %>">
        <tr>
        <td><label for="name">Album Name:</label></td>
        <td><input type="text" id="name" name="album_name" value="<%= album.getAlbum_name() %>"></td><br>
        </tr>
        <tr>
        <td><label for="password">Price $:</label></td>
      <td>  <input type="text" id="password" name="price" value="<%= album.getPrice() %>"></td><br>
        </tr>
        <tr>
       <td> <label for="email">Status:</label></td>
        <td><input type="text" id="email" name="status" value="<%= album.getStatus() %>"></td><br>
        </tr>
        
        <tr>
       <td> <label for="filename">Filename:</label></td>
       <td> <input type="file" id="filename" name="filename" value="<%= album.getFilename() %>"></td><br>
        </tr>
        <label for="path"></label>
        <input type="hidden" id="path" name="path" value="<%= album.getPath() %>"><br>
        
        <tr>
        <td></td>
       <td> <input type="submit" value="Update"></td>
        </tr>
        <%-- End of lecture null check --%>
        <% } else { %>
            <p>No album found for editing.</p>
        <% } %>
        </table>
    </form>
</body>
</html>
