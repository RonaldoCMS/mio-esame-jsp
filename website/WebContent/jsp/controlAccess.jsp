<%
	if(session.getAttribute("rank") == null) {
		response.sendRedirect("./login.jsp");
	} 
%>