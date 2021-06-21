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
ArrayList<User> users = core.getDatabase().custumersAdministrator((int)session.getAttribute("id"), (int) session.getAttribute("rank"));
ArrayList<Order> orders = core.getDatabase().ordersAdministrator((int)session.getAttribute("id"), (int) session.getAttribute("rank"));	

double profit = 0;
int numberReviews = 0;
int numberApparelsBought = core.getDatabase().getAllApparelBought(session);
for(Order o : orders) {
	profit += o.getPrice();
}
%>

<body id="page-top">
	<div id="wrapper">
		<jsp:include page="includes/navbar.jsp" />
		<div class="container-fluid">
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
			</div>
			<div class="row">
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-primary shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-primary text-uppercase mb-1">
										registered users</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800"><%= users.size() %></div>
								</div>
								<div class="col-auto">
									<i class="fas fa-calendar fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-success shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-success text-uppercase mb-1">
										completed orders</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800"><%= orders.size() %></div>
								</div>
								<div class="col-auto">
									<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-success shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-success text-uppercase mb-1">
										apparels bought</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800"><%= numberApparelsBought %></div>
								</div>
								<div class="col-auto">
									<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-success shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-success text-uppercase mb-1">
										profit</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800"><%= profit %>
										€
									</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-warning shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-warning text-uppercase mb-1">
										review</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800"><%= numberReviews %></div>
								</div>
								<div class="col-auto">
									<i class="fas fa-comments fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 mb-4">
					<div class="container-fluid">
						<h1 class="h3 mb-2 text-gray-800">My custumers</h1>
						<div class="card shadow mb-4">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead>
											<tr>
												<th>id</th>
												<th>Name</th>
												<th>Surname</th>
												<th>cdf</th>
												<th>phone</th>
												<th>username</th>
											</tr>
										</thead>
										<tbody>
								  <% 
                                  for(User u : users) {
                                  %>
											<tr>
												<td><%= u.getId() %></td>
												<td><%= u.getName() %></td>
												<td><%= u.getSurname() %></td>
												<td><%= u.getCdf() %></td>
												<td><%= u.getPhone() %></td>
												<% if(u.getUsername() != null) {%>
												<td><%= u.getUsername() %></td>
												<% } else { %>
												<td>
													<form action="createaccount.jsp" method="get">
														<input type="text" name="cdf" value="<%= u.getCdf() %>"
															style="display: none;"> <input type="submit"
															value="CREATE">
													</form>
												</td>
												<% } %>
											</tr>
											<% } %>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="container-fluid">
						<h1 class="h3 mb-2 text-gray-800">My Orders</h1>
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
												<th>address</th>
												<th>user</th>
												<th>apparel</th>
												<th>delivered</th>
											</tr>
										</thead>
										<tbody>
											<% 
								           	for(Order o : orders) {
								           %>
											<tr>
												<td><%= o.getId() %></td>
												<td><%= o.getPrice()%> €</td>
												<td><%= o.getShipping()%></td>
												<td><%= o.getAddress()%></td>
												<td><%= o.getUser()%></td>
												<td><%= o.getApparel()%></td>
												<td><%= o.getDelivered()%></td>
											</tr>
											<% } %>
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