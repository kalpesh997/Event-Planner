<html>
<body>
	<jsp:include page="Header.jsp"/>
		<section id="Forgot_Password">
		<div class="container">
			<div class="row">
			<div class="col-lg-12 text-center"><br><br><br><br>
				<h1>Forgot Password ?</h1>
				<hr class="star-primary">
			</div>
			</div>
			
		    <div class="row">
		    <h4><b> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &clubs; &nbsp;
		   			Enter Your Email Address , We'll Send You A Link To Reset Your Password.</b></h4>
                <div class="col-lg-6 col-lg-offset-2"><br>
                    <form action="fpass" method="post" name="Fpassword"  novalidate>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                            <input type="email" name="email" class="form-control" placeholder="Email Address">
                            <p class="help-block text-danger"></p>
                            </div>
                        </div>
						<div id="success"></div>
                        <div class="row"><br>
								<div class="form-group col-xs-4">
                                   <input type="submit" name="Fpass" value="Cancel" class="btn btn-success btn-lg">
                                </div>
                                <div class="form-group col-xs-4">
								   <input type="submit" name="Fpass" value="Next" class="btn btn-success btn-lg">
								</div>
						</div>
						</form>
					</div>
					
				</div>	
		    </div>	
	</section>
	
</body>
</html>