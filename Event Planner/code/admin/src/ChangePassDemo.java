import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChangePassDemo")
public class ChangePassDemo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		
		String Pass = request.getParameter("Pass");
		String btn = request.getParameter("btn");
		
		Statement st;
		Connection con;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event planner","root","");
			st = con.createStatement();
			
			if(btn.equals("Submit"))
			{
				String q = "Update admin set password='"+Pass+"'";
				st.executeUpdate(q);
				response.sendRedirect("index.jsp");
			}
			else
			{
				
			}
		}
		catch(Exception e){ pw.print(e);}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
