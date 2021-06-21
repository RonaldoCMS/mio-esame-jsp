<!DOCTYPE html>
<%@page import="website.com.obj.Order"%>
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
			<div class="row">
				<div class="col-md-8 mx-auto">
					<p>Alter order</p>
					<hr>
				<% String message = request.getParameter("id");
					if(message == null) {%>
					<form action="alterorder.jsp" method="get">
						<div class="form-row">
							<div class="form-group col-md-5">
								<label for="inputAddress">id order</label> <input type="text"
									name="id" class="form-control" id="inputAddress"
									placeholder="">
							</div>
						</div>
						<button type="submit" class="btn btn-primary">Find</button>
					</form>
					<% } else {
						Order order = new Core().getDatabase().findOrder(Integer.parseInt(message), session);
						if(message != null && order == null) { %>
							<form action="alterorder.jsp" method="get">
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
						   <form action="../AlterOrder" method="post">
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                <label for="input">id</label>
                                <input type="text" name="id" class="form-control" id="inputAddress" value="<%= order.getId() %>" placeholder="" readonly>
                              </div>
                              <div class="form-group col-md-3">
                                <label for="input">price</label>
                                <input type="text" name="price" class="form-control" id="inputAddress" value="<%= order.getPrice() %>" placeholder="" readonly>
                              </div>
                              <div class="form-group col-md-3">
                                <label for="inputPassword4">shipping</label>
                                <input type="text" name="shipping" class="form-control" id="inputAddress" value="<%= order.getShipping() %>" placeholder="" readonly>
                              </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="inputAddress">review</label>
                                    <input type="text" name="review" class="form-control" id="inputAddress" value="<%= order.getReview() %>" placeholder="">
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="inputAddress2">address</label>
                                    <input type="text" name="address" class="form-control" id="inputAddress" value="<%= order.getAddress()%>" placeholder="" >
                                </div>
                                 <div class="form-group col-md-5">
                                    <label for="inputAddress2">delivered</label>
                                    <% if (request.getParameter("review") != null) { %>
                                    <input type="date" name="delivered" class="form-control" id="inputAddress" value="<%= order.getDelivered()%>" placeholder="" readonly="readonly">
                                	<% } else { %>
                                	<input type="date" name="delivered" class="form-control" id="inputAddress" value="<%= order.getDelivered()%>" placeholder="" >
                                	<% } %>
                                </div>
                               </div>
                            <button type="submit" class="btn btn-primary">Alter</button>
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