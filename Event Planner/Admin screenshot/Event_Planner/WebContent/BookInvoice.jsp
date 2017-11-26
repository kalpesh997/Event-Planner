<%@ page import="com.db.util.DBConnection" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection" %>

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
</head>
<body>
<body>
<jsp:include page="AHeader.jsp"></jsp:include>
<%
	Connection con = DBConnection.getConnection();
	Statement st = con.createStatement();
	ResultSet rs,rs1,rs2,rs3,rs4;
	
	int Eid=0,Vid=0,Tid=0,Cid=0,Pid=0,Person=0,Total=0;
	String DOE="",PType="",InvoiceDate="";
	int BookEvent = 0;
	
	try{			
		BookEvent = Integer.parseInt(request.getParameter("BookEvent"));
		
		String q = "select *from order_master where Order_Id ="+BookEvent;
		rs=st.executeQuery(q); 
		while(rs.next())
		  {
			Eid = rs.getInt("Event_Id");
			Tid = rs.getInt("Theme_Id");
			Vid = rs.getInt("Venue_Id");
			Cid = rs.getInt("Customer_Id");
			DOE = rs.getString("Date_Of_Event"); 
			Person = rs.getInt("No_Of_Person");
			Total = rs.getInt("General_Total");
			Pid = rs.getInt("Package_Id");
			PType = rs.getString("Package_type");
			InvoiceDate = rs.getString("Invoice_Date"); 
		  }
	
		}
	catch(Exception e)
		{
			e.printStackTrace();
		}
%>
<br><br>
<div class="row">
		<div class="col-lg-12 text-center">
			<h2>Book Invoice</h2>
			<hr class="star-primary">
		</div>
</div>
<section class="content content_content" style="width: 70%; margin: auto;">
    <div class="row invoice-info">
            <div class="col-sm-6 invoice-col">
                To
                <address>
                <%
                	String q1 = "select *from customer_master where Customer_Id="+Cid;
                	rs1 = st.executeQuery(q1);
                	while(rs1.next())
                	{
                		String Cname = rs1.getString("Customer_Name");
    					long MobilNo = rs1.getLong("Mobile_No");
    					String Email = rs1.getString("Email");
    					String CityName = rs1.getString("City_Name"); 
                %>
                <strong>
                <%=Cname %></strong> <br>
                Phone : <%=MobilNo %> <br>
                Email : <%=Email %> <br>
                City Name : <%=CityName %> <br>
				</address>
				<%
                	}
				%> 
            </div>
			 <div class="col-sm-4 invoice-col">
			 <Strong>Event:</Strong><br>
			 <%
				String q3 = "select *from event_master where Event_Id="+Eid;
         		rs1 = st.executeQuery(q3);
         		while(rs1.next())
         		{
         			String Ename = rs1.getString("Event_Name"); 
			 %>
			 Event Name : <%=Ename %><br>
			  <%
         		}
			 %>
			 Person :<%=Person %><br>
			 Event Date :<%=DOE %><br>
			 <%
			 	if(PType.equals("R"))
			 	{
			 %>
			 Package : Ready 
			 <% 
			 	}
			 	else
			 	{
			 %>
			 	Package : Customize
			 <%
			 	}	
			 %>
			 </div>
			 <div class="col-sm-2 invoice-col">
			 Date : <%=InvoiceDate %>
			 </div>
           </div><!-- /.col -->
	<%!
            			String getname(int n)
            			{
								String name1="";
							try{
								Connection con = DBConnection.getConnection();
								Statement st = con.createStatement();
								ResultSet rs1;
									
								
								String q = "select * from Food_Item where Food_Item_Id =" + n ;
							
								rs1=st.executeQuery(q); 
								while(rs1.next())
								  {
									name1 = rs1.getString("Food_Item_Name");
								  }		
								}
								catch(Exception ex){
									ex.printStackTrace();
								}
							          return name1;
            			}
            			%>
	<div class="row invoice-info">
           <div class="col-sm-6 invoice-col">
                <strong>Vanue:</strong>
                <%
                	try{
                	String q2 = "select *from venue_master where Venue_Id="+Vid;
                	rs1 = st.executeQuery(q2);
                	while(rs1.next())
                	{
                		String Vname = rs1.getString("Venue_Name");
    					long Mobile = rs1.getLong("Mobile_No");
    					String Address = rs1.getString("Address"); 
    					String Area = rs1.getString("Area"); 
    					String Capacity = rs1.getString("Capacity"); 
                %>
                <address>
                Vanue Name : <%=Vname %><br> 
				Mobile No : <%=Mobile %><br>
				Address : <%=Address %><br>
				Area : <%=Area %> sq ft<br>
				Capacity : <%=Capacity %> 
           		</address>
            </div>
           	<%
                	}
                }
                catch(Exception e)
                {
                	e.printStackTrace();
                }
           	%>         
      </div>
	<div class="row invoice-info">
            <div class="col-sm-6 invoice-col">
            	<strong>Food =</strong>
            	<%
            	int Soupid=0,Starterid=0,RotiId=0,SabjiId=0,DalId=0,RiceId=0,Ice_creamId=0,ChineseId=0,CakeId=0;
    			String Soupname="",Stater="",Roti="",Sabji="",Dal="",Rice="",Ice_cream="",Chinese="",Cake="";
            		if(PType.equals("R"))
            		{
            			/* String q5 = "select ready_package.Menu_Detail from order_master,ready_package where order_master.Package_Id=ready_package.Ready_Package_Id where order_master.Package_Id="+Pid; */
            			String q5 = "select ready_package.Menu_Detail from order_master INNER JOIN ready_package ON order_master.Package_Id=ready_package.Ready_Package_Id where order_master.Order_Id="+BookEvent;
            			rs2 = st.executeQuery(q5);
            			while(rs2.next())
            			{
            				String menu = rs2.getString("Menu_Detail");
            	%>
            		<%=menu %>
            	<%
            			}
            		}
            		else
            		{            			
            			String q6 = "select * from customize_package where Order_Id="+BookEvent;
            			rs3 = st.executeQuery(q6);            			
            			
             			while(rs3.next())
             			{	
             				Soupid = rs3.getInt(2); 
             				Starterid = rs3.getInt(3);
             				RotiId = rs3.getInt(4);
             				SabjiId = rs3.getInt(5);
             				DalId = rs3.getInt(6);
             				RiceId = rs3.getInt(7);
             				Ice_creamId = rs3.getInt(8);
             				ChineseId = rs3.getInt(9);
             				CakeId = rs3.getInt(10);
             			}
            		
             			Soupname = getname(Soupid);
             			Stater = getname(Starterid);             			
             			Roti = getname(RotiId); 
             			Sabji = getname(SabjiId);
             			Dal = getname(DalId);
             			Rice = getname(RiceId);
             			Ice_cream = getname(Ice_creamId);
             			Chinese = getname(ChineseId);
             			Cake = getname(CakeId);
             			
            			out.println(Soupname+",");
            			out.println(Stater+",");
            			out.println(Roti+",");
            			out.println(Sabji+",");
            			out.println(Dal+",");
            			out.println(Rice+",");
            			out.println(Ice_cream+",");
            			out.println(Chinese+",");
            			out.println(Cake+".");
            		}
            	%>
            </div>
     </div>
    <!-- Table row -->
        <div class="row">
            <div class="col-xs-10 table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                    <th>NO.</th>
					<th>Product</th>
                    <th>Price</th>
                    </tr>
                    </thead>
                    <tbody>
		                <tr>
                        <td>1</td>
                        <%
                        String q4 = "select *from theme_master where Theme_Id="+Tid;
                    	rs1 = st.executeQuery(q4);
                    	while(rs1.next())
                    	{
                    		String Tname = rs1.getString(3);
                    		int price = rs1.getInt(5);
                        %>
                        <td><%=Tname %></td>
                         <td><%=price %></td>
                        <%
                    	}
                        %>
                        </tr>
                        <tr>
                        <td>2</td>
                        <%
                        String q5 = "select *from venue_master where Venue_Id="+Vid;
                    	rs1 = st.executeQuery(q5);
                    	while(rs1.next())
                    	{
                    		String Vname = rs1.getString(2);
                    		int price = rs1.getInt(5);
                        %>
                        <td><%=Vname %></td>
                        <td><%=price %></td>
                        <%
                    	}
                        %>
                        </tr>
                        <tr>
                        <td>3</td>
                        <td>Food Menus</td>
                        <td>25000</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <!-- accepted payments column -->
            <div class="col-md-6">
					<div class="table-responsive">
                        <table class="table">
							<tbody>
                            <tr>
                            <th>Total : <%=Total %></th>
                            </tr>
                            </tbody>
                        </table>
                    </div>
            </div>
        </div><br>
              
        <!-- <div class="row no-print">
            <div class="col-xs-4">
            <button class="btn btn-success pull-right">Back</button>
        	</div>
		</div> -->
</section>
</body>
</html>