package com.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.db.model.CustomerMaster;
import com.db.util.DBConnection;

public class EventMasterDBOP
{
	private Connection conn1;
	
	public EventMasterDBOP()
	{
		conn1 = DBConnection.getConnection();
	}
	
	public void updateCustomer(CustomerMaster CM2)
	{
		try
		{
			PreparedStatement PS1 = conn1.prepareStatement("update customer_master set Customer_Name=?, Mobile_No=?, City_Name=? where Email=?");
			PS1.setString(1, CM2.getCustomername());
			PS1.setLong(2,CM2.getMobileno());
			PS1.setString(3, CM2.getCityname());
			PS1.setString(4, CM2.getEmail());
			PS1.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public CustomerMaster getUserById(String email)
	{
		CustomerMaster CM = new CustomerMaster();
		try
		{
			PreparedStatement ps = conn1.prepareStatement("Select Customer_Name, Mobile_No, Email, Password, City_Name from customer_master where Email=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				CM.setCustomername(rs.getString("Customer_Name"));
				CM.setMobileno(rs.getLong("Mobile_No"));
				CM.setEmail(rs.getString("Email"));
				CM.setPassword(rs.getString("Password"));
				CM.setCityname(rs.getString("City_Name"));
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return CM;
	}
	
	/*public List<CustomerMaster> getAllUser()
	{
		List<CustomerMaster> CM3 = new ArrayList<CustomerMaster>();
		try
		{
			Statement st = conn1.createStatement();
			String Query1 = "select *form CustomerMaster";
			ResultSet rs = st.executeQuery(Query1);
			
			while(rs.next())
			{
				CustomerMaster CM4 = new CustomerMaster();
				CM4.setCustomername(rs.getString("Customer_Name"));
				CM4.setMobileno(rs.getInt("Mobile_No"));
				CM4.setEmail(rs.getString("Email"));
				CM4.setCityname(rs.getString("City_Name"));
				CM3.add(CM4);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return CM3;
	}
	*/
}