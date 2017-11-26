package com.db.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.dao.UserDao;
import com.db.model.User;

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;	 
    private static String INSERT_OR_EDIT = "/update.jsp";
    private static String LIST_USER = "/user.jsp";
    private UserDao dao;
	
    public UserController() {
        super();
        dao = new UserDao();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward="";
        String action = request.getParameter("action");
        PrintWriter out = response.getWriter();
                
        if (action.equalsIgnoreCase("delete"))
        {
            int userId = Integer.parseInt(request.getParameter("userId"));
            dao.deleteUser(userId);
            forward = LIST_USER;
            request.setAttribute("users", dao.getAllUsers());    
        }
        else if (action.equalsIgnoreCase("edit"))
        {
            forward = INSERT_OR_EDIT;
            int userId = Integer.parseInt(request.getParameter("userId"));
            User user = dao.getUserById(userId);
            request.setAttribute("user", user);
        }
        else if (action.equalsIgnoreCase("listUser"))
        {
            forward = LIST_USER;
            out.println("2");
            request.setAttribute("users", dao.getAllUsers());
        } 
        else
        {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		PrintWriter pw = response.getWriter();
		String mobile = request.getParameter("mobileno");
		
        user.setCustomername(request.getParameter("name"));
        user.setMobileno(Long.parseLong(mobile));
        user.setEmail(request.getParameter("email"));
        user.setCityname(request.getParameter("cityname"));
              
        String userid = request.getParameter("userid");
        user.setCustomerid(Integer.parseInt(userid));
        pw.print(user);
        String str1="";
        str1 = dao.updateUser(user);
        
        pw.print(str1);
        RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
        request.setAttribute("users", dao.getAllUsers());
        view.forward(request, response);
	} 	
}