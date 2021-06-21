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
ArrayList<User> list = new Core().getDatabase().custumersAdministrator((int) session.getAttribute("id"),(int) session.getAttribute("rank"));
%>

<body id="page-top">
	<div id="wrapper">
		<jsp:include page="includes/navbar.jsp" />
		<div class="container-fluid">
			<div class="row">
				<div class="col">
					<div class="container-fluid">
						<h1 class="h3 mb-2 text-gray-800">Users</h1>
						<div class="card shadow mb-4">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead>
											<tr>
												<th>id</th>
												<th>name</th>
												<th>username</th>
												<th>cdf</th>
												<th>city</th>
												<th>username</th>
												<th>last_login</th>
												<th>email</th>
												<th></th>
												<th></th>
												<th></th>

											</tr>
										</thead>
										<tbody>
											<% 
                                                   for(User u : list) {
                                                   %>

											<tr>
												<td><%= u.getId() %></td>
												<td><%= u.getName() %></td>
												<td><%= u.getSurname() %></td>
												<td><%= u.getCdf() %></td>
												<td><%= u.getCity().getCity() %></td>
												<td><%= u.getUsername() %></td>
												<td><%= u.getLast_login() %></td>
												<td><%= u.getEmail() %></td>
												<td>
													<form action="altercustumer.jsp" method="get">
														<input type="text" name="cdf" value="<%=u.getCdf()%>"
															style="display: none;" /> <input type="submit"
															value="ALTER" />
													</form>
												</td>
												<td>
													<form action="addorder.jsp" method="get">
														<input type="text" name="cdf" value="<%=u.getCdf()%>"
															style="display: none;" /> <input type="submit"
															value="NEW ORDER" />
													</form>
												</td>
												<td>
													<form action="vieworders.jsp" method="get">
														<input type="text" name="123" value="<%=u.getCdf()%>"
															style="display: none;" /> <input type="submit"
															value="ORDERS" />
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