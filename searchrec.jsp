<%@page import="java.sql.*" %> 
<table>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcexample","root","");
Statement st = conn.createStatement();
ResultSet res = st.executeQuery("select * from student where name like '"+request.getParameter("q")+"%'");
while(res.next())
{%>

<tr><td><%= res.getString(1) %></td><td><%= res.getString(2) %></td><td><%= res.getString(3) %></td> </tr>
	
<%}
res.close();
conn.close();


%>
</table>
