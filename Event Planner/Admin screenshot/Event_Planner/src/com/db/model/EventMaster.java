package com.db.model;

public class EventMaster
{
	private int eventid;
	private String eventname;
	private String description;
	private int price;
	
	public int getEventid()
	{
		return eventid;
	}
	public void setEventid(int eventid)
	{
		this.eventid = eventid;
	}
	
	public String getEventname()
	{
		return eventname;
	}
	public void setEventname(String eventname)
	{
		this.eventname = eventname;
	}
	
	public String getDescription()
	{
		return description;
	}
	public void setDescription(String description)
	{
		this.description = description;
	}
	
	public int getPrice()
	{
		return price;
	}
	public void setPrice(int price)
	{
		this.price = price;
	}
	
	public String toString()
	{
		return "EventMaster [eventid="+ eventid +", eventname="+ eventname +", description="+ description +", price="+ price +"]";
	}
}