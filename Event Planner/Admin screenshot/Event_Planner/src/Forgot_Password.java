import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Forgot_Password")
public class Forgot_Password extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Forgot_Password() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Email = request.getParameter("email");
		String subject = " Event Planner Forgot Password ";
		String msg = ""; 
		String op = request.getParameter("Fpass");
		boolean b;
		Connection connection;
		Statement st;
		ResultSet rs;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/event planner","root","");
			st = connection.createStatement();
			if(op.equals("Next"))
			{
				String query ="Select *From customer_master where Email='"+Email+"'";
				rs = st.executeQuery(query);
				b = rs.next();
				if(b==true)
	        	{
					   response.sendRedirect("Forgot_Password2.jsp");
					   String Pass = null;
					   String q = "select  *from customer_master where Email='"+Email+"'";
					   rs = st.executeQuery(q);
					   while(rs.next())
					   {
						   Pass = rs.getString("Password");
					   }
					   msg="Your Event_Planner User_Id Is :: "+Email+" And Password Is :: "+Pass;
					   RSendMail.send(Email,subject,msg);
	        	}
				else
				{
					   response.sendRedirect("Forgot_Password.jsp");
				}
			}
			else
			{
				response.sendRedirect("index.jsp");
			}			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}
