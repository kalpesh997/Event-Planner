<%@ page import="com.db.util.DBConnection" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<html>
<head>
<%  
	response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    int timeout = session.getMaxInactiveInterval();
    response.setHeader("Refresh", timeout + "; URL = Error.jsp");
    
    if(session.getAttribute("Name") == null)
    {
    	response.sendRedirect(request.getContextPath() + "/Error.jsp");
    	return;
    }
%>
<script type="text/javascript">
	function ConfirmDemo()
	{
		var str = confirm("Are you sure To Cancel an Event So, You Have Fine The 30% Charges ?");
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
					<h2>History</h2>
					<hr class="star-primary">
				</div>
		
 <% 
try{
    Connection con = DBConnection.getConnection();
    Statement st;
    ResultSet rs;
    HttpSession sess = request.getSession(false);
    int Customerid = (Integer)sess.getAttribute("Customerid");
        
    String Q = "select *from order_master where Customer_Id="+Customerid+"";
    st = con.createStatement();
    rs = st.executeQuery(Q);
    
    while(rs.next())
    {
    	int Orderid = rs.getInt(1);
    	int Eventid = rs.getInt(2);
    	int Themeid = rs.getInt(3);
    	int Venueid = rs.getInt(4);
    	Date date1 = rs.getDate(6);
    	int personno = rs.getInt(7);
    	int Price = rs.getInt(8);
    	int Packageid = rs.getInt(9);
%> 


<div class="col-lg-12 text-center">
</div>
<form action="deleteevent" method="post">
		<div class="container">
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
				<div class="col-sm-8 portfolio-item">
					<ul><br>
						<h5>
						 <li>Date : <%=date1 %></li> <br>
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
							%>
							<%-- <li>Date :<%=date1 %></li> <br> --%>
							<%
							   	String Q2 = "select *from theme_master where Theme_Id="+Themeid+"";
							   	rs1 = st1.executeQuery(Q2);
							   	while(rs1.next())
							   	{
							   		String TName = rs1.getString("Theme_Name");
							   		int TPrice = rs1.getInt("Basic_Price");
							%>
								<li>Theme_Name : <%=TName %>  &nbsp;&nbsp;   &#8377; <%=TPrice %></li> <br>
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
							<li> Venue : <%=VenueName %> &nbsp;&nbsp;  &#8377; <%=VPrice %></li> <br>
							<li> Venue_Address :  <%=VAdd %> </li> <br>
							<%
							   	}
							%>
							<li>Person :<%=personno %> </li> <br>
						</h5>
					</ul>
				</div>
				<div class="col-sm-4 portfolio-item">
					<button type="submit" name="deleteEvent" value=<%=Orderid %> class="btn btn-success btn-lg" onclick="return ConfirmDemo()"><i class="fa fa-trash-o" ></i> Remove</button><br><br><br>
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
</div>
</form>
</section>
	<jsp:include page="Footer.jsp"/>
</body>
</html>