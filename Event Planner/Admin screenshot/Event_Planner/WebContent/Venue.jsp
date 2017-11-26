<%@ page import="com.db.util.DBConnection" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection" %>
<html>
<head>
<%response.setHeader("Cache-Control", "no-cache");
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
</head>
<body>
	<jsp:include page="Header.jsp"/>
	<%	
		
	HttpSession sess = request.getSession(false);
	
	String	S1 = (String)sess.getAttribute("S1");

	if(S1.equals("Signin"))
	{
		int Themeid = (Integer)sess.getAttribute("Themeid");
	}
	else if(S1.equals(""))
	{
		int Themeid = Integer.parseInt(request.getParameter("Themeid"));
		sess.setAttribute("Themeid",Themeid);
	}
	try{
		 
			Connection con = DBConnection.getConnection();
			Statement st;
			ResultSet rs,rs1;
			st = con.createStatement();
			
			String q = "select *from venue_master";			
			rs1 = st.executeQuery(q);
			
	%>
	 <div class="container">
		<br><br><br><br>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
			<%			
						int count1=1;
						int i=0;
						
						while(rs1.next())
						{
							if(count1==1)
							{
								%>
									<li data-target="#myCarousel" data-slide-to="<%=i%>" class="active"></li>
								<%	
								count1=0;
							}
							else
							{
								%>
									<li data-target="#myCarousel" data-slide-to="<%=i%>"></li>
								<%	
								
							}							
							i++;
						%>		
							
					<% } 
			%>		
				
			</ol>
			*
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
			<%			
						int count=1;
						String q1 = "select * from venue_master";
						rs = st.executeQuery(q1);
						while(rs.next())
						{
							int Venueid = rs.getInt(1);
							String photo1 = rs.getString("Photo");
							String Vname = rs.getString("Venue_Name");
						
							if(count==1)
							{
								%>
									<div class="item active" class="img">
								<%	
								count=0;
							}
							else
							{
								%>
									<div class="item" >
								<%	
								
							}
							
						%>		
							<a href="EventBooking.jsp?Venueid=<%=Venueid%>"><img src="<%=photo1%>" class="img"></a>
							<div class="carousel-caption">
								<h1><%=Vname %></h1>
							</div>
						</div>
					<% } 
		%>
			</div>
			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
</div>
	<br><br><br>
<!--From The blog-->
<%
		String Query2 = "select *from venue_master";
		rs = st.executeQuery(Query2);
		
		while(rs.next())
		{
			int Venueid = rs.getInt("Venue_Id");
			String Venue_Name = rs.getString("Venue_Name");
			String Add = rs.getString("Address");
			String Email = rs.getString("Email");
			int Area = rs.getInt("Area");
			int Capacity = rs.getInt("Capacity");
			sess.setAttribute("Capacity", Capacity);
			int Price = rs.getInt("Basic_Price");
			long Mobile_No = rs.getLong("Mobile_No");
			String Photo = rs.getString("Photo");
%>
			<br>
			<div class="row">
						<div class="col-lg-12 text-center">
							<h2><%=Venue_Name%> Party Plot</h2>
							<hr class="star-primary">
					</div>
				</div>
				<br>

				<article class="blog-content screen-large home-blog-unit">
					<div class="item-top-line home-page-blog"></div>
						<ul class="blog-list-option">
							<li id="post-813" class="blog-li-option post-813 post type-post status-publish format-standard has-post-thumbnail hentry category-ceremony category-couple category-family category-food category-restaurant tag-bride tag-couple tag-date tag-groom tag-wedding">									
								<div class="post_header">
									<div class="thumb-post-list-470">
										<a class="blog-thumb"  title=<%=Venue_Name %>>
											<img width="470" height="225" src="<%=Photo%>" class="attachment-thumb-470 size-thumb-470 wp-post-image"> 
										</a>
									</div>
									<div class="header-post-list-470">
										<div class="post-title">
											<h3>Description :-</h3>
										</div>
									</div>
									<div class="excerpt-post-li-option-470">
									<tr>
										<td><b>Address :</b></td>
										<td> <%=Add %></td>
									</tr>
									<br>
									<tr>
										<td><b>Email_Address :</b></td>
										<td><%=Email %></td>
									</tr>
									<br>
									<tr>
										<td><b>Capacity : </b></td>
										<td><%=Capacity %></td>
									</tr>
									<br>
									<tr>
										<td><b>Area : </b></td>
										<td><%=Area %> sq ft </td>
									</tr>
									<br> 
									<tr>
										<td><b>Mobile_No :</b></td>
										<td><%=Mobile_No %></td>
									</tr>
									<br>
									<tr>
										<td><b>Price :</b></td>
										<td><%=Price %></td>
									</tr>
									</div>
								</div>
							</li>
						</ul>
				</article>
				
					<a href="EventBooking.jsp?Venueid=<%=Venueid%>" >
						<div class="form-group col-lg-offset-8">
							<button type="submit" class="btn btn-success btn-lg">Next</button>
						</div>
					</a>
	<%
			}
	%>
		<br><br><br>
		<!-- Map -->
<div id="contact" class="map">
	<div class="row text-center">
		<h2>Our Services</h2>
		<hr class="star-primary">
       	<iframe width="1200" height="450" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=place_id:ChIJSdRbuoqEXjkRFmVPYRHdzk8&key=AIzaSyCs760CzjCmqp-QQng8T5Xg22BeDJOdrT8" allowfullscreen></iframe>
	       	<br/>
	       	<small>
	           <a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A"></a>
	       	</small>
       </iframe>
    </div>
</div>
<%}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	 %>
<br><br><br>
	<jsp:include page="Footer.jsp"/>
</body>
</html>