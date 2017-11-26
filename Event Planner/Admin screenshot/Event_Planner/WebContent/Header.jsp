<%@page import="org.apache.catalina.startup.SetAllPropertiesRule"%>
<%@page import="org.apache.catalina.Session"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page import="com.db.util.DBConnection" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection" %>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	
	<meta charset="utf-8">
	<link href="img\pic\Logo.jpg" rel="icon"><title>Event Planner</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" href="bootstrap.min.css">
	<script src="freelancer.min.css"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Candal|Alegreya+Sans">
    <link rel="stylesheet" type="text/css" href="css/imagehover.min.css">

    <!-- Theme CSS -->
    <link href="css/freelancer.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Candal|Alegreya+Sans">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    
    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	
	<style>
		.carousel-inner > .item > img,
		.carousel-inner > .item > a > img {
		height:480px;
		width:1200px;
		margin: auto;
		}
#hoverOn {
display:none}		
 #hoverIn:hover + #hoverOn {
    display: block;
}
.mar-toevent{
    margin: 0 0 0 15px;
    }
.mar-toevent a {
	text-decoration:none;
}
@media only screen and (max-width: 480px) {
.nav .newki{
	float: none !important;
    margin: 14px;
 

    } 
  .navbar-collapse .nav .newki .newUl{
          position: relative !important;
    margin: -50px -1px 0 0;
    height: 222px;
       }
}
.newki{
	float: left;
    margin: 14px;
 

    } 
    .newki a{
        background-color:transparent !important;
        color:#fff !important;
           text-decoration:none;
        }
  .nav .newki  .newUl{
        position: absolute !important;
     right: -181px !important;  
    top: 39px;
    border-radius: 0px;
    }
    .newUl li:hover{
    	background-color:#fff;
    
    }
     .newUl li a:hover{
    		color:#58485f !important; 
     }
	</style>
	

 </head>
 
 <body>
	 	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
<%
	HttpSession sess = request.getSession(false);
	Connection con;
	con = DBConnection.getConnection();
	Statement st = con.createStatement();
	ResultSet rs;
try{
	 rs = st.executeQuery("select *from event_master");
 %>
	        <div class="container">
	          	<div class="navbar-header page-scroll">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	                    <span class="sr-only">Toggle navigation</span>
	                    <i class="fa fa-bars"></i>
	                </button>
	                	<a class="navbar-brand" href="#page-top">Event Planner</a>
	            </div>
	            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	                <ul class="nav navbar-nav navbar-right">
	                    <li class="hidden">
	                        <a href="#page-top"></a>
	                    </li>
	                    <li>
	                        <a href="index.jsp">Home</a>
	                    </li>
					<div class="newki dropdown" >	                   
					  
					   
	                       	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Event<span class="caret"></span></a>   
	     					<ul class="dropdown-menu newUl" >
	     						<% while(rs.next())
	                       		{ 
									String Ename = rs.getString(2);
									int Eid = rs.getInt(1);
									
								%>
								<li>
										<a href="Event.jsp?Eid=<%=Eid %>"><%=Ename %></a>
									</li>
								<% }
	     						}
	     							catch(Exception e)
	     							{
	     								e.printStackTrace();
	     							}
	     						%>
							</ul>
	                   
	                    </div>
						<li>
	                        <a href="About.jsp">About</a>
	                    </li>
						<li>
	                        <a href="Help.jsp">help</a>
	                    </li>
	                    <%
	                    	String name = (String)sess.getAttribute("Name");
	                    	if(name==null)
	                    	{ 
	                    %>
	                    <li class="page-scroll">
						<a href="Sign-In.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Sign-in</a>
	                    </li>
	                    <%	                    	
	                    	}
	                    	else if(name!=null)
	                    	{                  
	                    %>
	                    <li class="dropdown">
                    		<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><%= name%><b class="caret"></b></a>
                   		 <ul class="dropdown-menu">
                        <li>
                            <a href="EventMasterController?action=profile&email=<c:out value="${profile.email}"></c:out>"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="AddToCart.jsp"><i class="fa fa-fw fa-shopping-cart"></i> Add To Cart</a>
                        </li>
                        <li>
                            <a href="History.jsp"><i class="fa fa-history"></i> History</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="LogOut.jsp"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                        <%
	                    	}
	                    %>
                    </ul>
                </li>
	                </ul>
				</div>
	        </div>
	   </nav>
	   
	<!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!--P JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/freelancer.min.js"></script>
	<script src="jquery.min.js"></script>
</body>
</html>