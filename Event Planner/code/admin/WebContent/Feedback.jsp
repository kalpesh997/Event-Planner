<%@ page import="com.db.util.DbUtil" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection" %>

<html>
<body>
	<jsp:include page="AHeader.jsp"></jsp:include>
<div class="row">
<%
	Connection con = DbUtil.getConnection();
	Statement st = con.createStatement();
	ResultSet rs;
%>
                    <div class="col-lg-6">
                        <h2>&nbsp;&nbsp;&nbsp;Feeback</h2>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Sr.No</th>
                                        <th>User Name</th>
                                        <th>Email</th>
                                        <th>Date</th>
                                        <th>Feeback</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                	String q = "select *from feedback";
                                	rs = st.executeQuery(q);
                                	int a=1;
                                	while(rs.next())
                                	{
                                		String CName = rs.getString("Customer_Name");
                                		String DOF = rs.getString("Date_Of_Feedback");
                                		String Email = rs.getString("Email");
                                		String Sub = rs.getString("Subject");
                                %>
                                    <tr>
                                        <td><%=a %></td>
                                        <td><%=CName %></td>
                                        <td><%=Email %></td>
                                        <td><%=DOF %></td>
                                        <td><%=Sub %></td>
                                    </tr>
                                <%
                                a++;	}
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Inquiry</h2>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Sr No</th>
                                        <th>User Name</th>
                                        <th>Email</th>
                                          <th>Date</th>
                                        <th>Inquiry</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                	String q1 = "select *from inquiry";
                                	rs = st.executeQuery(q1);
                                	int b=1;
                                	while(rs.next())
                                	{
                                		String CName = rs.getString("Customer_Name");
                                		String DOI = rs.getString("Date_Of_Inquiry");
                                		String Email = rs.getString("Email");
                                		String Sub = rs.getString("Subject");
                                %>
                                    <tr>
                                        <td><%=b%></td>
                                        <td><%=CName %></td>
                                        <td><%=Email %></td>
                                          <th><%=DOI %></th>
                                        <td><%=Sub %></td>
                                    </tr>
                               <%
                                b++; }
                               %>
                                </tbody>
                            </table>
                        </div>
                    </div>
</div>
</body>
</html>