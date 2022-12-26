<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <form name="frm1" action="Uploadser" method="post" enctype="multipart/form-data">
   <input type="file" name="file" />
   <br><br>
   <input type="submit" name="btnsubmit" value="Click" />
 </form>
 <%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcexample","root","");
Statement st = con.createStatement();
ResultSet x = st.executeQuery("select * from imgupload");
while(x.next())
{ %>
<img src="<%= "upload/"+x.getString(2) %>" width="100px" height="100px" />
	
<% }%>
 
</body>
</html>