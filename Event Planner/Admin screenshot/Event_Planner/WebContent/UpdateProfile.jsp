<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    	response.sendRedirect(request.getContextPath() + "/index.jsp");
    	return;
    }
%>
<script type="text/javascript">

	function Uname()
	{
		var str = document.UProfile.customername.value;
		var letter= /^[A-Z a-z]+$/;
		
		if(str.match(letter))
		{
			return true;		
		}
		else
		{
			alert("Enter Valid User_Name");
			return false;
		}
	}
	
	function Umobile()
	{
		var str1 = document.UProfile.mobileno.value;
		var letter1 = /^\d{10}$/;;
		
		if(str1.match(letter1))
		{
			return true;
		}
		else
		{
			alert("Enter Valid Mobile_No");
			return false;
		}
	}
	
	function Ucity()
	{
		var str2 = document.UProfile.city.value;
		var letter2 = /^[A-Z a-z]+$/;
		
		if(str2.match(letter2))
		{
			return true;		
		}
		else
		{
			alert("Enter Valid City_Name");
			return false;
		}
	}

	function U1()
	{
		if(!Uname() | !Umobile() | !Ucity())
		{
			return false;
		}
		else
		{
			return true;
		}
	}
	
</script>
</head>
<body>

<jsp:include page="Header.jsp"></jsp:include>
<div class="container">
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.sql.*"%>
<%
	HttpSession sess=request.getSession(false);
	String name = (String)sess.getAttribute("Name");
%>
<br><br><br><br><br><br><br>
       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >	            
            <div class="panel-body">
			<div class="row">
			<div class="col-lg-12 text-center">
	            <h2><span class="glyphicon glyphicon-user" aria-hidden="true"></span> <c:out value="${EditUser.customername}" /> Profile</h2>
					<hr class="star-primary">
	        </div>
                <div class=" col-md-10 col-lg-10 "> 
                  <form method="POST" action='EventMasterController' name="UProfile">
				    <table class="table table-user-information">
				    <tbody>
				    	<tr>
				    		<td> Customer Name : 
				    		<td><input type="text" class="form-control" name="customername" value="<c:out value="${EditUser.customername}" />" /> <tr /> 
				        <tr>
				        	<td> Mobile No :
				         	<td> <input type="text" class="form-control" name="mobileno" value="<c:out value="${EditUser.mobileno}" />" /> <tr /> 
				        <tr>
				        	<td> Email :
				        	<td> <input type="text" class="form-control" name="email" readonly="readonly" value="<c:out value="${EditUser.email}" />" /> <tr /> 
				        <tr>
				        	<td> City_Name : 
				        	<td> <input type="text" class="form-control" name="city" value="<c:out value="${EditUser.cityname}" />" /> <tr /> 
				        <tr>
				        	<td colspan=2> <Button type="submit" class="btn btn-success btn-lg" onclick="return U1()">Submit</Button>
				        </tr>
				    </tbody>
				    </table>
				   </form>
				  </div>
              </div>
            </div>
          </div>
        </div>
</body>
</html>