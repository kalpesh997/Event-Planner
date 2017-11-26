<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    	response.sendRedirect(request.getContextPath() + "/Error.jsp");
    	return;
    }
%>
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
	String email = (String)sess.getAttribute("Name");
%>
<br><br><br>
       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >            
            <div class="panel-body">
			<div class="row">
			<div class="col-lg-12 text-center">
	            <h2><span class="glyphicon glyphicon-user" aria-hidden="true"></span> <c:out value="${profile.customername}" /> Profile</h2>
					<hr class="star-primary">
	        </div>
                <div class=" col-md-10 col-lg-10 "> 
                  <table class="table table-user-information">
                    <tbody>                    
                      <tr>
                        <td>User Name:</td>
                        <td><c:out value="${profile.customername}" /></td>
                      </tr>
                      <tr>
                        <td>Mobile No:</td>
                        <td><c:out value="${profile.mobileno}" /></td>
                      </tr>
                      <tr>
                        <td>Email:</td>
                        <td><c:out value="${profile.email}" /></td>
                      </tr>
                      <tr>
                        <td>City:</td>
                        <td><c:out value="${profile.cityname}" /></td>
                      </tr>                    
                    </tbody>
                  </table>
				  </div>
				  <div id="success"></div>
				<div class="row">
					<div class="form-group col-xs-4"> 
							<a href="EventMasterController?action=edit&email=<c:out value="${email}"/>"><button type="submit" class="btn btn-success btn-lg">Update</button></a>
					</div>
				</div>
              </div>
            </div>
          </div>
        </div>
 </body>
</html>