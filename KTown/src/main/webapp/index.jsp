<%--
    Document   : index
    Created on : Sep 16, 2017, 9:19:42 PM //last updated Feb 22, 2018, 23:07:00 PM
    Author     : Dharmesh
--%>

<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/adminsumit.css">
<link rel="stylesheet" href="css/homepagestyle.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Summition page</title>
    </head>
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

input[type="file"]{
  display:none;
}

label{
  padding: 5px 20px;
  display:square;
  background:purple;
  color:white;
  border-radius:15px;
}

    </style>
    <body>
    <nav>
<div class="nav_logo">K-town</div>
<ul class="nav_links">
<li class="link"><a href="admin.jsp">Home</a></li>
<li class="link"><a href="viewAll.jsp">Album list</a></li>
<li class="link"><a href="order-list.jsp">Order list</a></li>
<li class="link"><a href="login.jsp">Log out</a></li>

</ul>
</nav>
        <form action="FileUploadServlet" method="post" enctype="multipart/form-data">
            <table width="400px" align="center" border=2>
                <tr>
                    <td align="center" colspan="2">Form Details</td>
                </tr>
                <tr>
                    <td>Album Id </td>
                    <td><input type="number" name="album_id" /></td>
                </tr>
                <tr>
                    <td>Album Name </td>
                    <td>
                        <input type="text" name="album_name">
                    </td>
                </tr>
                <tr>
                    <td>Price $</td>
                    <td>
                        <input type="text" name="price">
                    </td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td>
                        <input type="text" name="status">
                    </td>
                </tr>
                <tr>
                    <td>Image Link: </td>
                    <td>
                        <input type="file" id="file" name="file">
                        <label for="file">Upload a photo</label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><button>Sumit</button></td>
                </tr>
            </table>

        </form><br>
    <center><a href="viewAll.jsp">View All </a></center>
</body>
</html>