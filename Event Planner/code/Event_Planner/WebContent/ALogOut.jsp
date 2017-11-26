<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<body>
<%
	HttpSession sess = request.getSession();
	sess.invalidate();
	response.sendRedirect("ASign-in.jsp");
%>
</body>
</html>