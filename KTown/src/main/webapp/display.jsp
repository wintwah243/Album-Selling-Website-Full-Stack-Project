<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Image Show</title>
    </head>
    <body>
        <%

            int album_id = Integer.parseInt(request.getParameter("album_id"));

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/company", "root", "root");
                Statement st = con.createStatement();
                String sql = "SELECT filename FROM albums where album_id=" + album_id + "";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    String filename = rs.getString("filename");
        %>

        <table style="width:100%">
            <tr>
                <th>Id</th>
                <th>Image</th>

            </tr>
            <tr>
                <td><%=album_id%></td><td>
                <td><td><image src="<%=filename%>" width="200" height="200"/></td>

            </tr>
        </table>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %><br>
    <center><a href="viewAll.jsp">View All </a></center>
</body>
</html>