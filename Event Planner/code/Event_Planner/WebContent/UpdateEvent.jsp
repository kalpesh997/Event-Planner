<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="AHeader.jsp"/>
<div class="container">
	<div class="row"><br><br><br>
		<div class="col-lg-12 text-center">
			<h2>Update</h2>
			<hr class="star-primary">
		</div>
	</div>
 </div>
 <div class="col-md-3" align="center"></div>
<div class=" col-md-6 ">
<form method="POST" action='EventController'>
              	<table class="table table-striped">
	                <tbody>
		         		<tr>
		         			<td>Food_Item_Id:</td>
		                   <td><input type="text" name="fid" readonly="readonly" class="form-control" value="<c:out value="${event.fid}" />"/></td>
		                </tr>
		                <tr>
		                	<td>Categorie_Id:</td>
		                   <td><input type="text" name="fcid" readonly="readonly" class="form-control" value="<c:out value="${event.cid}" />"/></td>
		                </tr>
		                <tr>	
		                	<td>Food_Item_Categorie:</td>	                   
		                   <td><input type="text" name="fcate" class="form-control" value="<c:out value="${event.foodcategorie}" />"/></td>
		                </tr>
		                <tr>
		                	<td>Price:</td>
		                   <td><input type="text" name="fprice" class="form-control" value="<c:out value="${event.price}" />"/> </td>
		                </tr>
	                </tbody>
             	</table>
             	<div class="row">
	     			<br>
	     			<div class="form-group col-xs-4">
	    				<input type="submit" value="Submit" class="btn btn-success btn-lg" />   
    				</div>
				</div>
</form>
</div>
</body>
</html>