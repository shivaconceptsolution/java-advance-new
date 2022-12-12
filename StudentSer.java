

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class StudentSer
 */
@WebServlet("/StudentSer")
public class StudentSer extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcexample","root","");
		Statement st = conn.createStatement();
		int x = st.executeUpdate("insert into student(rno,name,branch,fees) values('"+request.getParameter("txtrno")+"','"+request.getParameter("txtname")+"','"+request.getParameter("txtbranch")+"','"+request.getParameter("txtfees")+"')");
		if(x!=0)
		{
			response.sendRedirect("Student.jsp?q=data submitted successfully");
		}
		else
		{
			response.sendRedirect("Student.jsp?q=insert fail");
		}
		}
		catch(Exception ex)
		{
			out.write(ex.getMessage().toString());
		}
	}

}
