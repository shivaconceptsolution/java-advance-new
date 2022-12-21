<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
function validate()
{
	var userid = document.getElementById("txtuid").value;
	var upass = document.getElementById("txtpass").value;
	var email = document.getElementById("txtemail").value;
	var mobile = document.getElementById("txtmobile").value;
	var atpos = email.indexOf("@");
	var dotpos = email.lastIndexOf(".");
	  if(!isNaN(userid))
		{
		   alert("Userid only contain alphabet character");
		   document.getElementById("umsg").innerHTML = "Userid only contain alphabet character";
		   return false;
		}
	  else if(upass.length<6)
		  {
		  alert("Password should be minimum five characters");
		  document.getElementById("umsgpass").innerHTML = "Password should be minimum five characters";
		  return false;
		  }
	  else if(atpos==-1 || dotpos == -1 || atpos>dotpos || (dotpos-atpos) <3 || dotpos==email.length-1)
		  {
		  alert("Invalid emailid");
		  return false;
		  }
	  else if(isNaN(mobile))
		  {
		  alert("Mobile number should be numeric");
		  return false;
		  }
	  else if(mobile.length!=10)
		  {
		  alert("Mobile number should be 10 digits");
		  return false;
		  }
	
}


</script>
</head>
<body>
<a href="login.jsp">Log in</a>
<form action="RegSer" method="post">
    <input type="text" id="txtuid" name="txtuid" placeholder="Enter userid" required />
    <span id="umsg" style='color:red;'></span>
    <br><br>
    <input type="password" id="txtpass" name="txtpass" placeholder="Enter password" required />
    <span id="umsgpass" style='color:red;'></span>
    <br><br>
    <input type="email" id="txtemail" name="txtemail" placeholder="Enter email" required />
    <br><br>
     <input type="text" id="txtmobile" name="txtmobile" placeholder="Enter mobile" required />
     <br><br>
     <input type="submit" name="btnsubmit" value="Register" onclick="return validate()" />
  </form>
   <%
  if(request.getParameter("q")!=null)
  {
	  out.print(request.getParameter("q"));
  }
  
  %>
</body>
</html>