import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.db.util.DBConnection;
import java.sql.*;

public class Invoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("Button3");
		if(op.equals("Submit Payment"))
		{
		try {
			Connection con = DBConnection.getConnection();
			Statement st = con.createStatement();
			HttpSession sess = request.getSession();
			ResultSet rs; 
			
			String S = (String)sess.getAttribute("S");
	  		int Customerid = (Integer)sess.getAttribute("Customerid");
  			int Eventid = (Integer)sess.getAttribute("Eventid");
  			int Themeid = (Integer)sess.getAttribute("Themeid");
  			int Venueid = (Integer)sess.getAttribute("Venueid");
  			String email = (String)sess.getAttribute("Email");
  			int Pprice = (Integer)sess.getAttribute("Pprice");
  			
  			String Date2 = (String) sess.getAttribute("Date");
  			
  			String[] stn = new String[3];
  			String mm="",dd="",yy="";
  			try
  			{
  				stn = Date2.split("/");
  				mm = stn[0];
  	  			dd = stn[1];
  	  			yy = stn[2];
  			}
  			catch(Exception ex)
  			{
  				stn = Date2.split("-");
  				mm = stn[1];  	  			
  	  			dd = stn[2];
  	  			yy = stn[0];
  			}
  			
  			String Date1 = (yy+"/"+mm+"/"+dd);
  			String Invoice_Date = (String)sess.getAttribute("Invoice_Date");
  					
  			int PersonNo = (Integer)sess.getAttribute("PersonNo");
  			int Total_Price = (Integer)sess.getAttribute("Total_Price");
  			  			
	  		if(S.equals("Ready"))
	  		{
	  			int PackageId = (Integer)sess.getAttribute("PackageId");
	  			String q = "Insert Into order_master (Event_Id,Theme_Id,Venue_Id,Customer_Id,Date_Of_Event,No_Of_Person,General_Total,Package_Id,Package_type,Invoice_Date) values ("+Eventid+","+Themeid+","+Venueid+","+Customerid+",'"+Date1+"',"+PersonNo+","+Total_Price+","+PackageId+",'"+"R"+"','"+Invoice_Date+"')";
	  			st.executeUpdate(q);
	  			
	  		//...............Ready Invoice Mail..........
		  		
		  		String name="",Vname="",Tname="",Ename="";
		  		int Vprice=0,Tprice=0;
		  		
		  		String c = "select *from customer_master where Customer_Id="+Customerid;
		  		rs = st.executeQuery(c);
		  		while(rs.next())
		  		{	 name = rs.getString(2); }
		  		
		  		String v = "select *from venue_master where Venue_Id="+Venueid;
		  		rs = st.executeQuery(v);
		  		while(rs.next())
		  		{	 Vname = rs.getString(2); Vprice = rs.getInt(5); }
		  		
		  		String T = "select *from theme_master where Theme_Id="+Themeid;
		  		rs = st.executeQuery(T);
		  		while(rs.next())
		  		{	 Tname = rs.getString(3); Tprice = rs.getInt(5); }
		  		
		  		String E = "select *from event_master where Event_Id="+Eventid;
		  		rs = st.executeQuery(E);
		  		while(rs.next())
		  		{	 Ename = rs.getString(2); }
		  		
		  		String subject = " Event Planner Invoice ";
		  		String msg = "<html>\n" +
		        		"<head>" +
		        		"<style type='text/css'> .body1{background-color:rgb(234, 222, 234);} table{width: 50%; border-collapse:collapse; } tr, td { padding: 8px; text-align:center; border-bottom: 1px solid #ddd;} tr:nth-child(even) {background-color: #f2f2f2} </style>" +
		        		"</head>" +
	                    "<body class='body1'>\n<center><h1><b>Invoice</b></h1>" +
	                    "&nbsp;&nbsp;&nbsp;&nbsp;<b>Date : </b>\n" + Invoice_Date + "<br>" +
	                    "<b>Name : </b>"+
	                    name +" <br><br><br>" +
	                 
						"<b>Person No : </b>" + PersonNo +
						"<br><b>Package Price : </b>" +  Pprice +
						
						"<br><br><table>" +
	                    "<tr>\n" +
	                    "<td>\n" +
	                    "<b>Event_Name:</b>" +
	                    "</td>\n" +
	                    "<td>\n" +
	                    Ename +
	                    "</td>\n" +
	                    "</tr>\n" +
	                    
	                    "<tr>\n" +
	                    "<td>\n" +
	                    "<b>Venue : </b>" +
	                    "</td>\n" +
	                    "<td>\n" +
	                    Vname +
	                    "</td>\n" +
	                    "<td>\n" +
	                    "&#8377;"+ Vprice +  
	                    "</td>\n" +
	                    "</tr>\n" +
	                    
	                    "<tr>\n" +
	                    "<td>\n" +
	                    "<b>Theme_Name: </b>" +
	                    "</td>\n" +
	                    "<td>\n" +
	                    Tname +
	                    "</td>\n" +
	                    "<td>\n" +
	                    "&#8377;"+ Tprice + 
	                    "</td>\n" +
	                    "</tr>\n" +
	                    
						"<tr>\n" +
						"<td>\n" +
						"<b>Food Menu : </b>" +
						"</td>\n" +
						"<td>\n" +
						"Ready Package"+
						"</td>\n" +
						"<td>\n" +
						"&#8377;"+ Pprice*PersonNo + 
						"</td>\n" +
						"</tr>\n" + 
				       
				       "<tr>\n" +
				       "<td>\n" +
				       "" +
				       "</td>\n" +
				       "<td>\n" +
				       "" +
				       "</td>\n" +
				       "<td>\n" +
				       "<br><b>Total : </b>&#8377;" + Total_Price +
				       "</td>\n" +
				       "</tr>\n" +
	                    
	  					"</table>\n<b>" +
	                    "</center>" +
	                    "</body>\n" +
	                    "</html>" ; 
				
				RSendMail.send(email,subject,msg);
	  			
	  			response.sendRedirect("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=DSZLNZCHHF288");
	  		}
	  		else if(S.equals("RReady"))
	  		{
	  			int Addid = (Integer)sess.getAttribute("Addid");
	  			int PackageId = (Integer)sess.getAttribute("PackageId");
	  			String q = "Insert Into order_master (Event_Id,Theme_Id,Venue_Id,Customer_Id,Date_Of_Event,No_Of_Person,General_Total,Package_Id,Package_type,Invoice_Date) values ("+Eventid+","+Themeid+","+Venueid+","+Customerid+",'"+Date1+"',"+PersonNo+","+Total_Price+","+PackageId+",'"+"R"+"','"+Invoice_Date+"')";
	  			st.executeUpdate(q);
	  			
	  			String q3 = "delete from addtocart where Addtocart_Id="+Addid+"";
	  			st.executeUpdate(q3);
	  			
	  		//...............Rready Invoice Mail..........
		  		
		  		String name="",Vname="",Tname="",Ename="";
		  		int Vprice=0,Tprice=0;
		  		
		  		String c = "select *from customer_master where Customer_Id="+Customerid;
		  		rs = st.executeQuery(c);
		  		while(rs.next())
		  		{	 name = rs.getString(2); }
		  		
		  		String v = "select *from venue_master where Venue_Id="+Venueid;
		  		rs = st.executeQuery(v);
		  		while(rs.next())
		  		{	 Vname = rs.getString(2); Vprice = rs.getInt(5); }
		  		
		  		String T = "select *from theme_master where Theme_Id="+Themeid;
		  		rs = st.executeQuery(T);
		  		while(rs.next())
		  		{	 Tname = rs.getString(3); Tprice = rs.getInt(5); }
		  		
		  		String E = "select *from event_master where Event_Id="+Eventid;
		  		rs = st.executeQuery(E);
		  		while(rs.next())
		  		{	 Ename = rs.getString(2); }
		  		
		  		String subject = " Event Planner Invoice ";
		  		String msg = "<html>\n" +
		        		"<head>" +
		        		"<style type='text/css'> .body1{background-color:rgb(234, 222, 234);} table{width: 50%; border-collapse:collapse; } tr, td { padding: 8px; text-align:center; border-bottom: 1px solid #ddd;} tr:nth-child(even) {background-color: #f2f2f2} </style>" +
		        		"</head>" +
	                    "<body class='body1'>\n<center><h1><b>Invoice</b></h1>" +
	                    "&nbsp;&nbsp;&nbsp;&nbsp;<b>Date : </b>\n" + Invoice_Date + "<br>" +
	                    "<b>Name : </b>"+
	                    name +" <br><br><br>" +
	                 
						"<b>Person No : </b>" + PersonNo +
						"<br><b>Package Price : </b>" +  Pprice +
						
						"<br><br><table>" +
	                    "<tr>\n" +
	                    "<td>\n" +
	                    "<b>Event_Name:</b>" +
	                    "</td>\n" +
	                    "<td>\n" +
	                    Ename +
	                    "</td>\n" +
	                    "</tr>\n" +
	                    
	                    "<tr>\n" +
	                    "<td>\n" +
	                    "<b>Venue : </b>" +
	                    "</td>\n" +
	                    "<td>\n" +
	                    Vname +
	                    "</td>\n" +
	                    "<td>\n" +
	                    "&#8377;"+ Vprice +  
	                    "</td>\n" +
	                    "</tr>\n" +
	                    
	                    "<tr>\n" +
	                    "<td>\n" +
	                    "<b>Theme_Name: </b>" +
	                    "</td>\n" +
	                    "<td>\n" +
	                    Tname +
	                    "</td>\n" +
	                    "<td>\n" +
	                    "&#8377;"+ Tprice + 
	                    "</td>\n" +
	                    "</tr>\n" +
	                    
						"<tr>\n" +
						"<td>\n" +
						"<b>Food Menu : </b>" +
						"</td>\n" +
						"<td>\n" +
						"Ready Package"+
						"</td>\n" +
						"<td>\n" +
						"&#8377;"+ Pprice*PersonNo + 
						"</td>\n" +
						"</tr>\n" + 
				       
				       "<tr>\n" +
				       "<td>\n" +
				       "" +
				       "</td>\n" +
				       "<td>\n" +
				       "" +
				       "</td>\n" +
				       "<td>\n" +
				       "<br><b>Total : </b>&#8377;" + Total_Price +
				       "</td>\n" +
				       "</tr>\n" +
	                    
	  					"</table>\n<b>" +
	                    "</center>" +
	                    "</body>\n" +
	                    "</html>" ;   
				
				RSendMail.send(email,subject,msg);
	  			
	  			response.sendRedirect("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=DSZLNZCHHF288");
	  		}
	  		else
	  		{
	  			int Cprice = (Integer)sess.getAttribute("Cprice");
				int Soup = (Integer)sess.getAttribute("Soup");
				int Starter = (Integer)sess.getAttribute("Starter");
				int Roti = (Integer)sess.getAttribute("Roti");
				int Dal = (Integer)sess.getAttribute("Dal");
				int Sabji = (Integer)sess.getAttribute("Sabji");
				int Rice = (Integer)sess.getAttribute("Rice");
				int IceCream = (Integer)sess.getAttribute("IceCream");
				int Chinese = (Integer)sess.getAttribute("Chinese");
				int Cake = (Integer)sess.getAttribute("Cake");
				
				String q = "Insert Into order_master (Event_Id,Theme_Id,Venue_Id,Customer_Id,Date_Of_Event,No_Of_Person,General_Total,Package_Id,Package_type,Invoice_Date) values ("+Eventid+","+Themeid+","+Venueid+","+Customerid+",'"+Date1+"',"+PersonNo+","+Total_Price+","+0+",'"+"C"+"','"+Invoice_Date+"')";
	  			st.executeUpdate(q);
	  			
	  			int orderId = 0;
	  			String q1 = "select *from order_master";
	  			rs = st.executeQuery(q1);
	  			while(rs.next())
	  			{
	  					orderId = rs.getInt(1);	
	  			}				
				String q2 = "Insert Into customize_package (Order_Id,Soup_Id,Stater_Id,Roti_Id,Sabji_Id,Dal_Id,Rice_Id,Ice_Cream_Id,Chinese_Id,Cake_Id) values ("+orderId+","+Soup+","+Starter+","+Roti+","+Sabji+","+Dal+","+Rice+","+IceCream+","+Chinese+","+Cake+")";
				st.executeUpdate(q2);
				
				//...............Customize Invoice Mail..........
		  		
		  		String name="",Vname="",Tname="",Ename="";
		  		int Vprice=0,Tprice=0;
		  		
		  		String c = "select *from customer_master where Customer_Id="+Customerid;
		  		rs = st.executeQuery(c);
		  		while(rs.next())
		  		{	 name = rs.getString(2); }
		  		
		  		String v = "select *from venue_master where Venue_Id="+Venueid;
		  		rs = st.executeQuery(v);
		  		while(rs.next())
		  		{	 Vname = rs.getString(2); Vprice = rs.getInt(5); }
		  		
		  		String T = "select *from theme_master where Theme_Id="+Themeid;
		  		rs = st.executeQuery(T);
		  		while(rs.next())
		  		{	 Tname = rs.getString(3); Tprice = rs.getInt(5); }
		  		
		  		String E = "select *from event_master where Event_Id="+Eventid;
		  		rs = st.executeQuery(E);
		  		while(rs.next())
		  		{	 Ename = rs.getString(2); }
		  		
		  		String subject = " Event Planner Invoice ";
		  		String msg = "<html>\n" +
		        		"<head>" +
		        		"<style type='text/css'> .body1{background-color:rgb(234, 222, 234);} table{width: 50%; border-collapse:collapse; } tr, td { padding: 8px; text-align:center; border-bottom: 1px solid #ddd;} tr:nth-child(even) {background-color: #f2f2f2} </style>" +
		        		"</head>" +
	                    "<body class='body1'>\n<center><h1><b>Invoice</b></h1>" +
	                    "&nbsp;&nbsp;&nbsp;&nbsp;<b>Date : </b>\n" + Invoice_Date + "<br>" +
	                    "<b>Name : </b>"+
	                    name +" <br><br><br>" +
	                 
						"<b>Person No : </b>" + PersonNo +
						"<br><b>Food Price :</b>" + Cprice +
						
						"<br><br><table>" +
	                    "<tr>\n" +
	                    "<td>\n" +
	                    "<b>Event_Name:</b>" +
	                    "</td>\n" +
	                    "<td>\n" +
	                    Ename +
	                    "</td>\n" +
	                    "</tr>\n" +
	                    
	                    "<tr>\n" +
	                    "<td>\n" +
	                    "<b>Venue : </b>" +
	                    "</td>\n" +
	                    "<td>\n" +
	                    Vname +
	                    "</td>\n" +
	                    "<td>\n" +
	                    "&#8377;"+ Vprice +  
	                    "</td>\n" +
	                    "</tr>\n" +
	                    
	                    "<tr>\n" +
	                    "<td>\n" +
	                    "<b>Theme_Name: </b>" +
	                    "</td>\n" +
	                    "<td>\n" +
	                    Tname +
	                    "</td>\n" +
	                    "<td>\n" +
	                    "&#8377;"+ Tprice + 
	                    "</td>\n" +
	                    "</tr>\n" +
	                    
						"<tr>\n" +
						"<td>\n" +
						"<b>Food Menu : </b>" +
						"</td>\n" +
						"<td>\n" +
						"Customize Package"+
						"</td>\n" +
						"<td>\n" +
						"&#8377;"+ Pprice + 
						"</td>\n" +
						"</tr>\n" + 
				       
				       "<tr>\n" +
				       "<td>\n" +
				       "" +
				       "</td>\n" +
				       "<td>\n" +
				       "" +
				       "</td>\n" +
				       "<td>\n" +
				       "<br><b>Total : </b>&#8377;" + Total_Price +
				       "</td>\n" +
				       "</tr>\n" +
	                    
	  					"</table>\n<b>" +
	                    "</center>" +
	                    "</body>\n" +
	                    "</html>" ;    
				
				RSendMail.send(email,subject,msg);
				
				response.sendRedirect("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=DSZLNZCHHF288");
	  		}	  		
	  		
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		}
		else{
			response.sendRedirect("index.jsp");
		}
	}
}