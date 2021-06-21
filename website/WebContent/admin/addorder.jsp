<!DOCTYPE html>
<%@page import="website.com.Core"%>
<%@page import="website.com.obj.City"%>
<%@page import="java.util.ArrayList"%>
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
					<form action="../NewOrder" method="post">
						<p>Add order</p>
						<hr>
						<div class="form-row">
							<div class="form-group col-md-3">
								<% String cdf = request.getParameter("cdf"); 
                                	if(cdf == null) {%>
								<label for="input">Fiscal code custumer</label> <input
									type="text" name="cdf" class="form-control" id="inputAddress"
									placeholder="" required>
								<% } else { %>
								<label for="input">Fiscal code custumer</label> <input
									type="text" name="cdf" class="form-control" id="inputAddress"
									value="<%= cdf %>" readonly="readonly">
								<% } %>
							</div>
							<div class="form-group col-md-3">
								<% String id = request.getParameter("id"); 
                                	if(id != null) {%>
								<label for="inputPassword4">id</label> <input type="text"
									name="id" value="<%= id %>" class="form-control"
									id="inputAddress" placeholder="" readonly="readonly">
								<% } else {%>
								<label for="inputPassword4">id</label> <input type="text"
									name="id" class="form-control" id="inputAddress" placeholder=""
									required>
								<% } %>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-5">
								<label for="inputAddress">shipping</label> <input type="date"
									name="shipping" class="form-control" id="inputAddress"
									placeholder="" required>
							</div>
							<div class="form-group col-md-5">
								<label for="inputAddress2">address</label> <input type="text"
									name="address" class="form-control" id="inputAddress"
									placeholder="" required>
							</div>
							<div class="form-group col-md-5">
								<label for="inputAddress">City</label> <select name="select"
									class="form-control" aria-label=".form-select-lg example">

									<% ArrayList<City> list = new Core().getDatabase().getCity((int) session.getAttribute("territory")); 
                                     	for(City city : list) { %>
									<option value="<%=city.getId()%>"><%=city.getCity()%></option>
									<%	}
                                     %>
								</select>
							</div>
						</div>
						<button type="submit" class="btn btn-primary">Order</button>
						<% 
                            String message = request.getParameter("message");
                            if(message != null) { %>
						<p>
							<%=message %>
						</p>
						<% request.removeAttribute("error"); } %>
					</form>
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