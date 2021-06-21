<%@ include file="../jsp/controlAccess.jsp" %>
<ul class="menu">
<form action="Logout">
	<li title="home"><a href="index.jsp" class="fas fa-home">HOME</a></li>
	<li title="box"><a href="orders.jsp" class="fas fa-box">BOX</a></li>
	<% 
		int rank = (int) session.getAttribute("rank");
		if(rank >= 2) { %>
	<li title="housekeeping"><a href="admin/index.jsp"
		class="active about">HOUSEKEEPING</a></li>
	<% } %>
	<li title="logout"> 
		<a class="fas fa-user-shield" href="profile.jsp"> </a>
	</li>
	<li title="logout"> 
		<a class="fas fa-sign-out-alt" href="jsp/logout.jsp"> </a>
	</li>
</form>
</ul>