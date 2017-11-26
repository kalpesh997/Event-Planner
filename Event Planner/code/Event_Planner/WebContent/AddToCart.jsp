<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.db.util.DBConnection" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%	response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    int timeout = session.getMaxInactiveInterval();
    response.setHeader("Refresh", timeout + "; URL = index.jsp");
    
    if(session.getAttribute("Name") == null)
    {
    	response.sendRedirect(request.getContextPath() + "/Error.jsp");
    	return;
    }
%>
<script type="text/javascript">
	function ConfirmDemo()
	{
		var str = confirm("Are you sure Delete This Item From Add-To-Cart ?");
		if(str==true)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
</script>
</head>
<body>
<jsp:include page="Header.jsp"/>
<section id="portfolio">
<div class="col-lg-12 text-center">
					<h2>Add To Cart</h2>
					<hr class="star-primary">
				</div>
 <% 
try{
    Connection con = DBConnection.getConnection();
    Statement st;
    ResultSet rs;
    HttpSession sess = request.getSession(false);
    int Customerid = (Integer)sess.getAttribute("Customerid");
    
    int Eventid=0,Themeid=0,Venueid=0,personno=0,Price=0,Addid=0,Packageid=0;
    Date date1;
    
    String Q = "select *from addtocart where Customer_Id="+Customerid+"";
    st = con.createStatement();
    rs = st.executeQuery(Q);
    
    while(rs.next())
    {
    	Addid = rs.getInt(1);
    	Eventid = rs.getInt(3);
    	Themeid = rs.getInt(4);
    	Venueid = rs.getInt(5);
    	date1 = rs.getDate(6);
    	personno = rs.getInt(7);
    	Price = rs.getInt(8);
    	Packageid = rs.getInt(10);
   
    	String S1 = "Book"+"_"+Addid+"_"+Eventid+"_"+Themeid+"_"+Venueid+"_"+date1+"_"+personno+"_"+Price+"_"+Packageid;
    	String S2 = "Remove"+"_"+Addid;
%>    

<form action="addtocart" method="post">
		<div class="container">
			<div class="row">
				
			</div>
			
			<div class="row">
				<div class="col-sm-4 portfolio-item">
					<%
					ResultSet rs1;
				   	Statement st1 = con.createStatement();
				   	String Q6 = "select *from venue_master where Venue_Id="+Venueid+"";
				   	rs1 = st1.executeQuery(Q6);
				   	while(rs1.next())
				   	{
				   		String VenuePhoto = rs1.getString("Photo");
				   	
						
					%>
						 <img src="<%=VenuePhoto %>" class="img-rounded img-responsive img-center" alt="">
					<%
				   	}
					%>
						<div class="carousel-caption">
							<h1></h1>
						</div>
				</div>
				<div class="col-sm-4 portfolio-item">
					<ul><br>
						<h5>
						<li>Event Date : <%=date1%></li> <br>
							<%						   	
					  			
							   	String Q1 = "select *from event_master where Event_Id="+Eventid+"";
							   	rs1 = st1.executeQuery(Q1);
							   	while(rs1.next())
							   	{
							   		String EName = rs1.getString("Event_Name");
							%>
								<li>Event_Name : <%=EName %></li> <br>
							<%
								}
							   	String Q2 = "select *from theme_master where Theme_Id="+Themeid+"";
							   	rs1 = st1.executeQuery(Q2);
							   	while(rs1.next())
							   	{
							   		String TName = rs1.getString("Theme_Name");
							   		int TPrice = rs1.getInt("Basic_Price");
							%>
								<li>Theme_Name : <%=TName %>&nbsp;&nbsp;   &#8377; <%=TPrice %></li> <br>
							<%
							   	}
							   	String Q3 = "select *from venue_master where Venue_Id="+Venueid+"";
							   	rs1 = st1.executeQuery(Q3);
							   	while(rs1.next())
							   	{
							   		String VenueName = rs1.getString("Venue_Name");
							   		int VPrice = rs1.getInt("Basic_Price");
							   		String VAdd = rs1.getString("Address"); 
							%>
							<li> Venue : <%=VenueName %>  &nbsp;&nbsp;  &#8377; <%=VPrice %></li> <br>
							<li> Venue_Address :  <%=VAdd %> </li> <br>
							<%
							   	}
							%>
							<li>Person : <%=personno %></li> <br>
						</h5>
					</ul>
				</div>
				<div class="col-sm-4 portfolio-item"> 
					<h1>&#8377; <%=Price %></h1>
					<button type="submit" name="ReadyPackage" value=<%=S1 %> class="btn btn-success btn-lg">Book</button>
					<button type="submit" name="ReadyPackage" value=<%=S2 %> class="btn btn-success btn-lg" onclick="return ConfirmDemo()"><i class="fa fa-trash-o" ></i> Remove</button><br><br><br>
				</div>
<%
				}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</div>
</form>
</section>
 </body>
</html>