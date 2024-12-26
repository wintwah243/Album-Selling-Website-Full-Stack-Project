<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html> <head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Album List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"> 
<style>
	.delete_cont{
		width: 60%;
		padding: 5%;
		margin: 20%;
		background: white;
		display: none;
	}
	.delete_actions{
		display: flex;
	}
	.close{
		font-size: 30px;
		font-weight: bolder;
		margin-top: -5%;
		float: right;
		cursor: pointer;
	}  
	.cancel{
		width: 50%;
		height: 5vh;
		background: gray;
		border: none;
		color:white;
		margin-right: 1%;
		cursor: pointer;
	}
	.delete{
		width: 50%;
		height: 5vh;
		background: red;
		border: none;
		color:white;
		margin-left: 1%;
		cursor: pointer;
	}
</style>
<script>
	function show(){
		var a=confirm("Are you sure to delete?");
		if(a==true){
			document.write("");
		}
		else{
			document.write("");
		}
	}
</script>
</head>
<body>
 <div class = "container">
  <h1>Album List</h1>
<p>${MSG}</p>
<p> <button class = "btn btn-primary" onclick="window.location.href = 'album-form.jsp'">Add album</button> </p>
<table class = "table table-bordered">
<tr> <th>Album Name</th> <th>Price</th> <th>Status</th> <th>Actions</th> </tr>
<c:forEach items="${albumlist}" var="alb"> 
<tr> <td>${alb.album_name}</td>
<td>${alb.price}</td>
<td>${alb.status}</td>
<td> <a href = "${pageContext.request.contextPath}/AlbumController1?action=EDIT&album_id=${alb.album_id}">Edit</a> 
| 
<a onclick="show()" href = "${pageContext.request.contextPath}/AlbumController1?action=DELETE&album_id=${alb.album_id}">Delete</a> </td> </tr>

</c:forEach>
</table>
 </div>
 
 
</body> 
</html>
