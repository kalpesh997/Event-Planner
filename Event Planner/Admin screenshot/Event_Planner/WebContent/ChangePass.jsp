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

var str;
function pass()
{
	str = document.changePass.Pass.value;
	if(str == "")
	{
		alert("Please Enter Your Password Which Length between 5 TO 10.");
		return false;
	}
	else
	{
		return true;
	}
}

function Rpass()
{
	var str1 = document.changePass.Repass.value;
	if(str1.match(str))
	{
		return true;
	}
	else
	{
		alert("Your Password Doesn't Match...");
		return false;
	}
}

function password()
{
	if(!pass() || !Rpass())
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
<jsp:include page="AHeader.jsp"></jsp:include>
<br><br>
		<div class="container">
			<div class="row">
			<div class="col-lg-12 text-center">
				<h2>Change Password</h2>
				<hr class="star-primary">
			</div>
			</div>
			
		<div class="row">
                <div class="col-lg-6 col-lg-offset-2">
                    <form name="changePass" action="change">
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Password</label>
                                 <input type="Password" name="Pass" class="form-control" placeholder="Password" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Repeat Password</label>
                                <input type="Password" name="Repass" class="form-control" placeholder="Repeat Password" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
						<br>
						<div class="row">
							<div class="form-group col-xs-5">
							<input type="submit" class="btn btn-success btn-lg" value="Submit" name="btn" onclick="return password()" >&nbsp;&nbsp;&nbsp;
							<input type="Reset" class="btn btn-success btn-lg" value="Reset" name="btn" >
							</div>
						</div>
					</form>
				</div>
				</div>	
		</div>	
</body>
</html>