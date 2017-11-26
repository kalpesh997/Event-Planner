package com.db.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.dao.EventDao;
import com.db.model.Event;
import com.db.util.DbUtil;


public class EventController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static String LIST_USER = "/EditEvent.jsp";
    private static String EDIT_USER = "/UpdateEvent.jsp";
    private EventDao dao;
	
    public EventController() {
        super();
        dao = new EventDao();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward="";
        String action = request.getParameter("action");
        Connection conn = DbUtil.getConnection();
        ResultSet rs;
        
        if (action.equalsIgnoreCase("delete"))
        {
        	forward = LIST_USER;
            int eventId = Integer.parseInt(request.getParameter("Eventid"));
            
            
            String Q = "select Categorie_Id from food_item where Food_Item_Id='"+eventId+"'";
            try 
            {	Statement st = conn.createStatement();
				rs = st.executeQuery(Q);
				while(rs.next())
				{
					int cat_id = rs.getInt("Categorie_Id"); 
		            dao.deleteEvent(eventId);
		            request.setAttribute("events", dao.getAllEvents(cat_id));
				}
			} 
            catch (SQLException e) 
            {
				e.printStackTrace();
			}
            
        }
        else if (action.equalsIgnoreCase("edit"))
        {
            forward = EDIT_USER;
            int eventId = Integer.parseInt(request.getParameter("EventId"));
            Event event = dao.getEventById(eventId);
            request.setAttribute("event", event);
        }
	    else if (action.equalsIgnoreCase("listUser"))
        {
	    	forward = LIST_USER;
            int Cat_Id = Integer.parseInt(request.getParameter("eventId"));
            request.setAttribute("events", dao.getAllEvents(Cat_Id));
        } 
        else
        {
            forward = LIST_USER;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Event event = new Event();
		
		event.setFid(Integer.parseInt(request.getParameter("fid")));
		int Cid = Integer.parseInt(request.getParameter("fcid"));
		event.setCid(Cid);
		event.setFoodcategorie(request.getParameter("fcate"));
        event.setPrice(Integer.parseInt(request.getParameter("fprice")));
 
        dao.updateEvent(event);
        
        RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
        request.setAttribute("events", dao.getAllEvents(Cid));
        view.forward(request, response);
	} 
}