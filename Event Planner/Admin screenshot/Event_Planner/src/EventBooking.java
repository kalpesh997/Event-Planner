import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EventBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public EventBooking() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		try{
		HttpSession sess = request.getSession(false);
		String op = request.getParameter("ENext");
		if(op.equals("Next"))
		{
			String d = request.getParameter("BookingDate");
			sess.setAttribute("Date", d);
			int personNo = Integer.parseInt(request.getParameter("PersonNo"));
			String package1 = request.getParameter("Package1");
			
			sess.setAttribute("PersonNo", personNo);
			
			if(package1.contains("Ready"))
			{
				sess.setAttribute("Package1", package1);
				response.sendRedirect("ReadyPackage.jsp");
			}
			else
			{
				sess.setAttribute("Package1", package1);
				response.sendRedirect("CustomizePackage.jsp");
			}		
		}
		else
		{
			response.sendRedirect("index.jsp");
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
