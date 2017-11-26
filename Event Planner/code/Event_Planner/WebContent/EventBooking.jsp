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
    if(session.getAttribute("Name")==null)
     {   	 
  	  response.sendRedirect(request.getContextPath() + "/index.jsp");
  	  return;
	}
     %>
   
	<script type="text/javascript">

	function Edate()
	{
		var Edate = document.BookingEvent.BookingDate.value;
	
		if(Edate=="")
		{
			alert("Please Select Date Of Event....");
			return false;
		}
		else
		{
			return true;
		}
	}
	
	function Epersonno()
	{
		var Capacity = document.BookingEvent.Capacity.value;
		var Epersonno = document.BookingEvent.PersonNo.value;
		
		if ( parseInt(Epersonno) >=50 && parseInt(Epersonno) <= Capacity) 
		{
			return true;
		}
		else
		{
			alert("Please Enter Person Value Above 50 to "+Capacity);
			return false;
		}
	}
	
	function BookingDetails()
	{
		if(!Edate() | !Epersonno())
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
	<jsp:include page="Header.jsp" />
	<style>
h3 {
    text-align: center;
}

#calendar {
    margin-top: 40px;
}
    
.event a {
    background-color: #42B373 !important;
    background-image :none !important;
    color: #ffffff !important;
}
</style>
	 <script src="js/jquery-3.2.0.min.js"></script> 
 	<link rel="stylesheet" href="css/jquery-ui.css" />  	
  	<script src="js/jquery-ui-1.8.20.min.js"></script>
<script>
	jQuery.browser = {};
	(function () {
		jQuery.browser.msie = false;
		jQuery.browser.version = 0;
		if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
		jQuery.browser.msie = true;
		jQuery.browser.version = RegExp.$1;
	  }
	})();
$(function() {
    $( "#datepicker" ).datepicker();
});

$(document).ready(function() {
	 var eventDates = {};
	     $("#showTable").click(function(event){
	    	 //  alert("hii");
     		   var table1 = "";
	           $.get('fetchDates',function(responseJson) {
	        	   if(responseJson!=null){
		               $.each(responseJson, function(key,value) {
		                   var date1 = new Date(value);
		            	   eventDates[new Date(value)] =  new Date(value);		               		  
		               });
	                }
	            });
           		//	for (i = 0; i < eventDates.length; i++) { 
	    		//    	alert(eventDates[i]);
	    		//}          
	 		});      	     
	     
	     	//  An array of dates
	     	//  var eventDates = {};
	     	//  eventDates[ new Date( '04/04/2017' )] = new Date( '04/04/2017' );
	      	//  eventDates[ new Date( '04/06/2017' )] = new Date( '04/06/2017' );
	      	//  eventDates[ new Date( '04/20/2017' )] = new Date( '04/20/2017' );
	      	//  eventDates[ new Date( '04/25/2017' )] = new Date( '04/25/2017' );
	        
	        // datepicker
	        jQuery('#calendar').datepicker({
	        	minDate:0,
	        	maxDate:'+1Y',
	            beforeShowDay: function( date ) {
	                var highlight = eventDates[date];
	                if( highlight ) {
	                     return [false, "event", highlight];
	                } else {
	                     return [true, '', ''];
	                }
	             }
	        });
});
</script>
	<section id="Sign-In">
	<%
		HttpSession sess = request.getSession(false);
		int Venueid = Integer.parseInt(request.getParameter("Venueid"));
		sess.setAttribute("Venueid",Venueid);
	%>
<div id="tablediv">
	<p id="datedata"></p>
</div>

	<form method="post" action="EventBooking" name="BookingEvent" novalidate>
		<div class="container">
		<br>
			<div class="row">
				<div class="col-lg-12 text-center">
				
			<%	
			int Eventid = 101;
				try
				{
					Eventid = (Integer)sess.getAttribute("Eventid");
				}
				catch(Exception ex)
				{					
				}
				 Connection con = DBConnection.getConnection();
				 Statement st = con.createStatement();
				 ResultSet rs;
					try{
					 
					 String q = "select Event_Name from event_master where Event_Id='"+Eventid+"'";
					 rs  = st.executeQuery(q);
					while(rs.next())
					{
						String name = rs.getString("Event_Name");
				%>
					<h2><%=name %>&nbsp;Event</h2>
					<hr class="star-primary">
				<%
					}
					}
						catch(Exception e)
						{
							e.printStackTrace();
						}
				%>
				</div>
			</div>
			<div class="row">			
				<div class="col-lg-6 col-lg-offset-2">
				<input type="button" value="Click here to check Booked dates in calender" id="showTable" class="btn btn-success btn-lg"/>
						<div class="row control-group">
							<div class="form-group col-xs-12 floating-label-form-group controls">
															 
								<input type="text" id="calendar" name="BookingDate" placeholder="select date">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>No Of Person</label>&nbsp;&nbsp;&nbsp; 
									<input type="number" class="form-control" name="PersonNo" placeholder="NO OF Person"
									required
									data-validation-required-message="Please enter your email address.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<%
							String Q2 = "select *from venue_master where Venue_Id="+Venueid+"";
							rs = st.executeQuery(Q2);
							while(rs.next())
							{
								int Capacity = rs.getInt("Capacity");
						%>
						<input type="hidden" name="Capacity" value=<%=Capacity %>>
						<%
							}
						%>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Package</label> 
									<input type="radio" name="Package1"	value="Ready" checked> Ready &nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="radio" name="Package1" value="Customize"> Customize<br>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<br> <br>
						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-4">
								<input type="submit" name="ENext" value="Cancel" class="btn btn-success btn-lg">
							</div>
							<div class="form-group col-xs-4">
								<input type="submit" name="ENext" value="Next" class="btn btn-success btn-lg" onclick="return BookingDetails()">
							</div>
						</div>
					
				</div>
			</div>
		</div>
</form>
	</section>
	<jsp:include page="Footer.jsp" />
</body>
</html>