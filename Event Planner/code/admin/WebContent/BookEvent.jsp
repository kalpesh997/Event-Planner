<%@ page import="com.db.util.DbUtil" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection" %>

<html>
<head>
<%	response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    int timeout = session.getMaxInactiveInterval();
    response.setHeader("Refresh", timeout + "; URL = Aindex.jsp");
    
    if(session.getAttribute("email") == null)
    {
    	response.sendRedirect("Sign-in.jsp");
    	return;
    }
%>
<script type="text/javascript">
	
	function ConfirmDemo()
	{
		var str = confirm("are you sure delete row?");
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
<jsp:include page="AHeader.jsp"></jsp:include>
<%
	Connection con = DbUtil.getConnection();
	Statement st = con.createStatement();
	ResultSet rs;
%>
<br><br>
<div class="row">
		<div class="col-lg-12 text-center">
			<h2>Users Details</h2>
			<hr class="star-primary">
		</div>
</div>
 <div class="col-lg-1">
 </div>
 <div class="col-lg-10">
     <table class="table table-striped">
              <thead>
                    <tr>
                    <th>Order ID</th>
					<th>Customer_Name</th>
					<td>Phone_No.</td>
					<td>Email</td>
                    <th>Date of Event</th>
					<th>Package</th>
					<th>Operation</th>
                    </tr>
              </thead>
              <tbody>
              <%
					String q = "select *from order_master";
					rs = st.executeQuery(q);
					while(rs.next())
					{
					int Order_Id = rs.getInt("Order_Id");
					String Eid = rs.getString("Event_Id");
					String DOE = rs.getString("Date_Of_Event");
					int cid = rs.getInt("Customer_Id");
					String Package = rs.getString("Package_type");	
			%>
                <tr>
				<td><%=Order_Id %></td>
				<%
					Connection con1 = DbUtil.getConnection();
					Statement st1 = con.createStatement();
					ResultSet rs1;
					String q1 = "select *from customer_master where Customer_Id="+cid;
					rs1 = st1.executeQuery(q1);
					while(rs1.next())
					{
						String Cname = rs1.getString(2);
						String Mobile = rs1.getString(3);
						String Email = rs1.getString(4);
				%>
                <td><%=Cname %></td>
                 <td><%=Mobile %></td>
              	<td><%=Email %></td>
                <%
					}
                %>
              	<td><%=DOE %></td>
              	<td><%=Package %></td>
              	<td>
              		<a href="BookInvoice.jsp?BookEvent=<%=Order_Id %>">View</a>&nbsp;&nbsp;
              		<a href="Delete.jsp?BookEvent=<%=Order_Id %>" onclick="return ConfirmDemo()">Delete</a>
              	</td>
               </tr>
           <%
              }
          %>
        </tbody>
   </table>
 </div>
</body>
</html>