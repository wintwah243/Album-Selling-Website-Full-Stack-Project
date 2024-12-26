<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>To Add Album</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class = "container"> 
<div class = "row">
<div class = "col-md-4">
<form action = "${pageContext.request.contextPath}/AlbumController1" method="POST">
<div class = "form-group"> <label>Album Name</label> <input type = "text" class = "form-control" name = "album_name"  /></div>
<div class = "form-group"> <label>Price</label><input type = "text" class = "form-control" name = "price" /> </div>
<div class="form-group"> <label>Status</label><input type = "text" class = "form-control" name = "status"/> </div>
<input type = "hidden" name = "album_id" value = "${album.album_id}"/>
<button type = "submit" class = "btn btn-primary">Save</button>
</form> </div> </div>
<a href = "${pageContext.request.contextPath}/AlbumController1?action=LIST">Back to Album List</a>
</div> </body> </html>
