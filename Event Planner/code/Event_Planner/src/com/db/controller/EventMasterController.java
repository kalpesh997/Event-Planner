package com.db.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.dao.EventMasterDBOP;
import com.db.model.CustomerMaster;


public class EventMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String profile = "/Profile.jsp";
	private static String Edit_Profile = "/UpdateProfile.jsp";
	private EventMasterDBOP EMDBOP;
	
    public EventMasterController() {
        super();
        EMDBOP =new EventMasterDBOP() ;
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward=" ";
		String Action = request.getParameter("action");
		HttpSession sess = request.getSession(false);
		String email = (String)sess.getAttribute("Email");
		
		if(Action.equalsIgnoreCase("edit"))
		{
			forward = Edit_Profile;
			
			CustomerMaster CM4 = EMDBOP.getUserById(email);
			request.setAttribute("EditUser",CM4);
		}
		else if(Action.equalsIgnoreCase("profile"))
		{
			forward = profile;
			request.setAttribute("profile", EMDBOP.getUserById(email));
		}
		
		RequestDispatcher RD = request.getRequestDispatcher(forward);
		RD.forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerMaster CM1 = new CustomerMaster(); 
		
		CM1.setCustomername(request.getParameter("customername"));
		
		String mobileno = request.getParameter("mobileno");
		CM1.setMobileno(Long.parseLong(mobileno));
		
		CM1.setCityname(request.getParameter("city"));
		
		String email = request.getParameter("email");
		CM1.setEmail(email);
		
		EMDBOP.updateCustomer(CM1);
		
		HttpSession sess = request.getSession();
		sess.setAttribute("Name", CM1.getCustomername());
		
		RequestDispatcher RD = request.getRequestDispatcher(profile);
		request.setAttribute("profile", EMDBOP.getUserById(email));
		RD.forward(request,response);
	}

}
