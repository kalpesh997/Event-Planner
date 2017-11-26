 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    	response.sendRedirect("ASign-in.jsp");
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
<body id="page-top">
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.sql.*"%>

<jsp:include page="AHeader.jsp"></jsp:include>
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
                    <th>User_Id</th>
					<th>Customer_Name</th>
					<td>PhoneNno.</td>
					<td>Email</td>
					<th>Password</th>
					<th>Date_Of_Reg.</th>
					<th>City</th>
					<th>Operation</th>
                    </tr>
			</thead>
            <tbody>
             <c:forEach items="${users}" var="user">
		           <tr>     
                    <td><c:out value="${user.customerid}" /></td>
                    <td><c:out value="${user.customername}" /></td>
                    <td><c:out value="${user.mobileno}" /></td>
                    <td><c:out value="${user.email}" /></td>
                    <td><c:out value="${user.password}" /></td>
                    <td><fmt:formatDate pattern="yyyy-MMM-dd" value="${user.date}" /></td>
                    <td><c:out value="${user.cityname}" /></td>
                    <td><a href="UserController?action=edit&userId=<c:out value="${user.customerid}"/>"> Update</a>
                  		<a href="UserController?action=delete&userId=<c:out value="${user.customerid}"/>" onclick="return ConfirmDemo()" > Delete</a></td>
                   </tr>
                </c:forEach>
             </tbody>
     </table>
     </div>
</body>
</html>