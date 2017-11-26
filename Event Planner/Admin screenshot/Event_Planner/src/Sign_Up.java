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
import javax.servlet.http.HttpSession;

@WebServlet("/Sign_Up")
public class Sign_Up extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Sign_Up() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession(false);
		
		boolean b;
		String email = request.getParameter("RAddress");
		int n = (int)(Math.random() * 100000 + 2);
		sess.setAttribute("OTP", n);
		
		String subject = " Event Planner Registeration ";
		String msg = " *....Your Succesfully Registration....* \n\n Your OTP Code Is : "+n; 
		
		try 
		{			
			String name=request.getParameter("RName");
			long phone=Long.parseLong(request.getParameter("RMoNo"));
			String pass=request.getParameter("RPass");
			String city=request.getParameter("RCity");	
			
			String op = request.getParameter("RSubmit");
			Connection connection;
			Statement st;
			ResultSet rs;
			
	        Class.forName("com.mysql.jdbc.Driver");
	        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/event planner","root","");
	        st = connection.createStatement();
	       
	        if(op.equals("Register"))
	        {
	        	String query1 = "select *from customer_master where Email='"+email+"'";
	        	rs = st.executeQuery(query1);
	        	b=rs.next();
	        	if(b==true)
	        	{
	        	       response.sendRedirect("Sign-Up.jsp");
	        	}
	        	else
	        	{
	        		sess.setAttribute("name", name);
	        		sess.setAttribute("phone", phone);
	        		sess.setAttribute("pass", pass);
	        		sess.setAttribute("city", city);
	        		
	 				RSendMail.send(email,subject,msg);
					sess.setAttribute("Email", email);
				    response.sendRedirect("OTP.jsp");
	        	}
	        }
	        else
	        {
	        	response.sendRedirect("Sign-In.jsp");
	        }
		}
	    catch (Exception e)
		{
	    	e.printStackTrace();
	    }
	}
}
