package com.db.model;

public class CustomerMaster
{
	private int customerid;
	private String customername;
	private long mobileno;
	private String email;
	private String password;
	private String 	cityname;
	
	public int getCustomerid()
	{
		return customerid;
	}
	public void setCustomerid(int cusrtomerid)
	{
		this.customerid = cusrtomerid;
	}
	
	public String getCustomername()
	{
		return customername;
	}
	public void setCustomername(String customername)
	{
		this.customername = customername;
	}
	
	public long getMobileno()
	{
		return mobileno;
	}
	public void setMobileno(long mobileno)
	{
		this.mobileno = mobileno;
	}
	
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	
	public String getCityname()
	{
		return cityname;
	}
	public void setCityname(String cityname)
	{
		this.cityname = cityname;
	}
}