<%@page import="java.util.List"%>
<%@page import="website.com.obj.ApparelAbstract"%>
<%@page import="website.com.obj.ApparelConcrete"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="website.com.obj.Order"%>
<%! Core core = new Core();  %>
<!DOCTYPE html>
<%@page import="website.com.obj.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="website.com.Core"%>
<html lang="en">

<%@ include file="./includes/controllAdmin.jsp"%>
<jsp:include page="includes/header.jsp" />

<%

ArrayList<Order> orders = new Core().getDatabase().getallMyOrder(session);
String cdf = request.getParameter("123");
%>

<body id="page-top">
	<div id="wrapper">
		<jsp:include page="includes/navbar.jsp" />
		<div class="container-fluid">
			<div class="row">
				<div class="col">
					<div class="container-fluid">
						<h1 class="h3 mb-2 text-gray-800">Orders</h1>
						<div class="card shadow mb-4">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead>
											<tr>
												<th>id</th>
												<th>price</th>
												<th>shipping</th>
												<th>delivered</th>
												<th>review</th>
												<th>address</th>
												<th>cdf</th>
												<th>articuled code</th>
												<th></th>
												<th></th>
											</tr>
										</thead>
										<tbody>
										
											<% 
                                             for(Order u : orders) {
                                            	 
                                            	 if(cdf == null) {
                                             %>
											
											<tr>
												<td><%= u.getId() %></td>
												<td><%= u.getPrice() %></td>
												<td><%= u.getShipping() %></td>
												<td><%= u.getDelivered() %></td>
												<td><%= u.getReview() %></td>
												<td><%= u.getAddress() %></td>
												<td><%= u.getUserCdf() %></td>
												<td><%= u.getApparelArticuledCode() %></td>
												<td>
													<% if(u.getDelivered() == null) { %>
													<form action="alterorder.jsp" method="post">
														<input type="text" name="id" value="<%= u.getId() %>"
															style="display: none;" /> <input type="submit"
															value="COMPLETE">
													</form> <% } %>
												</td>
												<td>
													<form action="alterorder.jsp" method="post">
														<input type="text" name="id" value="<%= u.getId() %>" style="display:none"/>
														<input type="text" name="review" value="1" style="display:none"/>
														 <input type="submit" value="ALTER">
													</form>
												</td>

											</tr>
											<% } else { 
												if (u.getUserCdf().equalsIgnoreCase(cdf)) { %>
													<tr>
													<td><%= u.getId() %></td>
													<td><%= u.getPrice() %></td>
													<td><%= u.getShipping() %></td>
													<td><%= u.getDelivered() %></td>
													<td><%= u.getReview() %></td>
													<td><%= u.getAddress() %></td>
													<td><%= u.getUserCdf() %></td>
													<td><%= u.getApparelArticuledCode() %></td>
													<td>
													<% if(u.getDelivered() == null) { %>
													<form action="apparels.jsp" method="get">
														<input type="text" name="id" value="<%= u.getId() %>"
															style="display: none;" /> <input type="submit"
															value="COMPLETE">
													</form> <% } %>
												</td>
												<td>
													<% if(u.getDelivered() == null) { %>
													<form action="apparels.jsp" method="get">
														<input type="text" name="id" value="<%= u.getId() %>"
															style="display: none;" /> <input type="submit"
															value="REVIEW">
													</form> <% } %>
												</td>
													</tr>
											<% 	}
											} 
                                          }%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="includes/footer.jsp"></jsp:include>
	</div>
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
</body>
</html>