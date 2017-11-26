<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 
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
<jsp:include page="AHeader.jsp" />
<div class="row">
<br><br>
<div class="row">
		<div class="col-lg-12 text-center">
			<h2>Edit Food Item</h2>
			<hr class="star-primary">
		</div>
		</div>
 <div class="col-lg-3">
 </div>
 <div class="col-lg-7">
 <div class="table-responsive">
    
              <table class="table table-striped">
              <thead>
                    <tr>
                    <th>F_id</th>
					<th>Categories</th>
					<th>Price</th>
			       	<th>Operation</th>
                    </tr>
              </thead>
              <tbody>
              <c:forEach items="${events}" var="events">
                   <tr>
                   <td><c:out value="${events.fid}" /></td>
                   <td><c:out value="${events.foodcategorie}" /><!-- <input type="text" class="form-control" value="<c:out value="${events.foodcategorie}" />"> --></td>
                   <td><c:out value="${events.price}" /><!-- <input type="text" class="form-control" value="<c:out value="${events.price}" />"> --></td>
                    
                   <td><a href="EventController?action=edit&EventId=<c:out value="${events.fid}"/>"> Update &nbsp; </a>
                   	   <a href="EventController?action=delete&Eventid=<c:out value="${events.fid}"/>" onclick="return ConfirmDemo()"> Delete </a></td> 
                  </tr>
              </c:forEach>
              </tbody>
              </table>
              
              
             
 </div>
 </div>
 </div>
</body>
</html>