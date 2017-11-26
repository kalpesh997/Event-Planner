<%@page import="javax.swing.text.StyledEditorKit.BoldAction"%>
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
    response.setHeader("Refresh", timeout + "; URL = Error.jsp");
    
%>
</head>
<body>
	<jsp:include page="Header.jsp" />
	<%			
			HttpSession sess = request.getSession(false);
					
			int Eventid = Integer.parseInt(request.getParameter("Eid"));
			sess.setAttribute("Eventid", Eventid);
			
			Connection con = DBConnection.getConnection();
			Statement st;
			ResultSet rs,rs1;
			st = con.createStatement();
			
			try{
				String q = "select * from slider_master where Event_Id='"+Eventid+"'";			
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
						String q1 = "select * from slider_master where Event_Id='"+Eventid+"'";
						rs = st.executeQuery(q1);
						while(rs.next())
						{
							String photo1 = rs.getString("photo");							
							
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
							<img src="<%=photo1%>" class="img">
							<div class="carousel-caption">
								<h1></h1>
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

	<section id="courses " class="section-padding">

		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>Select Themes</h2>
					<hr class="star-primary">
				</div>
			</div>
					<%
					try{
						String q = "select *from theme_master where Event_Id='"+Eventid+"'";
						rs = st.executeQuery(q);		
					%>
					<div class="row">
					<%
						while(rs.next())
						{
							String Tname = rs.getString("Theme_Name");
							int Themeid = rs.getInt("Theme_Id");
							String Tdes = rs.getString("Description");
							int Tprice = rs.getInt("Basic_Price");
							String Photo = rs.getString("Photo");
					%>
					<div class="col-lg-4 col-sm-6">
					<%
						String email = (String)sess.getAttribute("Email");
						String signin = "signin";
						sess.setAttribute("SignIn", signin);
						
						if(email==null)
						{
					%>
						<a href="Sign-In.jsp?Themeid=<%=Themeid%>">
						<figure class="imghvr-fold-up">
							<img class="img-rounded img-responsive img-center" src="<%=Photo%>" alt=""/>
							<figcaption>
								<h3><%=Tname%> :</h3>
								<p><%=Tdes%><br>&#8377;&nbsp;<%=Tprice%></p><br>
							</figcaption>
						</figure>&nbsp;
						</a>			
					<%
						}
						else if(email!=null)
						{
					%>	
						<a href="Venue.jsp?Themeid=<%=Themeid%>">
						<figure class="imghvr-fold-up">
							<img class="img-rounded img-responsive img-center" src="<%=Photo%>" alt=""/>
							<figcaption>
								<h3><%=Tname%> :</h3>
								<p><%=Tdes%><br>&#8377;&nbsp;<%=Tprice%></p><br>
							</figcaption>
						</figure>&nbsp;
						</a>					
					<%
						}
					%>
					</div>
					<% 
						} 
					%>
				</div>
				</div>
			<%
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			%>
		<br>
	</section>
	<br>
	<jsp:include page="Footer.jsp" />
</body>
</html>