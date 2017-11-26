import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

@WebServlet("/fetchDates")
public class fetchDates extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public fetchDates() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			ArrayList<Date> dates = new ArrayList<Date>();
			
			HttpSession sess = request.getSession(false);
			int Venueid = (int) (sess.getAttribute("Venueid"));
			
			Connection connection;
			Statement st;
			ResultSet rs;
					
			try {
				Class.forName("com.mysql.jdbc.Driver");
			
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/event planner","root","");
			st = connection.createStatement();
			String query ="Select Date_of_Event From order_master where venue_id= "+Venueid+" order by Date_of_Event desc";
			
			rs = st.executeQuery(query);
			
			while(rs.next())
			{
				DateFormat sm = new SimpleDateFormat("yy/MM/dd");
				String strDate = sm.format(rs.getDate(1));
			    Date dt = sm.parse(strDate);
				dates.add(dt);				
			}
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
			
			Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(dates, new TypeToken<List<Date>>() {}.getType());

			JsonArray jsonArray = element.getAsJsonArray();
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
