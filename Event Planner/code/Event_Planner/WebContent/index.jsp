<%@ page import="com.db.util.DBConnection" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection" %>
<html>
<body>
	<jsp:include page="Header.jsp"/>
	<%
			Connection con = DBConnection.getConnection();
			Statement st;
			ResultSet rs,rs1;
			st = con.createStatement();
			try{
				String q = "select * from event_master";			
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
						String q1 = "select * from event_master";
						rs = st.executeQuery(q1);
						while(rs.next())
						{
							String photo1 = rs.getString("Photo");
							String Ename = rs.getString("Event_Name");
							int Eid = rs.getInt("Event_Id");
						
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
							<a href="Event.jsp?Eid=<%=Eid%>"><img src="<%=photo1%>" class="img"></a>
							<div class="carousel-caption">
								<h1><%=Ename %></h1>
							</div>
						</div>
					<% } 
					}
			catch(Exception e)
			{
				e.printStackTrace();
			}%>
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
<div id ="courses " class="section-padding">
      <div class="container">
	  	<div class="row">
        	<div class="col-lg-12 text-center">
	            <h2>List of Events</h2>
					<hr class="star-primary">
	        </div>
        </div>
        
		<%
			try{
			String Q = "select *from event_master";
			rs = st.executeQuery(Q);
		%>
			<div class="row">
		<%
			while(rs.next())
			{
				int Eid = rs.getInt("Event_Id");
				String Ename = rs.getString("Event_Name");
				String Photo = rs.getString("Photo");
				String Des = rs.getString("Description");
		%>
            <div class="col-lg-4 col-sm-6 text-center">
                 <a href="Event.jsp?Eid=<%=Eid%>"><img class="img-rounded  img-responsive img-center" src="<%=Photo%>" alt=""><%=Ename%></a>           
            </div>
        <%
			}
		%>
			 </div>
		<%
			}
			catch(Exception e)
			{
				e.printStackTrace();			
			}
		%>
   </div>
   <br><br><br><br>

<div id ="courses " class="section-padding">
      <div class="container">
	  	<div class="row">
        	<div class="col-lg-12 text-center">
	            <h2>View of Themes</h2>
					<hr class="star-primary">
	        </div>
        </div>
        <%
        try{
        	String Q2 = "select * from event_master";
        	rs = st.executeQuery(Q2);
        %>
        <div class="row">
        <%
        	while(rs.next())
        	{
        		String Photo = rs.getString("Theme_Photo");
        		String name = rs.getString ("Event_Name");
        		int Eid = rs.getInt("Event_Id");
        %>
        	<div class="col-lg-4 col-sm-6 text-center">
                 <img class="img-rounded img-responsive img-center" src="<%=Photo%>" alt=""><%=name%> Themes      
            </div>
        <%
        	}
        %>
        </div>
        <%
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        }
        %>
</div>
<br><br><br><br>

<!-- Map -->
<div id="contact" class="map">
	<div class="row text-center">
		<h2>Our Services</h2>
		<hr class="star-primary">
       	<iframe width="1200" height="450" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=place_id:ChIJSdRbuoqEXjkRFmVPYRHdzk8&key=AIzaSyCs760CzjCmqp-QQng8T5Xg22BeDJOdrT8" allowfullscreen></iframe>
	       	<br/>
	       	<small>
	           <a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Ahmedabad,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=22.9962,72.5996&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Maninagar.,+Ahmedabad,+India&amp;t=m&amp;z=15&amp;iwloc=A"></a>
	       	</small>
       </iframe>
    </div>
</div>
<br><br><br>

<div>
</div>
</div>
</div>
</div>
	<jsp:include page="Footer.jsp"/>
</body>
</html>