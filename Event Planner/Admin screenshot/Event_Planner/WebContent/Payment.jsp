<html>
<body>
	<jsp:include page="Header.jsp"/>
	<br><br><br><br><br><br><br><br><br><br>
	<div class="container">
	<div class="row">
                <div class="col-lg-12 text-center">
                   <h2>Payment</h2>
                    <hr class="star-primary">
                </div>
            </div>
    <div class='row'>
        <div class='col-md-4'></div>
        <div class='col-md-4'>
          <script src='https://js.stripe.com/v2/' type='text/javascript'></script>
          <form>
            <div class='form-row'>
              <div class='col-xs-12 form-group required'>
                <label class='control-label'>Select Card</label>
                <br><input type='radio' name="radio">&nbsp;Credit card&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type='radio'name="radio">&nbsp;Debit card <br>
              </div>
            </div>
            
            <div class='form-row'>
              <div class='col-xs-12 form-group card required'>
                	<label class='control-label'>Card Number</label>
                	<input autocomplete='off' class='form-control card-number' size='20' type='text'>
              </div>
            </div>
            
			<div class='form-row'>
              <div class='col-xs-12 form-group card required'>
                	<label class='control-label'>CVC</label>
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	<input autocomplete='off' class='form-control card-number' size='20' type='text'>
              </div>
            </div>
                <div class='form-control total btn btn-info'>
                  <label>Total:
                  <span class='amount'>$300</span>
                  </label>
                </div>
			<br><br>
            <div class='form-row'>
              <div class='col-md-12 form-group'>
				<img class="img-responsive pull-right" src="http://i76.imgup.net/accepted_c22e0.png">
                <input type="submit" width="100px" value="Pay" class="btn btn-success btn-lg">
              </div>
            </div>
          </form>
        </div>
    </div>
</div>
	</body>
</html>