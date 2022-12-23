<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
function searchdata(a)
{
   var xmlhttp = new XMLHttpRequest();
   xmlhttp.onreadystatechange=function()
   {
	   if(a.length>0)
		   {
	       document.getElementById("res").innerHTML = xmlhttp.responseText;
		   }
	   else
		   {
		   document.getElementById("res").innerHTML="";
		   }
   }
   xmlhttp.open("POST","searchrec.jsp?q="+a,true);
   xmlhttp.send();

}

</script>
</head>
<body>
  <input type="text" placeholder="Enter record to be searched" onkeyup="searchdata(this.value)" />
  <div id="res">
  
  </div>
  
</body>
</html>