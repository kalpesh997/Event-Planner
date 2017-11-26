

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.util.DBConnection;

/**
 * Servlet implementation class DeleteEvent
 */
@WebServlet("/DeleteEvent")
public class DeleteEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEvent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
		String op = request.getParameter("deleteEvent");
		String[]  array = op.split("_");
		int Orderid = Integer.parseInt(array[0]);
		
		Connection con = DBConnection.getConnection();
		Statement st = con.createStatement();
		
		String Q = "delete from order_master where Order_Id="+Orderid+"";
		st.executeUpdate(Q);
		response.sendRedirect("History.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
