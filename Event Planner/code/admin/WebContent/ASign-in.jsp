<html>
<head>
<script type="text/javascript">

var str;
function pass()
{
	str = document.sentMessage.pass.value;
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

function password()
{
	if(!pass() )
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
				<h2>Sign-In</h2>
				<hr class="star-primary">
			</div>
			</div>
			
		<div class="row">
                <div class="col-lg-6 col-lg-offset-2">
                    <form name="sentMessage" action="hello">
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Email Address</label>
                                <input type="email" name="email" class="form-control" placeholder="   Email Address" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Password</label>
                                <input type="Password" name="pass" class="form-control" placeholder="Password" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
						<br>
						<div id="success"></div>
							<div class="row">
								<div class="form-group col-xs-6">
									<button type="submit" class="btn btn-success btn-lg" onclick="return password()">Sign-In</button><br>
							 </div>
							</div>
					</form>
				</div>
			</div>
</div>
</body>
</html>