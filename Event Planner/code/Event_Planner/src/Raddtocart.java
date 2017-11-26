import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.util.DBConnection;

@WebServlet("/Raddtocart")
public class Raddtocart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Raddtocart() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Connection con = DBConnection.getConnection();
		 HttpSession sess = request.getSession(false);
			
			try{
				Statement st = con.createStatement();
				
				String Package1 = (String)request.getParameter("Pa");	
				String[]  array = Package1.split("_");
				
				int Customerid = (Integer)sess.getAttribute("Customerid");
	  			int Eventid = (Integer)sess.getAttribute("Eventid");
	  			int Themeid = (Integer)sess.getAttribute("Themeid");
	  			int Venueid = (Integer)sess.getAttribute("Venueid");
	  			String Date2 = (String) sess.getAttribute("Date");
	  			StringTokenizer stn = new StringTokenizer(Date2,"/");
	  			String mm = stn.nextToken();
	  			String dd = stn.nextToken();
	  			String yy = stn.nextToken();
	  			String Date1 = (yy+"/"+mm+"/"+dd);
	  			int PersonNo = (Integer)sess.getAttribute("PersonNo");
	  			int Packageid = Integer.parseInt(array[0]);
	  			int Total_Price = Integer.parseInt(array[1]);
	  	
	  			String q = "Insert Into addtocart(Customer_Id,Event_Id,Theme_Id,Venue_Id,Event_Date,Person_No,Total_Price,Package_Name,Package_Id) values ("+Customerid+","+Eventid+","+Themeid+","+Venueid+",'"+Date1+"',"+PersonNo+","+Total_Price+",'"+"R"+"',"+Packageid+")";
	  			st.executeUpdate(q);
	  			response.sendRedirect("index.jsp");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
