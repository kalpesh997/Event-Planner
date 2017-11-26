package com.db.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.db.model.User;
import com.db.util.DbUtil;

public class UserDao 
{ 		
	private Connection connection;
	
    public UserDao() {
    	connection = DbUtil.getConnection();
    }
    
    public void deleteUser(int Custromer_id) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from customer_master where Customer_id=?");
            // Parameters start with 1
            preparedStatement.setInt(1,Custromer_id);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public String updateUser(User user) {
    	String str1="";
    	try {
        	str1 = "update customer_master set Customer_Name=?, Mobile_No=?, Email=?, City_Name=? Where Customer_id=?";
        	
            PreparedStatement preparedStatement = connection.prepareStatement(str1);
            // Parameters start with 1
            preparedStatement.setString(1, user.getCustomername());
            preparedStatement.setLong(2, user.getMobileno());    
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getCityname());
            preparedStatement.setInt(5, user.getCustomerid());
            preparedStatement.executeUpdate();

           
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return str1;
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<User>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from Customer_master");
            
            while (rs.next()) {
                User user = new User();
                user.setCustomerid(rs.getInt("Customer_id"));
                user.setCustomername(rs.getString("Customer_Name"));
                user.setMobileno(rs.getLong("Mobile_No"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setDate(rs.getDate("Date_of_Registration"));
                user.setCityname(rs.getString("City_Name"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }
    
    public User getUserById(int Customer_id) 
    {
        User user = new User();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select * from customer_master where Customer_id=?");
            preparedStatement.setInt(1, Customer_id);
            
            ResultSet rs = preparedStatement.executeQuery();
            
            if (rs.next())
            {
                user.setCustomerid(rs.getInt("Customer_id"));
                user.setCustomername(rs.getString("Customer_Name"));
                user.setMobileno(rs.getLong("Mobile_No"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setDate(rs.getDate("Date_Of_Registration"));
                user.setCityname(rs.getString("City_Name"));
            }
        }
        	catch (SQLException e) {
            e.printStackTrace();
        }
		return user;
    }
}