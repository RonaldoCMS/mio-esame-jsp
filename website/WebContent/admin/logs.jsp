<%@page import="website.com.admin.Log"%>
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

<%@ include file="./includes/controllAdmin.jsp" %>
<jsp:include page="includes/header.jsp"/>

<%

ArrayList<Log> logs = new Core().getDatabase().getLogs();

%>

<body id="page-top">
    <div id="wrapper">

	<jsp:include page="includes/navbar.jsp"/>
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                    </div>
                    <div class="row">
                                                <div class="col">
                                                    <div class="container-fluid">
                                                        <h1 class="h3 mb-2 text-gray-800">Apparels</h1>
                                                        <div class="card shadow mb-4">
                                                            <div class="card-body">
                                                                <div class="table-responsive">
                                                                    <table class="table table-bordered" id="dataTable" width="100%"
                                                                        cellspacing="0">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>id</th>
                                                                                <th>id_user</th>
                                                                                <th>action</th>
                                                                                <th></th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                        <% 
                                                                        for(Log u : logs) {
                                                                        %>
                                                                        <form action="alterapparel.jsp" method="get">
                                                                            <tr>
                                                                                <td> <%= u.getId() %></td>
                                                                                <td><%= u.getId_user() %></td>
                                                                                <td><%= u.getAction() %></td>
                                                                              	<td> 
                                                                              	<input type="text" name="id" value="<%= u.getId() %>" style="display:none;"/>
                                                                              	<input type="submit" value="ALTER"> </td>
                                                                              	</form>
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
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>    
</body>

</html>