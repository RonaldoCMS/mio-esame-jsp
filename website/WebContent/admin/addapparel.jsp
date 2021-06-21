<!DOCTYPE html>
<%@page import="java.io.IOException"%>
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
                        <form action="../NewApparel" method="post">
                            <p>Register Apparel</p>
                            <hr>
                            <div class="form-row">
                              <div class="form-group col-md-3">
                                <label for="input">name</label>
                                <input type="text" name="name" class="form-control" id="inputAddress" placeholder="" required>
                              </div>
                              <div class="form-group col-md-3">
                                <label for="inputPassword4">articuled_code</label>
                                <input type="text" name="articuled_code" class="form-control" id="inputAddress" placeholder="" required>
                              </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="inputAddress">brand</label>
                                    <input type="text" name="brand" class="form-control" id="inputAddress" placeholder="" required>
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="inputAddress2">price</label>
                                    <input type="text" name="price" class="form-control" id="inputAddress" placeholder="" required>
                                </div>
                              </div>
                              <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="inputAddress">discount</label>
                                    <input type="text" name="discount" class="form-control" id="inputAddress" placeholder="">
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="inputAddress">url image</label>
                                    <input type="text" name="url" class="form-control" id="inputAddress" placeholder="">
                                </div>
                                                                <div class="form-group col-md-5">
                                <div class="container">
                                     <select name="select" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                     <% ArrayList<Type> list = new Core().getDatabase().getTypes(); 
                                     	for(Type type : list) { %>
                                     		<option  value="<%=type.getId()%>"><%=type.getType()%></option>
                                     <%	}
                                     %> 
                                  </select>
                                  </div>
                                </div>
                              </div>
                            <button type="submit" class="btn btn-primary">Register</button>
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