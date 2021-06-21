<%
	if((int) session.getAttribute("rank") == 1) {
		response.sendRedirect("../index.jsp");
	} 
%>