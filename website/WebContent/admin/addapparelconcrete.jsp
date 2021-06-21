<!DOCTYPE html>
<%@page import="website.com.obj.City"%>
<%@page import="website.com.Core"%>
<%@page import="website.com.obj.Type"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
<%@ include file="./includes/controllAdmin.jsp" %>
<jsp:include page="includes/header.jsp"/>

<body id="page-top">
    <div id="wrapper">
    <jsp:useBean id="loginError" class="website.com.bean.ErrorDiv"/>
		<jsp:include page="includes/navbar.jsp"/>
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                    </div>
                    <div class="row">
                        <div class="col-md-8 mx-auto">
                        <form action="../NewApparelConcrete" method="post">
                            <p>Register Account</p>
                            <hr>
                            <div class="form-row">
                              <div class="form-group col-md-3">
                                <label for="input">id</label>
                                <input type="text" name="id" class="form-control" id="inputAddress" value="<%= request.getParameter("id") %>" readonly="readonly">
                              </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="inputAddress">Color</label>
                                    <input type="text" name="color" class="form-control" id="inputAddress" placeholder="" required>
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="inputAddress2">Size</label>
                                    <input type="text" name="size" class="form-control" id="inputAddress" placeholder="" required>
                                </div>
                              </div>
                              <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="inputAddress">Hex color</label>
                                    <input type="text" name="hexcolor" class="form-control" id="inputAddress" placeholder="" required>
                                </div>
                                <div class="form-group col-md-5">
                                <label for="inputAddress">Quantity</label>
									<input type="text" name="qty" class="form-control" id="inputAddress" placeholder="" required>
                                   </div>
                              </div>             
                            <button type="submit" class="btn btn-primary">Register</button>
                            <% 
                            String message = request.getParameter("message");
                            if(message != null) { %>
								<p> <%=message %> </p>	
							<% request.removeAttribute("error"); } %>
                          </form>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 mb-4">
                    </div>
                </div>
            </div>
        </div>
		<jsp:include page="includes/footer.jsp"/>
    </div>
</body>
</html>