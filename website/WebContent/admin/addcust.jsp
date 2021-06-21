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
                        <form action="../NewCustumer" method="post">
                            <p>Register Account</p>
                            <hr>
                            <div class="form-row">
                              <div class="form-group col-md-3">
                                <label for="input">name</label>
                                <input type="text" name="name" class="form-control" id="inputAddress" placeholder="" required>
                              </div>
                              <div class="form-group col-md-3">
                                <label for="inputPassword4">surname</label>
                                <input type="text" name="surname" class="form-control" id="inputAddress" placeholder="" required>
                              </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="inputAddress">fiscal Code</label>
                                    <input type="text" name="cdf" class="form-control" id="inputAddress" placeholder="" required>
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="inputAddress2">phone</label>
                                    <input type="text" name="phone" class="form-control" id="inputAddress" placeholder="" required>
                                </div>
                              </div>
                              <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="inputAddress">email</label>
                                    <input type="text" name="email" class="form-control" id="inputAddress" placeholder="">
                                </div>
                                <div class="form-group col-md-5">
                                <label for="inputAddress">City</label>
                                <select name="select" class="form-control" aria-label=".form-select-lg example">  
                                     <% ArrayList<City> list = new Core().getDatabase().getCity((int) session.getAttribute("territory")); 
                                     	for(City city : list) { %>
                                     		<option  value="<%=city.getId()%>"><%=city.getCity()%></option>
                                     <%	}
                                     %>      
                                  </select>
                                   </div>
                              </div>
                            <button type="submit" class="btn btn-primary">Register</button>
                            <% 
                            String message = request.getParameter("message");
                            if(message != null) { %>
								<p> <%=message %> </p>	
							<% } %>
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