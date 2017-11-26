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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link type="text/css" href="css/datepicker.css" rel="stylesheet" />
<link type="text/css" href="css/normalize.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
</head>

<body>
	<jsp:include page="AHeader.jsp"></jsp:include>
<div class="container">
<div class="row">
	<div class="col-lg-12 text-center">
		<h2>Update</h2>
		<hr class="star-primary">
	</div>
</div>
<div class="col-md-3 col-lg-3 " align="center"></div>
<div class=" col-md-9 col-lg-9 ">
 
     <form method="POST" action='UserController' name="frmAddUser">
     <table class="table table-user-information">
     <tbody>
     		 <tr>
                <td>User Id:</td>
                <td> <input type="text" readonly="readonly" name="userid" value="<c:out value="${user.customerid}" />" /> 
            </tr>
            <tr>
                <td>User Name:</td>
                <td> <input type="text" name="name" value="<c:out value="${user.customername}" />" /> 
            </tr>
            <tr>
              <td>Mobile No:</td>
              <td> <input type="text" name="mobileno" value="<c:out value="${user.mobileno}" />" />  
            </tr>
            <tr>
              <td>Email:</td>
              <td> <input type="text" name="email" value="<c:out value="${user.email}" />" />
            </tr>
            <tr>
              <td>City:</td>
              <td> <input type="text" name="cityname" value="<c:out value="${user.cityname}" />" />
           </tr>
	</tbody>
	</table>
		<div class="row">
	     <br><div class="form-group col-xs-4">
            <input type="submit" name="Submit" value="Update" class="btn btn-success btn-lg" >       
    	</div>
		</div>
	</form>			
</div>	
</div>
</body>
</html>