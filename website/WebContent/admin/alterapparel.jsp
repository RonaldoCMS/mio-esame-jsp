<!DOCTYPE html>
<%@page import="website.com.obj.ApparelAbstract"%>
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
					<p>Alter apparel</p>
					<hr>
				<% String message = request.getParameter("id");
					if(message == null) {%>
					<form action="alterapparel.jsp" method="get">
						<div class="form-row">
							<div class="form-group col-md-5">
								<label for="inputAddress">id apparel</label> <input type="text"
									name="cdf" class="form-control" id="inputAddress"
									placeholder="">
							</div>
						</div>
						<button type="submit" class="btn btn-primary">Alter</button>
					</form>
					<% } else {
						ApparelAbstract apparel = new Core().getDatabase().getApparelAbstract();
						if(message != null && apparel == null) { %>
							<form action="alterCustumer.jsp" method="get">
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
                                <input type="text" name="name" class="form-control" id="inputAddress" value="<%= apparel.getName() %>" placeholder="" readonly>
                              </div>
                              <div class="form-group col-md-3">
                                <label for="inputPassword4">articuled code</label>
                                <input type="text" name="surname" class="form-control" id="inputAddress" value="<%= apparel.getArticuled_code() %>" placeholder="" readonly>
                              </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="inputAddress">brand</label>
                                    <input type="text" name="cdf" class="form-control" id="inputAddress" value="<%= apparel.getBrand() %>" placeholder="" readonly>
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="inputAddress2">original price</label>
                                    <input type="text" name="phone" class="form-control" id="inputAddress" value="<%= apparel.getOriginal_price() %>" placeholder="" >
                                </div>
                              </div>
                              <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="inputAddress">discount</label>
                                    <input type="text" name="email" class="form-control" id="inputAddress" value="<%= apparel.getDiscount() %>" placeholder="">
                                </div>
                                  <div class="form-group col-md-5">
                                    <label for="inputAddress">url</label>
                                    <input type="text" name="email" class="form-control" id="inputAddress" value="<%= apparel.getUrl() %>" placeholder="">
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