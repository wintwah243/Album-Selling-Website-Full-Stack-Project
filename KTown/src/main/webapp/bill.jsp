<%@page import="util.DBconnection"%>
<%@page import="dao.albumDAO"%>
<%@page import="dao.UserDao" %>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="org.apache.catalina.User" %>
<%@page import="java.sql.Connection" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10"></link>

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
<% 
    // Retrieve the username from the session attribute 
     session = request.getSession(); 
    String username = (String) session.getAttribute("username"); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

 
  <title>Bill</title>
  <style>
  @import url('https://fonts.googleapis.com/css2?family=Monsterrat:wght@300;400;500;600;700&display=swap');

*{
  font-family: 'Poppins', sans-serif;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  outline: none; border: none;
  text-transform: capitalize;transition: all .2s linear;
}

.container{
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 25px;
  min-height: 100vh;
  background: #c7f2e3;
  padding-bottom: 70px;

}

.container form{
  padding: 20px;
  width: 700px;
  background: #a1dd70;
  box-shadow: 0 5px 10px rgba(0,0,0,1);
  border-radius:15px;
}

.container form  .row{
  display: flex;
  flex-wrap: wrap;
  gap: 15px;
}

.container form  .row .col{
  flex: 1 250px;

}

.container form  .row .col .title{
  font-size: 20px;
  color: #333;
  padding-bottom: 5px;
  text-transform: uppercase;
}

.container form  .row .col .inputBox{
  margin: 15px 0px;
  border-radius:15px;

}

.container form  .row .col .inputBox span{
  margin-bottom: 5px;
  display: block;
  border-radius:15px;
  
}

.container form  .row .col .inputBox input{
  width: 100%;
  border: 1px solid #ccc;
  padding: 10px 15px;
  font-size: 15px;
  text-transform: none;
  border-radius:15px;
}

.container form  .row .col .inputBox input:focus{
  border: 1px solid #000;
  border-radius:15px;

}

.container form  .row .col .flex{
  display: flex;
  gap: 15px;
}

.container form  .row .col .flex .inputBox{
  margin-top: 5px;
}

.container form  .row .col .flex .inputBox img{
  height:34px; 
  margin-top:5px;
  filter: drop-shadow(0 0 1px #000);
}
.container form .submit{
  background-color:black;
	color:#fff;
	font-size: 12px;
	padding:10px 45px;
	border: 1px solid transparent;
	border-radius:8px;
	font-weight: 600;
	letter-spacing: 0.5px;
	text-transform: uppercase;
	margin-top:10px;
	cursor:pointer;
	margin-left:200px;

}
img{
	height:45px;
	width:200px;
}


.container form .submit:hover{
  background: purple;
}

</style>
<script>
	function show(){
		var a=confirm("Your order is completed successfully!!!");
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
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
  <div class= "container">
    <form action="order" method="post">
      <div class="row">
      <div class="col">
        <h3 class="title">billing address</h3>

        <div class="inputBox">
          <span>full name:</span>
          <input type="text"  name="customer_name" value="<%=username%>">
        </div>
        <div class="inputBox">
          <span>address:</span>
          <input type="text" placeholder="Enter Address" name="address">
        </div>
        <div class="inputBox">
          <span>Total Price:$</span>
          <input type="text"  name="email" value= ${(total>0)?dcf.format(total):0} "$">
        </div>
        <div class="inputBox">
          <span>city:</span>
          <input type="text" placeholder="mumbai" name="city">
        </div>
        <%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>

        <div class="flex">
          <div class="inputBox">
          <span>Quantity:</span>
          <input type="text" value="<%=c.getQuantity()%>" name="o_quantity">
        </div>
        <div class="inputBox">
          <span>Album Name :</span>
          <input type="text" value="<%=c.getAlbum_name() %>" name="album_name">
        </div>
        
        </div>
        <%
        cart_list.clear();

				}}%>
      </div>

      <div class="col">
        <h3 class="title">payment</h3>

        <div class="inputBox">
          <span>name on card:</span>
          <input type="text" placeholder="mr. john deo">
        </div>
        <div class="inputBox">
          <span>card accepted:</span>
          <img src="https://www.transparentpng.com/thumb/credit-card/EOCaA7-credit-card-hd-photo-png.png">
        </div>
        <div class="inputBox">
          <span>credit card number:</span>
          <input type="number" placeholder="1111-2222-3333-4444">
        </div>
        <div class="inputBox">
          <span>exp month :</span>
          <input type="text" placeholder="january">
        </div>

        <div class="flex">
          <div class="inputBox">
          <span>exp year:</span>
          <input type="number" placeholder="2022">
        </div>
        <div class="inputBox">
          <span>CVV:</span>
          <input type="text" placeholder="1234">
        </div>
        </div>
      </div>
    </div>

    <input type="submit" value ="proceed to order" class="submit" >
    </form>
    
  </div>
  <script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	<script type="text/javascript">
	var status = document.getElementById("status").value;
	if(status=="success"){
		swal("Congrats","Order Completeded Successfully!","success");
	}
	</script>
	
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	<script type="text/javascript">
	var status = document.getElementById("status").value;
	if(status=="failed"){
		swal("Sorry","Order Failed","failed");
	}
	
	</script>
	
	

	<script src="js/login.js">
</script>
	
</body>
</html>