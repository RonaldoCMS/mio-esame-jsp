<%@page import="website.com.obj.City"%>
<%@page import="website.com.obj.Territory"%>
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

ArrayList<Territory> territories = core.getDatabase().getTerritories();

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
				<div class="col-lg-6 mb-4">
					<div class="container-fluid">
						<h1 class="h3 mb-2 text-gray-800">Territories</h1>
						<form action="territories.jsp">
							<input type="submit" value="ADD NEW TERRITORY" />
						</form>
						<div class="card shadow mb-4">

							<div class="card-body">

								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead>
											<tr>
												<th>id</th>
												<th>Name</th>
												<th>email</th>
												<th>phone</th>
												<th>OTHER</th>
												<th>OTHER</th>
											</tr>
										</thead>
										<tbody>
<% 
	for(Territory u : territories) {
%>
											<tr>
												<td><%= u.getId() %></td>
												<td><%= u.getName() %></td>
												<td><%= u.getEmail() %></td>
												<td><%= u.getPhone() %></td>
												<td>
													<form action="territories.jsp">
														<input type="text" name="id" value="<%=u.getId()%>"
															style="display: none;" /> <input type="submit"
															value="VIEW" />
													</form>
												</td>
												<td>
													<form action="territories.jsp">
														<input type="text" name="id" value="<%=u.getId()%>"
															style="display: none;" /> <input type="submit"
															value="ADD NEW CITY" />
													</form>
												</td>
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
						<%	if(request.getParameter("id") != null) { 
                        int intTer = Integer.parseInt(request.getParameter("id"));
                        	%>
						<h1 class="h3 mb-2 text-gray-800">City</h1>
						<div class="card shadow mb-4">

							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead>
											<tr>
												<th>id</th>
												<th>province</th>
												<form action="territories.jsp">
													<input type="submit" value="ADD NEW CITY" />
												</form>
												<th>city</th>
												<th>cap</th>
											</tr>
										</thead>
										<tbody>
<% 
                                   	
	ArrayList<City> cities = core.getDatabase().getCity(intTer);
for(City u : cities) {
%>
											<tr>
												<td><%= u.getId() %></td>
												<td><%= u.getProvince() %></td>
												<td><%= u.getCity() %></td>
												<td><%= u.getCap() %></td>
											</tr>
											<% } %>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<% } %>
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