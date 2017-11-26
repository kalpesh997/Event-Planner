import java.io.IOException;
import java.sql.*;
import java.sql.DriverManager;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/check")
public class check extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public check() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int UOTP =Integer.parseInt( request.getParameter("OTP1"));
		
		HttpSession sess = request.getSession();
		int S = (Integer)sess.getAttribute("OTP");
		String email = (String)sess.getAttribute("Email");
		
		try{
		Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/event planner","root","");
        Statement st = connection.createStatement();
        
		if(UOTP==S)
		{	        
			 DateFormat df = new SimpleDateFormat("yyyy/MM/dd"); 
 		   	Date d = new Date();
 		    String d1 = (df.format(d)); 
		    
			String name = (String)sess.getAttribute("name");
    		long phone = (long)sess.getAttribute("phone");
    		String pass = (String)sess.getAttribute("pass");
    		String city = (String)sess.getAttribute("city");
    		
    		String query = "Insert into customer_master (Customer_Name,Mobile_No,Email,Password,Date_Of_Registration,City_Name) values('"+name+"',"+phone+",'"+email+"','"+pass+"','"+d1+"','"+city+"')";
			st.executeUpdate(query);
			response.sendRedirect("Sign-In.jsp");
		}
		else
		{
			int n = (int)(Math.random() * 100000 + 2);
			sess.setAttribute("OTP", n);
			
			String subject = " Event Planner Registeration ";
			String msg = " *....Your Succesfully Registration....* \n Your OTP Code Is : "+n; 
			
			RSendMail.send(email,subject,msg);
			response.sendRedirect("OTP.jsp");
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
