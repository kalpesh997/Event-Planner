import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.util.*;

@WebServlet("/Sign_In")
public class Sign_In extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Sign_In() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess=request.getSession(false);
		try{
			String Email = request.getParameter("Semail");
			String Pass = request.getParameter("Spass");
					
			Connection connection;
			Statement st;
			ResultSet rs;
					
			
			connection = DBConnection.getConnection();
			st = connection.createStatement();
			String query ="Select * From customer_master where Email='"+Email+"'and Password='"+Pass+"'";
			
			rs = st.executeQuery(query);			
			
			if(rs.next())
			{
				int Customerid = rs.getInt("Customer_Id");
				String name = rs.getString("Customer_Name");
				long mobile = rs.getLong("Mobile_No");
				
				sess.setAttribute("Customerid", Customerid);
				sess.setAttribute("Name", name);
				sess.setAttribute("Mobile",mobile);
				sess.setAttribute("Email",Email);
				int signin=0;
				try{
					signin = (Integer)sess.getAttribute("Themeid");
				}
				catch(Exception e)
				{
					
				}
			
				if(signin!=0)
				{
					response.sendRedirect("Venue.jsp");
				} 
				else if(signin==0)
				{
					String s1 = "";
					sess.setAttribute("S1", s1);
					response.sendRedirect("index.jsp");
				}				
			}
			else
			{
				String A = "Wrong";
				sess.setAttribute("A1", A);
				response.sendRedirect("Sign-In.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}