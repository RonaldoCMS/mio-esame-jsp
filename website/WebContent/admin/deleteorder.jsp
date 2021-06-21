<!DOCTYPE html>
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
					<form action="../DeleteOrder" method="post">
						<p>delete order</p>
						<hr>
						<div class="form-row">
							<div class="form-group col-md-5">
								<label for="inputAddress">id order</label> <input type="text"
									name="id" class="form-control" id="inputAddress"
									placeholder="">
							</div>
						</div>
						<button type="submit" class="btn btn-primary">Alter</button>	
	  						 <% 
                            String message = request.getParameter("message");
                            if(message != null) { %>
								<p> <%=message %> </p>	
							<% request.removeAttribute("message"); } %>
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