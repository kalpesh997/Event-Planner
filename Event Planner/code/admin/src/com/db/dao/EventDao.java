package com.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.db.model.Event;
import com.db.util.DbUtil;

public class EventDao {
	
	HttpServletRequest request;
	private Connection con;
	 public EventDao() {
	    	con = DbUtil.getConnection();
	 }
	 
	public void deleteEvent(int Food_Item_Id) {
	        try {
	            PreparedStatement preparedStatement = con
	                    .prepareStatement("delete from food_item where Food_Item_Id=?");
	           
	            preparedStatement.setInt(1,Food_Item_Id);
	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	}
	 
	public void updateEvent(Event event) {
	    	try {        	
	            PreparedStatement preparedStatement = con.prepareStatement("update food_item set Food_Item_Name=?, Price=? Where Food_Item_Id=? ");
	            
	            preparedStatement.setString(1, event.getFoodcategorie());    
	            preparedStatement.setInt(2, event.getPrice());
	            preparedStatement.setInt(3, event.getFid());
	            preparedStatement.executeUpdate();
	           
	        } catch (SQLException e) {
	        	e.printStackTrace();
	        }
	 }
	
	 public List<Event> getAllEvents(int cid) 
	 {
        List<Event> events = new ArrayList<Event>();
        try {
            PreparedStatement preparedStatement = con.prepareStatement("select * from food_item where Categorie_Id=?");
            preparedStatement.setInt(1, cid);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()) {
                Event event = new Event();
	       		event.setFid(rs.getInt("Food_Item_Id"));
	        	event.setCid(rs.getInt("Categorie_Id"));
	            event.setFoodcategorie(rs.getString("Food_Item_Name"));
	            event.setPrice(rs.getInt("Price"));
                events.add(event);
            }
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }

	        return events;
	    }
	 
	 public Event getEventById(int fid) 
	    {
	        Event event = new Event();
	        try {
	            PreparedStatement preparedStatement = con.prepareStatement("select *from food_item where Food_Item_Id=?");
	            preparedStatement.setInt(1, fid);
	            
	            ResultSet rs = preparedStatement.executeQuery();
	            
	            if (rs.next())
	            {
	            	event.setFid(rs.getInt("Food_Item_Id"));
	            	event.setCid(rs.getInt("Categorie_Id"));
	                event.setFoodcategorie(rs.getString("Food_Item_Name"));
	                event.setPrice(rs.getInt("Price"));
	            }
	        }
	        	catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
			return event;
			
	    }
	}