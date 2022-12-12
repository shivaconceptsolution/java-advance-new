<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <form action="StudentSer" method="post">
    <input type="text" name="txtrno" placeholder="Enter rno" />
    <br><br>
    <input type="text" name="txtname" placeholder="Enter name" />
    <br><br>
    <input type="text" name="txtbranch" placeholder="Enter branch" />
    <br><br>
     <input type="text" name="txtfees" placeholder="Enter fees" />
     <br><br>
     <input type="submit" name="btnsubmit" value="Insert" />
  </form>
  <br>
  <a href="viewstudent.jsp">View Student Record from here</a>
  <br>
  <%
  if(request.getParameter("q")!=null)
  {
	  out.print(request.getParameter("q"));
  }
  
  %>
</body>
</html> 