<!DOCTYPE html>
<%@ page import="com.db.util.DBConnection" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection" %>
<html>
<head>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" href="bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="css/imagehover.min.css">
    <!-- Theme CSS -->
    <link href="css/freelancer.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    
    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">	
    
 <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/freelancer.min.js"></script>
	<script src="jquery.min.js"></script>
</head>
<body>
<nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span><i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#page-top">Event Planner-Admin</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <%
	                HttpSession sess=request.getSession(false);
	               	String email = (String)session.getAttribute("email");
            		
            		Connection con = DBConnection.getConnection();
            		Statement st = con.createStatement();
            		ResultSet rs;
            		String foodCategorie = "select *from food_categorie";
            		rs = st.executeQuery(foodCategorie);
	                if(email!=null)
	                { 
	        %>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a href="Aindex.jsp">Home</a>
                    </li>
					<li>
                        <a href="BookEvent.jsp">Book Event</a>
                    </li>
                    <li>
                       <a class="dropdown-toggle" data-toggle="dropdown" href="#">Food Master<span class="caret"></span></a>   
	     			<ul class="dropdown-menu">
					<li>
						<%
							while(rs.next())
							{
								String categorie = rs.getString("Categorie");
								int categorieId = rs.getInt("Categorie_Id");								
						%>
							<a href="EventController?action=listUser&eventId=<%=categorieId%>"><%=categorie %></a>
						<% 

							}
						%>
					</li>
	     			</ul>
                    </li>
					<li>
                        <a href="UserController?action=listUser">Users</a>
                    </li>
					<li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>ADMIN<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="ChangePass.jsp"><i class="fa fa-fw fa-lock"></i>Change pass.</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="ALogOut.jsp"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>      
                </ul>
			</div>
			<%
	            }
			%>
        </div>
</nav><br><br><br><br><br>
</body>
</html>