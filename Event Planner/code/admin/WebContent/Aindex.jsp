<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.db.util.DbUtil" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection" %>
<html>
<head>
<%	response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    int timeout = session.getMaxInactiveInterval();
    response.setHeader("Refresh", timeout + "; URL = index.jsp");
    
    if(session.getAttribute("email") == null)
    {
    	response.sendRedirect("Sign-in.jsp");	
    	return;
    }
%>

<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="engine1/style.css" />
	<script type="text/javascript" src="engine1/jquery.js"></script>
</head>
<body id="page-top">
<div class="row">
<div class="col-lg-12 col-md-12">
	<jsp:include page="AHeader.jsp"/>
	<!-- Start WOWSlider.com BODY section --> <!-- add to the <body> of your page -->
	<div id="wowslider-container1">
	<div class="ws_images">
	<ul>
		<li><a href="/admin/UserController?action=listUser"><img src="data1/images/user.png" alt="Event_Planner" title="Users" id="wows1_0"/></a></li>
		<li><a href="BookEvent.jsp"><img src="data1/images/cart.png" alt="Event_Planner" title="Book Orders" id="wows1_1"/></a></li>
		<li><img src="data1/images/icons-food.png" alt="jquery slideshow" title="Food Menus" id="wows1_2"/></li>
	</ul></div>
	<div class="ws_bullets">
	<div>
		<a href="#" title="Event_Planner"><span><img src="data1/tooltips/user.png" alt="Event_Planner"/>1</span></a>
		<a href="#" title="Event_Planner"><span><img src="data1/tooltips/cart.png" alt="Event_Planner"/>2</span></a>
		<a href="#" title="Event_Planner"><span><img src="data1/tooltips/icons-food.png" alt="Event_Planner"/>3</span></a>
		
	</div></div>
	<div class="ws_script" style="position:absolute;left:-99%">
	<a href="http://wowslider.net">http://wowslider.net/</a> by WOWSlider.com v8.7</div>
	<div class="ws_shadow"></div>
	</div>	
	<script type="text/javascript" src="engine1/wowslider.js"></script>
	<script type="text/javascript" src="engine1/script.js"></script>
	<!-- End WOWSlider.com BODY section -->
</div>
</div>
<br><br><br><br><br>
<div class="row">
<div class="col-lg-3 col-md-6">
</div>
                    <div class="col-lg-2 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-user fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                    <%
                                    	Connection con = DbUtil.getConnection();
                                    	Statement st = con.createStatement();
                                    	ResultSet rs;
                                    	int cnt = 0;
                                    	String q = "select *from customer_master";
                                    	rs = st.executeQuery(q);
                                    	while(rs.next())
                                    	{
                                    		int i = rs.getInt(1);
                                    		cnt++;
                                    	}
                                    	%>
                                        <div class="huge"><%=cnt %></div>
                                        <div>Users</div>
                                    </div>
                                </div>
                            </div>
                             <a href="/admin/UserController?action=listUser">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-tasks fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                    	<%
                                    	int cnt1 = 0;
                                    	String q1 = "select *from order_master";
                                    	rs = st.executeQuery(q1);
                                    	while(rs.next())
                                    	{
                                    		int i = rs.getInt(1);
                                    		cnt1++;
                                    	}
                                    	%>
                                        <div class="huge"><%=cnt1 %></div>
                                        <div>Book Event</div>
                                    </div>
                                </div>
                            </div>
                             <a href="BookEvent.jsp">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                             </a>
                            
                        </div>
                    </div> 
                    <div class="col-lg-2 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-cutlery fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                    	<%
                                    	int cnt3 = 0;
                                    	String q3 = "select *from food_item";
                                    	rs = st.executeQuery(q3);
                                    	while(rs.next())
                                    	{
                                    		int i = rs.getInt(1);
                                    		cnt3++;
                                    	}
                                    	%>
                                        <div class="huge"><%=cnt3 %></div>
                                        <div>Food Menus</div>
                                    </div>
                                </div>
                            </div>
                            <a href="">
                                <div class="panel-footer">
                                    <span class="pull-left">Food Menus</span>
                                    <span class="pull-right"><i class="icon-food"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div> 
</div>
</body>
</html>