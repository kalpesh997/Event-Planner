<html>
<head>
<script type="text/javascript">
	var A = "";
	function RName()
	{
		var str = document.Registration.RName.value;
		var letter= /^[A-Z a-z]+$/;
		
		if(str.match(letter))
		{
			return true;
		}
		else
		{
			A = "Enter Valid User_Name \n";
			return false;
		}
	}
	
	function RAddress()
	{
		var str1 = document.Registration.RAddress.value;
		var letter1 = /^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)$/ ;
		
		if(str1.match(letter1))
		{
			return true;
		}
		else
		{
			A += "Enter Valid Email_Address \n";
			return false;
		}
	}
	
	function RMoNo()
	{
		var str2 = document.Registration.RMoNo.value;
		var letter2 =  /^\d{10}$/;
		
		if(str2.match(letter2))
		{
			return true;
		}
		else
		{
			A +="Enter Valid Mobile_No \n";
			return false;
		}
	}
	var str3;
	function RPass()
	{
		str3 = document.Registration.RPass.value;
		if(str3.length < 8)
		{
			A +="Please Enter Your Password Which Length between 8 TO 20. \n";
			return false;
		}
		else
		{
			return true;
		}
	}
	
	function RCPass()
	{
		var str4 = document.Registration.RCPass.value;
		if(str4.match(str3))
		{
			return true;
		}
		else
		{
			A +="Your Password Doesn't Match... \n";
			return false;
		}
	}
	
	function RCity()
	{
		var str5 = document.Registration.RCity.value;
		var letter3 = /^[A-Z a-z]+$/;
		if(str5.match(letter3))
		{
			return true;
		}
		else
		{
			A +="Please Enter Your City... \n";
			return false;
		}
	}
	
	function R1()
	{
		if(!RName() | !RAddress() | !RMoNo() | !RPass() | !RCPass() | !RCity())
		{
			alert(A);
			A = "";
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
	<jsp:include page="Header.jsp"/>
		<section id="Registration">
		<div class="container">
			<div class="row">
			<div class="col-lg-12 text-center">
				<h2>Registration</h2>
				<hr class="star-primary">
			</div>
			</div>
		<div class="row">
                <div class="col-lg-6 col-lg-offset-2">
                <form method="post" action="SignUp" name="Registration" novalidate>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Name</label>
                                <input type="text" class="form-control" placeholder="&nbsp;Name" name="RName">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Email Address</label>
                                <input type="Email" class="form-control" placeholder="&nbsp;Email Address" name="RAddress">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Mobile Number</label>
                                <input type="tel" class="form-control" placeholder="&nbsp;Mobile Number" name="RMoNo">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
						<div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Password</label>
                                <input type="Password" class="form-control" placeholder="&nbsp;Password" name="RPass" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
						<div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Confirm-Password</label>
                                <input type="Password" class="form-control" placeholder="&nbsp;Confirm-Password" name="RCPass">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
						<div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>city</label>
                                <p class="help-block text-danger"></p>
								<input type="text" name="RCity" placeholder="&nbsp;select city">
                            </div>
                        </div>
                        <div id="success"></div>
                        <div class="row">
                            <br><div class="form-group col-xs-4">
                                <input type="submit" name="RSubmit" value="Register" class="btn btn-success btn-lg" onclick="return R1()">
                                </div>
                                <div class="form-group col-xs-4">
								<input type="Reset" name="RSubmit" value="Reset" class="btn btn-success btn-lg"></a>
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