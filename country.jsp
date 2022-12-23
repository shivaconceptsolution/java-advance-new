<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
function showstate(param)
{
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange=function()
	{
		document.getElementById("res").innerHTML = xmlhttp.responseText;
	}
	xmlhttp.open("GET","state.jsp?q="+param,true);
	xmlhttp.send();
}
function showcity(param)
{
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange=function()
	{
		document.getElementById("res1").innerHTML = xmlhttp.responseText;
	}
	xmlhttp.open("GET","city.jsp?q="+param,true);
	xmlhttp.send();
}
</script>
</head>
<body>
<select id="country" onchange="showstate(this.value)">
<option value="">Select Country</option>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcexample","root","");
Statement st = conn.createStatement();
ResultSet res = st.executeQuery("select * from country");
while(res.next())
{%>
<option value="<%= res.getString(1) %>"> <%= res.getString(2) %></option> 
	
<%}

res.close();
conn.close();

%>
</select>
<br>
<div id="res">
</div>
<div id="res1">
</div>
</body>
</html>