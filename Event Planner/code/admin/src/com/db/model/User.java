package com.db.model;

import java.util.Date;

public class User 
{
	private int customerid;
	private String customername;
	private long mobileno;
	private String email;
	private String password;
	private Date date;
	private String cityname;
	
	public int getCustomerid() {
        return customerid;
    }
    public void setCustomerid(int uid) {
        customerid = uid;
    }
    
    public String getCustomername(){
    	return customername;
    }
    public void setCustomername(String Customername){
    	customername = Customername;
    }
    
    public long getMobileno(){
    	return mobileno;
    }
    public void setMobileno(long string)
    {
    	mobileno = string;
    }
    
    public String getEmail(){
    	return email;
    }
    public void setEmail(String email)
    {
    	this.email = email;
    }
    
    public String getPassword(){
    	return password;
    }
    public void setPassword(String pass)
    {
    	password = pass;
    }
    
    public Date getDate() {
        return date;
    }
    public void setDate(Date dob) {
        this.date = dob;
    }
    
    public String getCityname(){
    	return cityname;
    }
    public void setCityname(String city)
    {
    	cityname = city;
    }
    
    @Override
    public String toString() {
        return "User [Customer_id=" + customerid + ", Customer_Name=" + customername
                + ", Mobile_No=" + mobileno + ", Email=" + email + ", Password="
                + password + " , date_of_reg="+ date +", City_Name="+ cityname +"]";
    }
}
