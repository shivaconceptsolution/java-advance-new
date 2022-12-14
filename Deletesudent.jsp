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
<h1>Are you sure to delete the record</h1>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcexample","root","");
Statement st = conn.createStatement();
ResultSet res = st.executeQuery("select * from student where rno='"+request.getParameter("q")+"'");
if(res.next())
{%>
 <form action="StudentDeleteSer" method="post">
    <input type="hidden" value="<%= res.getString(1) %>" name="txtrno" />
     Rno is <%= res.getString(1) %>
    <br><br>
     Name is <%= res.getString(2) %>
    <br><br>
     Branch is <%= res.getString(3) %>
    <br><br>
     Fees is <%= res.getString(4) %>
     <br><br>
     <input type="submit" name="btnsubmit" value="Delete" />
  </form>



<%

}
%>
</body>
</html>