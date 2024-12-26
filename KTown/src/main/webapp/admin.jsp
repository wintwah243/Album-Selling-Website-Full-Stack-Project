<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet" href="css/admin.css">

<title>Admin Page</title>
</head>
<body>

<div class="sidebar">
	<div class="sidebar-brand">
		<h2>K-town</h2>
	</div>
	<div class="sidebar-menu">
	<ul>
	<li><a href="admin.jsp"><span><i class="fa-solid fa-house"></i></span><span>Home</span></a></li>
	<li><a href="index.jsp"><span><i class="fa-solid fa-plus"></i></span><span>add album</span></a></li>
	<li><a href="viewAll.jsp"><span><i class="fa-solid fa-chart-simple"></i></span><span>Album Item List</span></a></li>
	<li><a href="order-list.jsp"><span><i class="fa-solid fa-truck"></i></span><span>Orders</span></a></li>
	<li><a href="login.jsp"><span><i class="fa-solid fa-right-from-bracket"></i></span><span>Log out</span></a>
	
	</ul>
	</div>
</div>

<div class="main-content">
	<header>
		<h2>
					<label for="nav-toggle">
		<span class="fa-solid fa-bars"></span>
		</label>
		Home
		</h2>
		
		<div class="user-wrapper">
		<i class="fa-solid fa-circle-user"></i>
		<div>
		<h4>Wint Wah</h4>
		<small>Admin</small>
		</div>
		</div>
	</header>
	
		<main>
		
		<div class="cards">
		<a href="index.jsp">
			<div class="card-single">
				<div>
				<h1>Add Album</h1>
				</div>
				<div>
				<span class="fa-solid fa-plus"></span>
				</div>
			</div>
			</a>
		
		
		
			<a href="viewAll.jsp">
			<div class="card-single">
				<div>
				<h1>Album Item List</h1>
				</div>
				<div>
				<span class="fa-solid fa-chart-simple"></span>
				</div>
			</div>
			</a>
			
			<a href="order-list.jsp">
			<div class="card-single">
				<div>
				<h1>Orders</h1>
				</div>
				<div>
				<span class="fa-solid fa-truck"></span>
				</div>
			</div>
			</a>
		
		</div>
		</main>
</div>

<h3>Customers</h3>

</body>
</html>