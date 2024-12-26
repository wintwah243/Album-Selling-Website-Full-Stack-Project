<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/order-list.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"> 

<!DOCTYPE html>
<html>
    <head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order-List</title>
    </head>
    <style>
    .header tr th{
    	border:2px solid black;
    }
    .body tr td{
    	border:2px solid black;
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
    <body>
       <nav>
<div class="nav_logo">Order List</div>
<ul class="nav_links">
<li class="link"><a href="admin.jsp">Home</a></li>
<li class="link"><a href="index.jsp">Add Album</a></li>
<li class="link"><a href="viewAll.jsp">Album list</a></li>
<li class="link"><a href="login.jsp">Log out</a></li>

</ul>
</nav>
    
       
    
        <table border="2" class="table">
    <thead class="thead-dark">
            <tr border="2">
                <th scope="col" style="width:200px">Customer Name</th>
                <th scope="col" style="width:400px">Ordered Item Name</th>
                <th scope="col" style="width:70px">Quantity </th>
                <th scope="col" style="width:300px">Address</th>
               
               
                
            </tr>
            </thead>
            </table>
            <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:/company", "root", "root");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM orders";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                   String customer_name=rs.getString("customer_name");
                    String album_name = rs.getString("album_name");
                    
                    int o_quantity=rs.getInt("o_quantity");
                    String address = rs.getString("address");
        %>
            <table  border="2" class="table">
            <tr border="2">
                <td scope="col" style="width:200px"><%=customer_name%></td>
                <td scope="col" style="width:400px"><%=album_name%></td>
                <td scope="col" style="width:70px"><%=o_quantity%></td>
                <td scope="col" style="width:300px"><%=address%></td>
                
                
            </tr>
            
        </table>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>