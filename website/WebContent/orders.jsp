<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<%@page import="website.com.Core"%>
<%@page import="website.com.obj.Order"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">

<head>
    <title>Orders</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<jsp:include page="includes/links.jsp"/>
</head>

<body>
	<jsp:include page="includes/navbar.jsp"/>
    <div class="container">
        <div class="row">
        <% Core core = new Core();
        ArrayList<Order> list =  core.getDatabase().getOders((int) session.getAttribute("id"));
        for(Order o : list) { %>
            <div class="col-sm-3">
                
                <div class="card">
                    
                    <div class="imgBx">
                        <img src="<%= core.getDatabase().getApparelUrlImage(o.getId()) %>" alt="nike-air-shoe">
                    </div>
                   
                    <div class="contentBx">
                        <div class="ordes">
                            <h2><%= core.getDatabase().moreOrders("brand", o.getId()) %></h2>
                            <h2><%= core.getDatabase().moreOrders("a.name", o.getId()) %></h2>
                            <p><%= core.getDatabase().moreOrders("articuled_code", o.getId()) %></p>
                            <p>SHIPPING: <%= o.getShipping() %></p>
                            <p>DELIVERED: <%= o.getDelivered() %></p>
                            <p>ADDRESS: <%= o.getAddress() %></p>
                            <p>PRICE: <%=o.getPrice() %></p>
                            <p><%= core.getDatabase().moreOrders("c.size", o.getId()) %> - <%=core.getDatabase().moreOrders("c.color", o.getId()) %></p>
                            <p>ID: <%=o.getId() %></p>
                        </div>  
                        <a href="#">REVIEW</a>     
                    </div>
                </div>
               
            </div>
	<% } %>
    </div>
<jsp:include page="includes/jsinclude.jsp"/>

</body>

</html>