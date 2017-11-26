<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.db.util.DbUtil" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection" %>
<html>
<body>
<%
	Connection con = DbUtil.getConnection();
	Statement st = con.createStatement();

	int BookEvent = Integer.parseInt(request.getParameter("BookEvent"));
	
	String q = "delete from order_master where Order_Id ="+BookEvent+"";
	st.executeUpdate(q);
	response.sendRedirect("BookEvent.jsp");
%>

</body>
</html>