import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/signin")
public class signin extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter(); 
		
		Statement st;
		ResultSet rs;
		Connection con;
		
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		boolean b = false;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/event planner","root","");
			st= con.createStatement();
						
			String q = "select *from admin where user_name='"+email+"'and password='"+pass+"'";
			HttpSession sess = request.getSession();
				rs = st.executeQuery(q);
				b = rs.next();
				
				if(b==true)
				{			
					sess.setAttribute("email",email);
					response.sendRedirect("Aindex.jsp");
				}
				else
				{	
					  response.sendRedirect("ASign-in.jsp");
				}
		}
		catch(Exception e){ pw.print(e); }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
