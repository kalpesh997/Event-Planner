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
    
    if(session.getAttribute("Name") == null)
    {
    	response.sendRedirect(request.getContextPath() + "/index.jsp");
    	return;
    }
%>
<style type="text/css">
	table.table-style-three {
		font-family: verdana, arial, sans-serif;
		font-size: 11px;
		color: #58485f;
		border-width: 1px;
		border-color: #3A3A3A;
		border-collapse: collapse;
	}
	table.table-style-three th {
		border-width: 1px;
		padding: 8px;
		border-style: solid;
		border-color: #FFA6A6;
		background-color: #dcd0d0;
		color: #58485f;
	}
	table.table-style-three tr:hover td {
		cursor: pointer;
	}
	table.table-style-three tr:nth-child(even) td{
		background-color: #F7CFCF;
	}
	table.table-style-three td {
		border-width: 1px;
		padding: 8px;
		border-style: solid;
		border-color: #FFA6A6;
		background-color: #dcd0d0;
	}
</style>

<script type="text/javascript">	
</script>

</head>
<body>
<jsp:include page="Header.jsp"/>

 <script src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			var foods_cat_name = new Array();
			var foods_name = new Array();
			var foods_price = new Array();
			var text = "";
			var i;	
			var total=0;
			var cnt=0;

            $('select').on('change', function() 
            {
                 var select_id = this.id;
            		 
            	 var selectedText = $(this).find('option:selected').text();
                 //alert(selectedText);
                 
                 init = selectedText.indexOf('(');
                 fin = selectedText.indexOf(')');
            	 var fname = selectedText.substr(0,init)
                 var price = selectedText.substr(init+1,fin-init-1);
            	
          	 	 foods_cat_name[cnt] = select_id;
          		 foods_name[cnt] =  fname;                		
          		 foods_price[cnt] = price;
          		
          		 cnt++;
              
                 text="";
                 text = "<table border=1 class='table-style-three' id='mytable'>"
                 text += "<thead><tr><th>Select</th><th>ID</th><th>Category Name</th><th>Item Name</th><th>Price</th></tr></thead><tbody>";
               	 total=0;
               	 
                 for (i = 0; i < cnt; i++) {  
                	 text += "  <tbody><tr>  <td><input type='checkbox' name='record'></td><td>  "+ (i+1) + "</td><td>  "+ foods_cat_name[i] + "</td><td>  " +  foods_name[i] + "</td><td>  " + foods_price[i] + "</td></tr>  </tbody>";
                	 total += Number(foods_price[i]);  
                	} 
                 
                 text += "</tbody></table>"
                 //alert(text);
                 document.getElementById("total").innerHTML = text;
                 document.getElementById("price").innerHTML = total +"/-";
                 
                 document.getElementById("price1").value =  total;
                 // console.log(selectedText.substr(init+1,fin-init-1))                 
                 // var price = selectedText.substr(-3, 2); 
                 //alert(total);
            	})     
                $(".delete-row").click(function(){
                    $("table tbody").find('input[name="record"]').each(function(){
                    	if($(this).is(":checked")){
                            $(this).parents("tr").remove();
                        }  
                    });
                    
                    cnt=0;
                    total=0;
                    $('#mytable tr').each(function() {
                    	   		var cust = $(this).find("td").eq(2).html();   
                	    		//alert(cust);
                	    		
                	    		if(cust!= null)
                	    		{
                	    			//alert("inside...");
                	    			foods_cat_name[cnt] = $(this).find("td").eq(2).html();
                          			foods_name[cnt] =  $(this).find("td").eq(3).html();               		
                          			foods_price[cnt] = $(this).find("td").eq(4).html();
                          		
                          			cnt++;
                          			total += Number($(this).find("td").eq(4).html());  
                	    		}
                 		 });	
                    document.getElementById("price").innerHTML = total +"/-";
                    document.getElementById("price1").value =  total;			
                });
			});
</script>
 <section id="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                   <h2>Customized-Package</h2>
                    <hr class="star-primary">
                </div>
            </div>						
		</div><br><br>
		<form action="customize" method="get">
		<div class="container">					
				<%
					HttpSession sess = request.getSession(false); 
					Connection con,con1;
					con = DBConnection.getConnection();
					Statement st = con.createStatement();
					ResultSet rs;
					rs = st.executeQuery("select * from food_categorie");
				%>
	            <div class="row">
	                     <% while(rs.next())
	                    	{
	                    	 	int Category_Id = rs.getInt(1);
	                    		String img = rs.getString(3);
	                    		String name = rs.getString(2);
	                    %>
	                    <div class="col-sm-4">  <h4><%=name %> :</h4>
		                     <div class="caption">
								<img src="<%=img %>" width="200" height="200" class="img-responsive" alt="">
							</div>
				                <h4>
					                <% 
					                	con = DBConnection.getConnection();
										Statement st1 = con.createStatement();
										ResultSet rs1;
										rs1 = st1.executeQuery("select * from food_item where Categorie_id = " + Category_Id);
									%>									
									<select name=<%=name%> id=<%=name%>>
									<%-- <option value="">Select_<%=name%></option> --%>
									<%
										while(rs1.next())
										{
											int fid = rs1.getInt("Food_Item_Id");
											String fname = rs1.getString("Food_Item_Name");
											String fprice = rs1.getString("Price");
											%>
											<option value="<%=fid %>"><%=fname %>(<%=fprice %>)</option>
											<%
										}
									%>											
									</select>
								</h4>
						</div>
						<%
							}
	                    %>    
				</div>		
				<input type=hidden value="" id="price1" name="price1" />	
				<h1>Total : <lable id="price" name="price"></lable></h1>
				<button type="button"  class="delete-row">Delete</button>     
								
			<div id="total" style="float:left;"></div>
			<div class="row">
		           <div class="form-group col-lg-offset-9">
				   		<input type="submit" name="RSubmit" value="Next" class="btn btn-success btn-lg">
		           </div>
		    </div>
		</div>
		</form>
</section> 
<jsp:include page="Footer.jsp"/>
</body>
</html>