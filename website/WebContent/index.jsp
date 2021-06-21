<!doctype html>
<%@page import="java.util.HashSet"%>
<%@page import="website.com.obj.ApparelConcrete"%>
<%@page import="java.util.List"%>
<%@page import="website.com.obj.ApparelAbstract"%>
<%@page import="java.util.ArrayList"%>
<%@page import="website.com.Core"%>
<html lang="en">

<head>
<title>Index</title>
<jsp:include page="includes/links.jsp" />
</head>

<body>
	<jsp:useBean id="loginError" class="website.com.bean.ErrorDiv"/>
	<jsp:include page="includes/navbar.jsp" />
	<section>
		<div class="container">
			<div class="row">
<% ArrayList<ApparelAbstract> list = new Core().getDatabase().getAllAbstractApparels();
    	for(ApparelAbstract e : list) { 
    		if(!e.getList().isEmpty()) {
    		%>
				<div class="col-sm-4">
					<div class="card">
						<div class="imgBx">
							<img
								src=<%=e.getUrl() %>
								alt="nike-air-shoe">
						</div>
						<div class="contentBx">
							<h2><%= e.getBrand() %></h2>
							<h3><%= e.getName() %></h3>
							<p><%= e.getArticuled_code() %></p>
							<p><%= e.getType().getType() %></p>
							<div class="size">
								<h3>Size :</h3>
<% 
ArrayList sizes = new ArrayList<String>();
	for(ApparelConcrete a : e.getList()) { 
		sizes.add(a.getSize());
	}
HashSet<String> hash = new HashSet<String>();
hash.addAll(sizes);
sizes.clear();
sizes.addAll(hash);
	for(int i=0; i<sizes.size(); i++) {%>
		<span><%= sizes.get(i) %></span>
<% } %>
							</div>
							<div class="color">
								<h3>Color :</h3>
<% 
ArrayList colors = new ArrayList<String>();
	for(ApparelConcrete a : e.getList()) { 
		colors.add(a.getHexcolor());
	}
HashSet<String> hashColors = new HashSet<String>();
hashColors.addAll(colors);
colors.clear();
colors.addAll(hashColors);
	for(int i=0; i<colors.size(); i++) { %>
	<span style="background-color:<%=colors.get(i)%>;"></span> 
<% } %>
							</div>
						</div>

					</div>
				</div>
<% } 
} %>
			</div>
		</div>
	<jsp:include page="includes/jsinclude.jsp"/>
</body>
</html>