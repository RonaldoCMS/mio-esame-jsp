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
ArrayList<ApparelAbstract> list = new Core().getDatabase().getAllAbstractApparels();
%>

<body id="page-top">
    <div id="wrapper">

	<jsp:include page="includes/navbar.jsp"/>
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
                                                           <th>color</th>
                                                           <th>size</th>
                                                           <th>qty</th>
                                                           <th>original price</th>
                                                           <th>discount</th>
                                                           <th>attual_price</th>
                                                           <th>type</th>
                                                           <th></th>
                                                           <th></th>
                                                            <th></th>
                                                       </tr>
                                                   </thead>
                                                   <tbody>
                                                   <% 
                                                   int i = 0;
                                                   for(ApparelAbstract u : list) {
                                                   %>
                                                       <tr>
                                                           <td> <%= u.getId() %></td>
                                                           <td> <%= u.getName() %></td>
                                                           <td> <%= u.getArticuled_code() %></td>
                                                           <td> <%= u.getBrand() %></td>
                                                           <td> <%= u.getOriginal_price() %></td>
                                                           <td> <%= u.getDiscount() %></td>
                                                           <td> <%= u.getAttual_price() %></td>
                                                           <td> <%= u.getType().getType() %></td>
                                                           <% int rank = (int) session.getAttribute("rank");
                                                           	if(rank >= 3) { %>
                                                           <td>
                                                            <form action="alterapparel.jsp" method="get">
                                                           	<input type="text" name="id" value="<%=u.getId()%>" style="display:none;"/>
                                                           	<input type="submit" value="ALTER"/>
                                                           	</form>
                                                           </td>
                                                           <td>
                                                            <form action="deleteapparel.jsp" method="get">
                                                           	<input type="text" name="id" value="<%=u.getId()%>" style="display:none;"/>
                                                           	<input type="submit" value="REMOVE"/>
                                                           	</form>
                                                           </td>
                                                            <% } else {%>
                                                            <td></td>
                                                            <td></td>
                                                            <% } %>
                                                            <td>
                                                            <form action="viewapparels.jsp" method="get">
                                                           	<input type="text" name="idapparel" value="<%=i%>" style="display:none;"/>
                                                           	<input type="submit" value="VIEW"/>
                                                           	</form>
                                                           </td>
                                                           <% i++; } %>
                                                       </tr>
                                                   </tbody>
                                               </table>
                                           </div>
                                           
                                       </div>
                                       
                                   </div>

                                   <%  if(request.getParameter("idapparel") != null) {
                                   int idapp = Integer.parseInt(request.getParameter("idapparel"));  %>
  									<div class="card shadow mb-4">
  									  <form action="addapparelconcrete.jsp" method="get">
  									  <input type="text" name="id" value="<%= list.get(idapp).getId() %>" style="display:none"/>
                                     	<input type="submit" value="ADD NEW"/>
                                     </form>
                                       <div class="card-body">
                                           <div class="table-responsive">
                                               <table class="table table-bordered" id="dataTable" width="100%"
                                                   cellspacing="0">
                                                   <thead>
                                                       <tr>
                                                           <th>id</th>
                                                           <th>color</th>
                                                           <th>size</th>
                                                           <th>qty</th>
                                                       </tr>
                                                   </thead>
                                                   <tbody>
                                                   <% 
                                                   i = 0;
                                                   for(ApparelConcrete u : list.get(idapp).getList()) {
                                                   %>
                                                       <tr>
                                                           <td> <%= u.getId() %></td>
                                                           <td> <%= u.getColor() %></td>
                                                           <td> <%= u.getSize() %></td>
                                                           <td> <%= u.getQty() %></td>
                                                           <% } %>
                                                       </tr>
                                                   </tbody>
                                               </table>
                                           </div>
                                       </div>
                                   </div>
                                    <% } %>
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