<%@ page import="com.db.util.DBConnection" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection" %>
<html>
<head>
<%response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    int timeout = session.getMaxInactiveInterval();
    response.setHeader("Refresh", timeout + "; URL = index.jsp");
    
    if(session.getAttribute("Name") != null)
    {
    	response.sendRedirect(request.getContextPath() + "/index.jsp");
    	return;
    }
%>
<script type="text/javascript">
	
	function Semail()
	{
		var Semail = document.Sign_In.Semail.value;
		var letter1 = /^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)$/ ;
		if(Semail.match(letter1))
		{
			return true;
		}
		else
		{
			alert("Please Enter Valid Email Address...");
			return false;
		}
	}
	
	function Spass()
	{
		var Spass = document.Sign_In.Spass.value;
		if(Spass == "")
		{
			alert("Please Enter Valid Password...");
			return false;
		}
		else
		{
			return true;
		}
	}
	
	function S1()
	{
		if(!Semail() | !Spass())
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
			<%
			HttpSession sess = request.getSession(false);
					try
					{
						String s1 = "Signin";
						sess.setAttribute("S1", s1);
						
                    	int Themeid = Integer.parseInt(request.getParameter("Themeid"));
        				sess.setAttribute("Themeid", Themeid);
					}
					catch(Exception e)
					{
						
					}
            %>
	<jsp:include page="Header.jsp"/>
		<section id="Sign-In">
		<div class="container">
			<div class="row">
			<div class="col-lg-12 text-center">
				<h2>Sign-In</h2>
				<hr class="star-primary">
			</div>
			</div>
	
	<%
		try{
		String A1 = (String)sess.getAttribute("A1");
		if(A1.equals("Wrong"))
		{
			A1 = "";
			sess.setAttribute("A1", A1);
	%>
			<div class="col-lg-6 col-lg-offset-2">
				<div class="alert alert-danger fade in" >
		    	<a href="#" class="close" data-dismiss="alert">&times;</a>
		    	<strong>Error!</strong> ..... Enter Valid UserName Or Password .....
		   		 </div>
			</div>
	<%
		}
		}
		catch(Exception e)
		{
				
		}
	%>
	
		<div class="row">
                <div class="col-lg-6 col-lg-offset-2">
                    <form method="post" action="SignIn" name="Sign_In" novalidate>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Email Address</label>
                                <input type="email" class="form-control" name="Semail" placeholder="&nbsp;Email Address">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Password</label>
                                <input type="Password" class="form-control" name="Spass" placeholder="&nbsp;Enter Password">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
						<br>
						<div>
							<a href="Forgot_Password.jsp" class="b">Forgot Password</a> &nbsp; &nbsp; &nbsp; &nbsp;
							<a href="Sign-Up.jsp" class="b">Create A New Account</a> 
						</div>
						<br>
						<div id="success"></div>
							<div class="row">
								<div class="form-group col-xs-4">
									<button type="submit" name="Ssignin" class="btn btn-success btn-lg" onclick="return S1()">Sign-In</button>
							 </div>
							</div>
					</form>
						</div>
				</div>	
		</div>	
	</section>
	<jsp:include page="Footer.jsp"/>
</body>
</html>