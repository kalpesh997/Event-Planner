<%@ page import="com.db.util.DBConnection" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection" %>
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
		var str = confirm("Are U Sure This Product As An Add To Cart ?");
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
	<jsp:include page="Header.jsp" />
	
	<%
 	    	
    	int Customerid=1,Eventid=1,Themeid=1,Venueid=1,personno=1;
	HttpSession sess = request.getSession(false);
    	String date="";
    	try{
		
		
			Customerid = (Integer)sess.getAttribute("Customerid");
			Eventid = (Integer)sess.getAttribute("Eventid");
			Themeid = (Integer)sess.getAttribute("Themeid");
			Venueid = (Integer)sess.getAttribute("Venueid");
			personno =  (Integer)sess.getAttribute("PersonNo");
			date = (String)sess.getAttribute("Date");
			
    	}
    	catch(Exception e)	
    	{
    		e.printStackTrace();
    	}
		String S = "Ready";
		sess.setAttribute("S", S);
		Connection conn = DBConnection.getConnection();
		Statement st = conn.createStatement();
		ResultSet rs1,rs2,rs3,rs4,rs5;		
	%>
<br>
<section id="portfolio">
<!-- <form action="Radd"> -->
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>Ready-Made Package</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				
					<div class="col-lg-4 text-center">
						<%
							rs1 = st.executeQuery("select *from customer_master where Customer_Id='"+Customerid+"'");
							while(rs1.next())
							{
								String Customer_Name = rs1.getString("Customer_Name");
						%>
						<tr>
							<td>
								<h3><%=Customer_Name%> Selected Details :</h3>
							</td>
						</tr>
						<%
							}
						%>
						<table>
						<hr class="primary"/>
						<ul>
						<h5>
						<%
							rs2 = st.executeQuery("select *from event_master where Event_Id='"+Eventid+"'");
							while(rs2.next())
							{
								String Event_Name = rs2.getString("Event_Name");
						%>
						<tr>
							<td>
								<li>Event : &nbsp;&nbsp;<%=Event_Name%></li> <br>
							</td>
						</tr>
						<%
							}
							int Theme_Price=0;
							rs3 = st.executeQuery("select *from theme_master where Theme_Id='"+Themeid+"'");
							while(rs3.next())
							{
								String Theme_Name = rs3.getString("Theme_Name");
								Theme_Price = rs3.getInt("Basic_Price");
						%>
						<tr>
							<td>
								<li>Theme : &nbsp;&nbsp;<%=Theme_Name%>  &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp; &#8377;<%=Theme_Price%></li> <br>
							</td>
						</tr>
						<%
							}
							
							rs4 = st.executeQuery("select *from venue_master where Venue_Id='"+Venueid+"'");
							int Venue_Price=0;
							while(rs4.next())
							{
								String Venue_Name = rs4.getString("Venue_Name");
								Venue_Price = rs4.getInt("Basic_Price");
						%>
						<tr>
							<td>
								<li>Venue : &nbsp;&nbsp;<%=Venue_Name%>  &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp; &#8377;<%=Venue_Price%></li> <br>
							</td>
						</tr>
						<%
							}
						%>
						<tr>
							<td>
								<li>Date : &nbsp;&nbsp;<%=date %> </li> <br>
							</td>
						</tr>
						<tr>
							<td>
								<li>Person_No : &nbsp;&nbsp; <%=personno %> </li> <br>
							</td>
						</tr>
						</h5>
					</ul>
					</table>
					</div>
						
						<div class="col-lg-4 col-sm-6">
							<div class="caption"></div>
							<%
								rs5 = st.executeQuery("select *from ready_package where Event_Id='"+Eventid+"'");
								int Total_Price=0;
								while(rs5.next())
								{
									int Readyid = rs5.getInt("Ready_Package_Id");
									String Menu = rs5.getString("Menu_Detail");
									int Menu_Price = rs5.getInt("Price");
									sess.setAttribute("PerPrice", Menu_Price);
									String Photo = rs5.getString("Photo");
							%>
							<img src="<%=Photo %>" class="img-rounded img-responsive img-center" alt="">
							<br>
							<ul>
								<h5>
									<li>Menu_Details : <%=Menu %></li> <br>
									<li>Package_Price : &#8377;<%=Menu_Price%></li> <br>
								</h5>
							</ul>
					<%
						Total_Price = (Theme_Price)+(Venue_Price)+(personno*Menu_Price);
						sess.setAttribute("Total_Price", Total_Price);
						String data1 = Readyid + "_" + Total_Price;
					%>
					<h4>Basic_Price : &#8377; <%=Total_Price %>/-</h4>
					<a href="Invoice.jsp?PackageId=<%=Readyid%>&Total_Price=<%=Total_Price%>"><button type="submit" class="btn btn-success btn-lg">Book</button></a>
					<br><br>
					<form action="Radd">
						<button name="Pa" value=<%=data1%> class="btn btn-success btn-lg" onclick="return ConfirmDemo()">Add To Cart</button>
					</form>
				</div>
				<%
					}
				%>
			</div>
			<hr>
		</div>
		<!-- </form> -->
</section>
	<jsp:include page="Footer.jsp" />
</body>
</html>