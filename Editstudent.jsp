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
<h1>Edit record form</h1>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcexample","root","");
Statement st = conn.createStatement();
ResultSet res = st.executeQuery("select * from student where rno='"+request.getParameter("q")+"'");
if(res.next())
{%>
 <form action="StudentEditSer" method="post">
    <input type="text" name="txtrno" value="<%= res.getString(1) %>" readonly="true" />
    <br><br>
    <input type="text" name="txtname" value="<%= res.getString(2) %>" />
    <br><br>
    <input type="text" name="txtbranch" value="<%= res.getString(3) %>" />
    <br><br>
     <input type="text" name="txtfees" value="<%= res.getString(4) %>" />
     <br><br>
     <input type="submit" name="btnsubmit" value="Edit" />
  </form>



<%

}
%>
</body>
</html>