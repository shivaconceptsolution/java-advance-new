<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*" %>
   
   <select>
<option value="">Select city</option>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcexample","root","");
Statement st = conn.createStatement();
ResultSet res = st.executeQuery("select * from city where stateid='"+request.getParameter("q")+"'");
while(res.next())
{%>
<option value="<%= res.getString(1) %>"> <%= res.getString(2) %></option> 
	
<%}

res.close();
conn.close();

%>
</select>