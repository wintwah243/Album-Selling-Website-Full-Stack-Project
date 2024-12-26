<%@page import="util.DBconnection"%>
<%@page import="dao.albumDAO"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="org.apache.catalina.User" %>
<%@page import="java.sql.Connection" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
	
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("user", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	
	albumDAO pDao = new albumDAO(DBconnection.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.jsp"%>
<title>Ktown Cart</title>
<style type="text/css">

.table tbody td{
vertical-align: middle;
border-radius:2px;
}
.btn-incre, .btn-decre{
box-shadow: none;
font-size: 25px;

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
body{
	background-color: #c9d6ff;
	background: linear-gradient(to right,#8ef6e4,#ff347f);
}
table{
	border-radius:15px;
}

</style>
</head>
<body>
<nav>
<div class="nav_logo">K-town</div>
<ul class="nav_links">
<li class="link"><a href="homepagestyle.jsp">Home</a></li>
<li class="link"><a href="cart.jsp">Your cart<span class="badge badge-danger">${cart_list.size() }</span></a></li>
<li class="link"><a href="shop.jsp">Continue Shopping</a></li>
<li class="link"><a href="userProfile.jsp"><i class="fa-solid fa-circle-user"></i></a></li>
</ul>
</nav>
	

	<div class="container my-3">
		<div class="d-flex py-3"><h3>Total Price: $ ${(total>0)?dcf.format(total):0} </h3> <a class="btn btn-info" href="bill.jsp">Check Out</a></div>
		<table class="table table-skyblue">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Status</th>
					<th scope="col">Price $</th>
					<th scope="col">Quantity</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
				<tr>
					<td><%=c.getAlbum_name()%></td>
					<td><%=c.getStatus()%></td>
					<td><%= dcf.format(c.getPrice())%></td>
					<td>
						<form action="order" method="post" class="form-inline">
						<input type="hidden" name="album_id" value="<%= c.getAlbum_id()%>" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&album_id=<%=c.getAlbum_id()%>"><i class="fas fa-plus-square"></i></a> 
								<input type="text" name="quantity" class="form-control"  value="<%=c.getQuantity()%>" readonly> 
								<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&album_id=<%=c.getAlbum_id()%>"><i class="fas fa-minus-square"></i></a>
							</div>
							
						</form>
					</td>
					<td><a href="remove-from-cart?album_id=<%=c.getAlbum_id() %>" class="btn btn-danger">Remove</a></td>
				</tr>
					
				<%
								}}%>
			</tbody>
		</table>
	</div>

	
</body>
</html>