<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*" %>
   
   <select id="state" onchange="showcity(this.value)">
<option value="">Select State</option>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcexample","root","");
Statement st = conn.createStatement();
ResultSet res = st.executeQuery("select * from state where countryid='"+request.getParameter("q")+"'");
while(res.next())
{%>
<option value="<%= res.getString(1) %>"> <%= res.getString(2) %></option> 
	
<%}

res.close();
conn.close();

%>
</select>