import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CustomizePackage")
public class CustomizePackage extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public CustomizePackage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession(false);
		int Soup=0,Starter=0,Roti=0,Sabji=0,Dal=0,Rice=0,IceCream=0,Chinese=0,Cake=0;		
		
		Soup = Integer.parseInt(request.getParameter("Soup"));
		Starter = Integer.parseInt(request.getParameter("Starter"));
		Roti = Integer.parseInt(request.getParameter("Roti"));
		Sabji = Integer.parseInt(request.getParameter("Sabji"));
		Dal = Integer.parseInt(request.getParameter("Dal"));
		Rice = Integer.parseInt(request.getParameter("Rice"));
		IceCream = Integer.parseInt(request.getParameter("Ice-Cream"));
		Chinese = Integer.parseInt(request.getParameter("Chinese"));
		Cake = Integer.parseInt(request.getParameter("Cake"));
		int price = Integer.parseInt(request.getParameter("price1"));
		
		sess.setAttribute("Cprice", price);
		sess.setAttribute("Soup",Soup);
		sess.setAttribute("Starter",Starter);
		sess.setAttribute("Roti",Roti);
		sess.setAttribute("Dal",Dal);
		sess.setAttribute("Sabji",Sabji);
		sess.setAttribute("Rice",Rice);
		sess.setAttribute("IceCream",IceCream);
		sess.setAttribute("Chinese",Chinese);
		sess.setAttribute("Cake",Cake);
		
		String S = "";
		sess.setAttribute("S", S);
		response.sendRedirect("Invoice.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}