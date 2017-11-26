<%@ page import="com.db.util.DBConnection" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<html>
<head>
<%  
	response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    int timeout = session.getMaxInactiveInterval();
    response.setHeader("Refresh", timeout + "; URL = Error.jsp");
    
    if(session.getAttribute("Name") == null)
    {
    	response.sendRedirect(request.getContextPath() + "/Error.jsp");
    	return;
    }
%>
<script type="text/javascript">
$('.btn').on('click', function() {
    var $this = $(this);
  $this.button('loading');
    setTimeout(function() {
       $this.button('reset');
   }, 8000);
});
</script>
</head>
<body>
	<jsp:include page="Header.jsp"/>

		<section class="content content_content" style="width: 70%; margin: auto;">
		<form action="Invoice" method="post">
			<div class="row">
			    <div class="col-lg-12 text-center">
			       <h2>Invoice</h2>
			       <hr class="star-primary">
			    </div>
		    </div>
		    <!-- title row -->
		    <div class="row">
		    	<div class="col-xs-12">
		        	<h2 class="page-header">
		            <%
		            	HttpSession sess = request.getSession(false);
		                DateFormat df = new SimpleDateFormat("yyyy/MM/dd"); 
		    		   	Date d = new Date();
		    		    String d1 = (df.format(d)); 
		    		    sess.setAttribute("Invoice_Date", d1);
		            %>
                	<small class="pull-right">Date : <%=d1 %></small><br>
                	</h2>
            	</div>
            	<!-- /.col -->
    		</div>
                        <!-- info row -->
  <%  		
  int Customerid=1,Eventid=1,Themeid=1,Venueid=1,PersonNo=1;
  String Date = "";
  		try{
	  		Customerid = (Integer)sess.getAttribute("Customerid");
			Eventid = (Integer)sess.getAttribute("Eventid");
			Themeid = (Integer)sess.getAttribute("Themeid");
			Venueid = (Integer)sess.getAttribute("Venueid");
			PersonNo = (Integer)sess.getAttribute("PersonNo");
			Date = (String)sess.getAttribute("Date");
  		}
  		catch(Exception e)
  		{
  			e.printStackTrace();
  		}
		
		Connection conn = DBConnection.getConnection();
		Statement st = conn.createStatement();
		ResultSet rs1,rs2,rs3,rs4,rs5,rs6;
		String S="" ;
		try{
			S = (String)sess.getAttribute("S");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	  		
		//Ready 
  		if(S.equals("Ready"))
  		{
  			try
  			{
  				int PackageId =Integer.parseInt(request.getParameter("PackageId")); 	
  				sess.setAttribute("PackageId",PackageId);
  		
		  		int TotalPrice = Integer.parseInt(request.getParameter("Total_Price"));
		  		sess.setAttribute("Total_Price",TotalPrice);
		  %>
    		<div class="row invoice-info">
    	<%
    		rs1 = st.executeQuery("select *from customer_master where Customer_Id='"+Customerid+"'");
			while(rs1.next())
			{
			String Customer_Name = rs1.getString("Customer_Name");
			String City_Name = rs1.getString("City_Name");
			String Email = rs1.getString("Email");
			long Mobile_No = rs1.getLong("Mobile_No");
    	%> 			
            <div class="col-sm-4 invoice-col">
                To
                <address>
                <strong>
                <%=Customer_Name%> </strong><br>
                City : <%=City_Name %><br>
                Mobile No : <%=Mobile_No %><br>
                Email : <%=Email %></address>
            </div><!-- /.col -->
			<% } %>
			
			<div class="col-sm-5 invoice-col">
                
                <b>Venue Name : </b>
                 <%
                	rs6 = st.executeQuery("select *from venue_master where Venue_Id='"+Venueid+"'");
                	while(rs6.next())
                	{
                		String VenueName = rs6.getString("Venue_Name");
                		String Address = rs6.getString("Address");
                		long MobileNo = rs6.getLong("Mobile_No");
                %><b><%=VenueName %></b><br>
                  <b>Address : </b><b><%=Address %></b><br>
                  <b>Mobile No : </b><b><%=MobileNo %></b>
                <%
                	}
                %><br>
            </div><!-- /.col -->
			
            <div class="col-sm-3 invoice-col">
                <b>Invoice: <%=PackageId %></b><br>
                <br>
                <b>Event Name : </b>
                 <%
                	rs2 = st.executeQuery("select *from event_master where Event_Id='"+Eventid+"'");
                	while(rs2.next())
                	{
                		String EventName = rs2.getString("Event_Name");
                %><b><%=EventName %></b>
                <%
                	}
                %><br>
                <b>Event Date : </b> <%=Date %><br>
                <b>NO Of Person : </b> <%=PersonNo %>
            </div><!-- /.col -->
            
	</div><!-- /.row -->

    <!-- Table row -->
        <div class="row">
            <div class="col-xs-12 table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                    <th>NO.</th>
					<th>Product_Name</th>
                    <th>Sub Total</th>
                    </tr>                   
		                <tr>
                        <td>1</td>
                   <%
                   			rs3 = st.executeQuery("select *from theme_master where Theme_Id='"+Themeid+"'");
                   			while(rs3.next())
                   			{
                   				String Thmeme_Name = rs3.getString("Theme_Name");
                   				int Basic_Price = rs3.getInt("Basic_Price");
                   %>
                        <td><%=Thmeme_Name %></td>
                        <td><%=Basic_Price %></td>
                    <%
                    		}
                    %>
                        </tr>
                        <tr>
                        <td>2</td>
                     <%
     	                rs4 = st.executeQuery("select *from venue_master where Venue_Id='"+Venueid+"'");
            			while(rs4.next())
            			{
            				String Venue_Name = rs4.getString("Venue_Name");
            				int Basic_Price = rs4.getInt("Basic_Price");
                     %>   	
                     	<td><%=Venue_Name %></td>
                        <td><%=Basic_Price %></td>
                     <%
            			}
					 %> 
                        </tr>
                        <tr>
                        <td>3</td>
                     <%
	     	                rs5 = st.executeQuery("select *from ready_package where Ready_Package_Id='"+PackageId+"'");
	            			while(rs5.next())
	            			{
	            				int Basic_Price = rs5.getInt("Price");
	            				sess.setAttribute("Pprice",Basic_Price);
	                 %>   	
	                     	<td>Food Menus</td>
	       			 <% 
	       			 int Price = Basic_Price*PersonNo; %>
	                        <td><%=Price%></td>
	                 <%
		            	}    	
					 %> 
                        </tr>
                    </tbody>
                </table>
            </div><!-- /.col -->
        </div><!-- /.row -->

        <div class="row">
            <!-- accepted payments column -->
            <div class="col-md-8">
	            </div>
	            <div class="col-md-4">
					<div class="table-responsive">
                        <table class="table">
							<tbody>
                            <tr>
                            <th></th>
                            <td><strong>Total : &#8377; <%=TotalPrice %></strong> </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
            </div><!-- /.col -->
        </div><!-- /.row -->
        
        <!-- this row will not appear when printing -->
        <div class="row ">
        <div class="col-md-10">
	     </div>
            <div class="form-group col-xs-2">
           
         		<input type="submit" name="Button3" class="btn btn-success" value="Submit Payment"> <br><br>
         		<input type="submit" name="Button3" class="btn btn-success" value="Cancel">	
        	</div>
		</div>
		<%
		}
  		catch(Exception e)
  		{
  			e.printStackTrace();
  		}
  		}
		
		//RReady
  		else if(S.equals("RReady"))
  		{
  			try
  			{
  				int PackageId = (Integer)sess.getAttribute("PackageId"); 	
  				sess.setAttribute("PackageId",PackageId);
  		
		  		int TotalPrice = (Integer)sess.getAttribute("Total_Price");
		  		sess.setAttribute("Total_Price",TotalPrice);
		  %>
    		<div class="row invoice-info">
    	<%
    		rs1 = st.executeQuery("select *from customer_master where Customer_Id='"+Customerid+"'");
			while(rs1.next())
			{
			String Customer_Name = rs1.getString("Customer_Name");
			String City_Name = rs1.getString("City_Name");
			String Email = rs1.getString("Email");
			long Mobile_No = rs1.getLong("Mobile_No");
    	%> 			
            <div class="col-sm-4 invoice-col">
                To
                <address>
                <strong>
                <%=Customer_Name%> </strong><br>
                City : <%=City_Name %><br>
                Mobile No : <%=Mobile_No %><br>
                Email : <%=Email %></address>
            </div><!-- /.col -->
			<% } %>
			
			<div class="col-sm-5 invoice-col">
                
                <b>Venue Name : </b>
                 <%
                	rs6 = st.executeQuery("select *from venue_master where Venue_Id='"+Venueid+"'");
                	while(rs6.next())
                	{
                		String VenueName = rs6.getString("Venue_Name");
                		String Address = rs6.getString("Address");
                		long MobileNo = rs6.getLong("Mobile_No");
                %><b><%=VenueName %></b><br>
                  <b>Address : </b><b><%=Address %></b><br>
                  <b>Mobile No : </b><b><%=MobileNo %></b>
                <%
                	}
                %><br>
            </div><!-- /.col -->
			
            <div class="col-sm-3 invoice-col">
                <b>Invoice: <%=PackageId %></b><br>
                <br>
                <b>Event Name : </b>
                 <%
                	rs2 = st.executeQuery("select *from event_master where Event_Id='"+Eventid+"'");
                	while(rs2.next())
                	{
                		String EventName = rs2.getString("Event_Name");
                %><b><%=EventName %></b>
                <%
                	}
                %><br>
                <b>Event Date : </b> <%=Date %><br>
                <b>NO Of Person : </b> <%=PersonNo %>
            </div><!-- /.col -->
            
	</div><!-- /.row -->

    <!-- Table row -->
        <div class="row">
            <div class="col-xs-12 table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                    <th>NO.</th>
					<th>Product_Name</th>
                    <th>Sub Total</th>
                    </tr>                   
		                <tr>
                        <td>1</td>
                   <%
                   			rs3 = st.executeQuery("select *from theme_master where Theme_Id='"+Themeid+"'");
                   			while(rs3.next())
                   			{
                   				String Thmeme_Name = rs3.getString("Theme_Name");
                   				int Basic_Price = rs3.getInt("Basic_Price");
                   %>
                        <td><%=Thmeme_Name %></td>
                        <td><%=Basic_Price %></td>
                    <%
                    		}
                    %>
                        </tr>
                        <tr>
                        <td>2</td>
                     <%
     	                rs4 = st.executeQuery("select *from venue_master where Venue_Id='"+Venueid+"'");
            			while(rs4.next())
            			{
            				String Venue_Name = rs4.getString("Venue_Name");
            				int Basic_Price = rs4.getInt("Basic_Price");
                     %>   	
                     	<td><%=Venue_Name %></td>
                        <td><%=Basic_Price %></td>
                     <%
            			}
					 %> 
                        </tr>
                        <tr>
                        <td>3</td>
                     <%
	     	                rs5 = st.executeQuery("select *from ready_package where Ready_Package_Id='"+PackageId+"'");
	            			while(rs5.next())
	            			{
	            				int Basic_Price = rs5.getInt("Price");
	            				sess.setAttribute("Mprice",Basic_Price);	
	                 %>   	
	                     	<td>Food Menus</td>
	       			 <% 
	       			 int Price = Basic_Price*PersonNo; %>
	       			 
	                        <td><%=Price%></td>
	                 <%
		            	}    	
					 %> 
                        </tr>
                    </tbody>
                </table>
            </div><!-- /.col -->
        </div><!-- /.row -->

        <div class="row">
            <!-- accepted payments column -->
            <div class="col-md-8">
	            </div>
	            <div class="col-md-4">
					<div class="table-responsive">
                        <table class="table">
							<tbody>
                            <tr>
                            <th></th>
                            <td><strong>Total : &#8377; <%=TotalPrice %></strong> </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
            </div><!-- /.col -->
        </div><!-- /.row -->
        
        <!-- this row will not appear when printing -->
         <div class="row ">
        <div class="col-md-10">
	     </div>
            <div class="form-group col-xs-2">
         		<input type="submit" name="Button3" class="btn btn-success" value="Submit Payment"> <br><br>
         		<input type="submit" name="Button3" class="btn btn-success" value="Cancel">	
        	</div>
		</div>
		<%
		}
  		catch(Exception e)
  		{
  			e.printStackTrace();
  		}
  		}
		
		//Customize 
		else
		{
			
			try
			{
				/* 
			int Food_Basic_Price = (Integer)sess.getAttribute("Food_Basic_Price"); 
			 */
	  	%>
	  		<div class="row invoice-info">
	    	<%
	    		rs1 = st.executeQuery("select *from customer_master where Customer_Id='"+Customerid+"'");
				while(rs1.next())
				{
				String Customer_Name = rs1.getString("Customer_Name");
				String City_Name = rs1.getString("City_Name");
				String Email = rs1.getString("Email");
				long Mobile_No = rs1.getLong("Mobile_No");
	    	%> 			
	            <div class="col-sm-4 invoice-col">
	                To
	                <address>
	                <strong>
	                <%=Customer_Name%> </strong><br>
	                City : <%=City_Name %><br>
	                Mobile No : <%=Mobile_No %><br>
	                Email : <%=Email %></address>
	            </div><!-- /.col -->
				<% } %>
				
				<div class="col-sm-5 invoice-col">
	                
	                <b>Venue Name : </b>
	                 <%
	                	rs6 = st.executeQuery("select *from venue_master where Venue_Id='"+Venueid+"'");
	                	while(rs6.next())
	                	{
	                		String VenueName = rs6.getString("Venue_Name");
	                		String Address = rs6.getString("Address");
	                		long MobileNo = rs6.getLong("Mobile_No");
	                %><b><%=VenueName %></b><br>
	                  <b>Address : </b><b><%=Address %></b><br>
	                  <b>Mobile No : </b><b><%=MobileNo %></b>
	                <%
	                	}
	                %><br>
	            </div><!-- /.col -->
				
	            <div class="col-sm-3 invoice-col">
	                <%-- <b>Invoice: <%=PackageId %></b><br> --%>
	                <br>
	                <b>Event Name : </b>
	                 <%
	                	rs2 = st.executeQuery("select *from event_master where Event_Id='"+Eventid+"'");
	                	while(rs2.next())
	                	{
	                		String EventName = rs2.getString("Event_Name");
	                %><b><%=EventName %></b>
	                <%
	                	}
	                %><br>
	                <b>Event Date : </b> <%=Date %><br>
	                <b>NO Of Person : </b> <%=PersonNo %>
	            </div><!-- /.col -->
	            
		</div><!-- /.row -->

	    <!-- Table row -->
	        <div class="row">
	            <div class="col-xs-12 table-responsive">
	                <table class="table table-striped">
	                    <thead>
	                    <tr>
	                    <th>NO.</th>
						<th>Product_Name</th>
	                    <th>Sub Total</th>
	                    </tr>                   
			                <tr>
	                        <td>1</td>
	                   <%
	                   			rs3 = st.executeQuery("select *from theme_master where Theme_Id='"+Themeid+"'");
	                   			int TBasic_Price = 0;
	                   			while(rs3.next())
	                   			{
	                   				String Thmeme_Name = rs3.getString("Theme_Name");
	                   				TBasic_Price = rs3.getInt("Basic_Price");
	                   %>
	                        <td><%=Thmeme_Name %></td>
	                        <td><%=TBasic_Price %></td>
	                    <%
	                    		}
	                    %>
	                        </tr>
	                        <tr>
	                        <td>2</td>
	                     <%
	     	                rs4 = st.executeQuery("select *from venue_master where Venue_Id='"+Venueid+"'");
	                     	int VBasic_Price = 0;
	            			while(rs4.next())
	            			{
	            				String Venue_Name = rs4.getString("Venue_Name");
	            				VBasic_Price = rs4.getInt("Basic_Price");
	                     %>   	
	                     	<td><%=Venue_Name %></td>
	                        <td><%=VBasic_Price %></td>
	                     <%
	            			}
						 %> 
	                        </tr>
	                        <tr>
	                        <td>3</td>
		                     	<td>Food Menus</td>
		       			 	<% 
			       			    int Cprice = (Integer)sess.getAttribute("Cprice");
		       			 		int Price = Cprice*PersonNo;
		       			 		sess.setAttribute("Cprice",Cprice);
		       			 		sess.setAttribute("Pprice",Price);
		       			 	%>
		                        <td><%=Price%></td> 
	                        </tr>
	                    </tbody>
	                </table>
	            </div><!-- /.col -->
	        </div><!-- /.row -->

	        <div class="row">
	            <!-- accepted payments column -->
	            <div class="col-md-8">
	            </div>
	            <div class="col-md-4">
						<div class="table-responsive">
	                        <table class="table">
								<tbody>
	                            <tr>
	                            <th></th>
	                            <% int TotalPrice = (TBasic_Price)+(VBasic_Price)+(Price); 
	                            	sess.setAttribute("Total_Price",TotalPrice);
	                            %>
	                            <td><strong>Total : &#8377; <%=TotalPrice %></strong> </td>
	                            </tr>
	                            </tbody>
	                        </table>
	                    </div>
	            </div><!-- /.col -->
	        </div><!-- /.row -->
	        
	        <!-- this row will not appear when printing -->
        <div class="row ">
        <div class="col-md-10">
	     </div>
            <div class="form-group col-xs-2">
            
           
			
         		<input type="submit" name="Button3" class="btn btn-success" value="Submit Payment"> <br><br>
         		<input type="submit" name="Button3" class="btn btn-success" value="Cancel">	
        	</div>
		</div>		
	        <%
			}
			catch(Exception e)
			{
				e.printStackTrace();	
			}
			          }
			%>
		</form>        
</section>

</body>
</html>