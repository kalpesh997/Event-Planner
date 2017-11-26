<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.db.util.DBConnection" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection" %>
<html>
<body>
<%
	/* HttpSession sess = request.getSession(false); */
	Connection con;
	con = DBConnection.getConnection();
	Statement st = con.createStatement();
	ResultSet rs;
try{
	 rs = st.executeQuery("select *from event_master");
 %>
	<footer class="text-center">
		<div class="footer-above">
			<div class="container">
				<div class="row">
					<div class="footer-col col-md-4">
						<h3>Event</h3>
						<hr class="primary">
						<%
							while(rs.next())
							{
								String Ename = rs.getString(2);
								int Eid = rs.getInt(1);
						%>
						 <p>
						 	<a href="Event.jsp?Eid=<%=Eid %>"><%=Ename %></a>
						 </p>
						 <%
							}
						}
						catch(Exception e)
						{
							e.printStackTrace();
						}
						 	
						%>
					</div>
					<div class="footer-col col-md-4">
						<h3>Around the Web</h3>
							<hr class="primary">
							<ul class="list-inline">
								<li>
									<h1><a href="https://www.facebook.com/Event-Management-233100310453326/?skip_nax_wizard=true"><i class="fa fa-fw fa-facebook"></i></a></h1>&nbsp;&nbsp;
								</li>
								<li>
									<h1><a href="http://plus.google.com/apps/activities"><i class="fa fa-fw fa-google-plus"></i></a></h1>&nbsp;&nbsp;
								</li>
								<li>
									<h1><a href="http://in.linkedin.com/uas/login"><i class="fa fa-fw fa-linkedin"></i></a></h1>&nbsp;&nbsp;
								</li>
							</ul>
					</div>
					<div class="footer-col col-md-4">
						<h3>About Site</h3>
						<hr class="primary">
						<p>
							<a href="index.jsp">Event Planner</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>