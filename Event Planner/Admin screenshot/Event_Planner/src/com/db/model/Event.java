package com.db.model;

public class Event {
	private int fid;
	private int cid;
	private String foodcategorie;
	private int price;
	
	public int getFid() {
        return fid;
    }
    public void setFid(int fid) {
        this.fid = fid;
    }
    
    public int getCid() {
    	return cid;
    }
    public void setCid(int cid) {
    	this.cid = cid;
    }
    
    public String getFoodcategorie() {
    	return foodcategorie;
    }
    public void setFoodcategorie(String foodcategorie) {
    	this.foodcategorie = foodcategorie;
    }
    
    public int getPrice() {
    	return price;
    }
    public void setPrice(int price) {
    	this.price = price;
    }
        
   @Override
    public String toString() {
        return "Event [fid=" + fid + ", cid=" + cid + ", foodcategorie=" + foodcategorie + ", price=" + price + "]";
    }
}
