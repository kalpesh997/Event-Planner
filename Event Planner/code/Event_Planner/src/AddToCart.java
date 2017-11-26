import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.util.DBConnection;

@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		Connection con = DBConnection.getConnection();
		ResultSet rs;
		try
		{
			HttpSession sess = request.getSession();
			int Customerid = (Integer)sess.getAttribute("Customerid");
			Statement st = con.createStatement();
			
			String Button1 = request.getParameter("ReadyPackage");
			String[]  array = Button1.split("_");
			String B1 = array[0];
			int Addid = Integer.parseInt(array[1]);
			
			
			if(B1.equals("Book"))
			{
				int Eventid = Integer.parseInt(array[2]);
				int Themeid = Integer.parseInt(array[3]);
				int Venueid = Integer.parseInt(array[4]);
				String date1 = (array[5]);
				int personno = Integer.parseInt(array[6]);
				int Price = Integer.parseInt(array[7]);
				int Packageid = Integer.parseInt(array[8]);
				
				String Q1 = "select *from ready_package where Ready_Package_Id="+Packageid+"";
				rs=st.executeQuery(Q1);
				int Pprice=0;
				while(rs.next())
				{
					Pprice = rs.getInt(4);
				}
				
				sess.setAttribute("Addid", Addid);
				sess.setAttribute("Customerid", Customerid);
				sess.setAttribute("Eventid", Eventid);
				sess.setAttribute("Themeid", Themeid);
				sess.setAttribute("Venueid", Venueid);
				sess.setAttribute("Date", date1);
				sess.setAttribute("PersonNo", personno);
				sess.setAttribute("Total_Price",Price);
				sess.setAttribute("PackageId",Packageid);
				sess.setAttribute("Pprice", Pprice);
				String S = "RReady";
				sess.setAttribute("S", S);
				response.sendRedirect("Invoice.jsp");
	  		}
			else
			{
				String Q = "delete from addtocart where Addtocart_Id="+Addid+"";
				st.executeUpdate(Q);
				response.sendRedirect("AddToCart.jsp");
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
}
}
