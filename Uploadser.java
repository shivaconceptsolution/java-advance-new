

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import java.sql.*;
/**
 * Servlet implementation class Uploadser
 */
@WebServlet("/Uploadser")
public class Uploadser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Uploadser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		 try
			{
	        	
	    		response.setContentType("text/html");
	    		MultipartRequest m=new MultipartRequest(request,getServletContext().getRealPath("/")+"upload");
	    		out.print(m.getFilesystemName("file")+"<br>");
	    		out.print(m.getContentType("file")+"<br>");
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcexample","root","");
				Statement st = con.createStatement();
				int x = st.executeUpdate("insert into imgupload(path) values('"+m.getFilesystemName("file")+"')");
				if(x!=0)
				{
					response.sendRedirect("fupload.jsp");
					//out.print("File uploaded Successfully");
				}
				con.close();
			}
			catch(Exception ex)
			{
				out.print(ex.getMessage().toString());
			}
		}
	}


