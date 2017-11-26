import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateDemo")
public class UpdateDemo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		
		Statement st;
		Connection con;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/event planner","root","");
			st=con.createStatement();
					
				String s = request.getParameter("Custid");

				String cname = request.getParameter("username");
				String m = request.getParameter("mobileno");
				String email = request.getParameter("email");
			
				String q = "update customer_master set Customer_Name='"+cname+"' , Mobile_No='"+m+"', Email='"+email+"'where Customer_id= "+s;
				st.executeUpdate(q);
				
				response.sendRedirect("user.jsp");
		}
		catch(Exception e)
		{
			pw.print(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
