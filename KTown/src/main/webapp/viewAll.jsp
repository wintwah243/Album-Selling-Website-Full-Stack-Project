<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
   
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Image Show</title>
    </head>
    <style>
    table{
    	text-align:center;
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
    <body>
    <nav>
<div class="nav_logo">Album Item List</div>
<ul class="nav_links">
<li class="link"><a href="admin.jsp">Home</a></li>
<li class="link"><a href="index.jsp">Add Album</a></li>
<li class="link"><a href="order-list.jsp">Order list</a></li>
<li class="link"><a href="login.jsp">Log out</a></li>

</ul>
</nav>
       

        <table style="width:100%" border="2" class="table">
         <thead class="thead-dark">
            <tr class="table-primary">
                
                <th scope="col" style="width:400px">Album Name</th>
                <th scope="col" style="width:100px">Price </th>
                <th scope="col" style="width:100px">Status</th>
                <th scope="col" style="width:400px">Image</th>
                <th scope="col">Action</th>
                
            </tr>
            </thead>
            </table>
             <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:/company", "root", "root");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM albums";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    int id = rs.getInt("album_id");
                    String album_name = rs.getString("album_name");
                    String price = rs.getString("price");
                    String status = rs.getString("status");
                    String filename=rs.getString("filename");
                    String path = rs.getString("path");
                    
        %>
             
            
            <table style="width:100%" border="2">
            <tr>
                
                <td style="width:400px"><%=album_name%></td>
                <td style="width:100px"><%=price%></td>
                <td style="width:100px"><%=status %>
                <td style="width:400px"><img src="<%=filename%>" width="150" height="200"/></td>
                <td> <a href = "${pageContext.request.contextPath}/edit?album_name=<%=album_name%>" class="btn btn-info">Edit</a> 
					| 
				<a onclick="show()" href = "${pageContext.request.contextPath}/AlbumController1?action=DELETE&album_id=<%=id%>" class="btn btn-warning">Delete</a> </td>
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