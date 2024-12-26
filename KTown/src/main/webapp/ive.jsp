<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.catalina.User" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>




   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet" href="css/album.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap"
 rel="stylesheet">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
 
<title>Album</title>
<style>
*{
	padding:0;
	margin:0;
	box-sizing: border-box;
	font-family: 'Montserrat',sans-serif;
	text-decoration: none;
	list-style: none;
	scroll-behavior: smooth;
}

:root{
	--bg-color:#ffffff;
	--text-color:#121212;
	--main-font:2.2rem;
	--p-font:1.1rem;
}

body{
	background: var(--bg-color);
	color:var(--text-color);
}

section{
	padding:100px 8%;
}

.container{
	grid-template-columns: 500px 500px 500px;/*repeat(auto-fit, minmax(360px,auto));*/
	
	gap:2rem;
	
	display:grid;
	
}

.box{
	
	padding:0px 20px 10px 20px;
	background: transparent;
	box-shadow: 5px 30px 56.1276px rgb(55 55 55 / 12%);
	border-radius: 10px;
	position: relative;
	transition: all .35s ease;
	display:inline-block;
	align-items: center;
	text-align: center;
	cursor: pointer;
	padding-top:2rem;
	width:300px;
	height:300px;
	margin-left: 50px;
	margin-bottom: 30px;
}

.box img{
	width:50%;
	height: auto;
}

.box h4{
	font-size: 15px;
	letter-spacing: 1px;
	margin-bottom: 8px;
}

.box h5{
	font-size: 14px;
	letter-spacing: 1px;
	margin-bottom: 20px;
}

.box .cart i{
	position:absolute;
	top:0;
	left:0;
	width:35px;
	height: 35px;
	background: var(--text-color);
	color:var(--bg-color);
	display:inline-flex;
	align-items: center;
	justify-content: center;
	font-size:18px;
}

.box:hover{
	transform: translateY(-5px);
}

.green{
	color:#228B22;
}

.red{
	color:red;
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

.popup {
		position: fixed;
		padding: 10px;
		max-width: 500px;
		border-radius: 0.5em;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		background-color: rgba(255,255,255,.9);
		visibility: hidden;
		opacity: 0;
		transition: opacity .5s, visibility 0s linear .5s;
		z-index: 1;
	}
	.popup:target {
		visibility: visible;
		opacity: 1;
		transition-delay: 0s;
	}
	.popup-close{
		position: absolute;
		padding: 10px;
		max-width: 500px;
		border-radius: 0.5em;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		
	}
	.popup .close{
		position: absolute;
		right: 5px;
		top: 5px;
		padding: 5px;
		color: #000;
		transition: color .3s;
		font-size: 2em;
		line-height: 1.5;
		font-weight: 700;
	}
	.popup .close:hover {
		color:#f00;
		
	}
	.close-popup{
		background-color: #rgba(0,0,0,.7);
		cursor: default;
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		opacity: 0;
		visibility: hidden;
		transition: opacity .5s, visibility 0s linear .5s;
		
	}
	.popup:target + .close-popup {
		opacity: 1;
		visibility: visible;
		transition-delay: 0s;
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
	


</style>
<script>
	function show(){
		var a=confirm("Your album is added to the cart successfully!");
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







<nav>
<div class="nav_logo">K-town</div>
<ul class="nav_links">
<li class="link"><a href="homepagestyle.jsp">Home</a></li>
<li class="link"><a href="cart.jsp">Your cart<span class="badge badge-danger">${cart_list.size() }</span></a></li>
<li class="link"><a href="contactus.jsp">Contact us</a></li>
<li class="link"><a href="userProfile.jsp"><i class="fa-solid fa-circle-user"></i></a></li>
</ul>
</nav>



<h1 align="center">IVE Albums Collections</h1>






<%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:/company", "root", "root");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM albums where album_name like '%IVE%'";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    int album_id = rs.getInt("album_id");
                    String album_name = rs.getString("album_name");
                    String price = rs.getString("price");
                    String status = rs.getString("status");
                    String filename=rs.getString("filename");
                    String path = rs.getString("path");
        %>
        

<div class="box">
<a href="#"><img src="<%=filename%>"/></a>
<h4><%=album_name%></h4>
<h5>USD$<%=price%></h5>
<h5 class="green"><%=status %></h5>
<div class="cart">
<a href="add-to-cart?album_id=<%=album_id %>" onclick="show()" ><i class="fa-solid fa-cart-shopping"></i></a>
</div>
</div>



<%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>


<script src="js/album.js"></script>
</body>
</html>