<!DOCTYPE html>
<%@page import="website.com.Core"%>
<%@page import="website.com.obj.User"%>
<html lang="en">
<%@ include file="./includes/controllAdmin.jsp"%>
<jsp:include page="includes/header.jsp" />

<body id="page-top">
	<div id="wrapper">
		<jsp:useBean id="loginError" class="website.com.bean.ErrorDiv" />
		<jsp:include page="includes/navbar.jsp" />
		<div class="container-fluid">
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
			</div>
			<div class="row">
				<div class="col-md-8 mx-auto">
					<p>Alter Account</p>
					<hr>
				<% String message = request.getParameter("cdf");
					if(message == null) {%>
					<form action="altercustumer.jsp" method="get">
						<div class="form-row">
							<div class="form-group col-md-5">
								<label for="inputAddress">Fiscal code</label> <input type="text"
									name="cdf" class="form-control" id="inputAddress"
									placeholder="">
							</div>
						</div>
						<button type="submit" class="btn btn-primary">Find</button>
					</form>
					<% } else {
						User user = new Core().getDatabase().findCustumer(message, session);
						if(message != null && user == null) { %>
							<form action="altercustumer.jsp" method="get">
							<div class="form-row">
								<div class="form-group col-md-5">
									<label for="inputAddress">Fiscal code</label> <input type="text"
										name="cdf" class="form-control" id="inputAddress"
										placeholder="">
								</div>
							</div>
							<button type="submit" class="btn btn-primary">Find</button>
							<p> Not found </p>
						</form>
						<% } else {%>
						   <form action="../AlterCustumer" method="post">
                            <div class="form-row">
                              <div class="form-group col-md-3">
                                <label for="input">name</label>
                                <input type="text" name="name" class="form-control" id="inputAddress" value="<%= user.getName() %>" placeholder="" readonly>
                              </div>
                              <div class="form-group col-md-3">
                                <label for="inputPassword4">surname</label>
                                <input type="text" name="surname" class="form-control" id="inputAddress" value="<%= user.getSurname() %>" placeholder="" readonly>
                              </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="inputAddress">fiscal Code</label>
                                    <input type="text" name="cdf" class="form-control" id="inputAddress" value="<%= user.getCdf() %>" placeholder="" readonly>
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="inputAddress2">phone</label>
                                    <input type="text" name="phone" class="form-control" id="inputAddress" value="<%= user.getPhone()%>" placeholder="" >
                                </div>
                              </div>
                              <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="inputAddress">email</label>
                                    <input type="text" name="email" class="form-control" id="inputAddress" value="<%= user.getEmail() %>" placeholder="">
                                </div>
                              </div>
                            <button type="submit" class="btn btn-primary">Register</button>
						</form>
					<% } } if(request.getParameter("message") != null) {%>
						<p> <%=(String) request.getParameter("message") %> </p>
						<% } %>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 mb-4"></div>
			</div>
		</div>
	</div>
	<jsp:include page="includes/footer.jsp" />
	</div>
</body>
</html>