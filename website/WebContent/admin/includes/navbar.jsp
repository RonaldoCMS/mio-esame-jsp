
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="index.html">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-clipboard-check"></i>
		</div>
		<div class="sidebar-brand-text mx-3">Danubbios Admin</div>
	</a>

	<hr class="sidebar-divider my-0">
	<li class="nav-item active"><a class="nav-link" href="index.jsp">
			<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
	</a></li>

	<li class="nav-item"><a class="nav-link" href="viewusers.jsp">
			<i class="fas fa-user-shield"></i> <span>view my custumers</span>
	</a></li>

	<li class="nav-item"><a class="nav-link" href="addcust.jsp"> <i
			class="fas fa-user-shield"></i> <span>add custumers</span></a></li>

	<li class="nav-item"><a class="nav-link" href="altercustumer.jsp">
			<i class="fas fa-user-shield"></i> <span>alter custumers</span>
	</a></li>

	<li class="nav-item"><a class="nav-link" href="deletecustumer.jsp">
			<i class="fas fa-user-shield"></i> <span>remove custumers</span>
	</a></li>

	<li class="nav-item"><a class="nav-link" href="vieworders.jsp">
			<i class="fas fa-box-open"></i> <span>view orders</span>
	</a></li>

	<li class="nav-item"><a class="nav-link" href="addorder.jsp">
			<i class="fas fa-box-open"></i> <span>add orders</span>
	</a></li>

	<li class="nav-item"><a class="nav-link" href="alterorder.jsp">
			<i class="fas fa-box-open"></i> <span>alter orders</span>
	</a></li>

	<li class="nav-item"><a class="nav-link" href="deleteorder.jsp">
			<i class="fas fa-box-open"></i> <span>delete orders</span>
	</a></li>

	<li class="nav-item"><a class="nav-link" href="viewapparels.jsp">
			<i class="fas fa-user-tie"></i> <span>view apparel</span>
	</a></li>

	<% int rank = (int) session.getAttribute("rank");
			
			if (rank >= 3) { %>
	<li class="nav-item"><a class="nav-link" href="addapparel.jsp">
			<i class="fas fa-user-tie"></i> <span>add apparel</span>
	</a></li>
	<li class="nav-item"><a class="nav-link" href="deleteapparel.jsp">
			<i class="fas fa-user-tie"></i> <span>delete apparel</span>
	</a></li>
	<li class="nav-item"><a class="nav-link" href="alterapparel.jsp">
			<i class="fas fa-user-tie"></i> <span>alter apparel</span>
	</a></li>

	<li class="nav-item"><a class="nav-link" href="alterapparel.jsp">
			<i class="fas fa-user-tie"></i> <span>alter concrete apparel</span>
	</a></li>

	<li class="nav-item"><a class="nav-link" href="alterapparel.jsp">
			<i class="fas fa-user-tie"></i> <span>alter concrete apparel</span>
	</a></li>
	<li class="nav-item"><a class="nav-link" href="alterapparel.jsp">
			<i class="fas fa-user-tie"></i> <span>territories</span>
	</a></li>
	<li class="nav-item"><a class="nav-link" href="logs.jsp"> <i
			class="fas fa-fw fa-table"></i> <span>logs</span></a></li>
	<% } %>
	<li class="nav-item"><a class="nav-link" href="../index.jsp">
			<i class="fas fa-sign-out-alt"></i> <span>exit</span>
	</a></li>
	<hr class="sidebar-divider d-none d-md-block">
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>



</ul>
<div id="content-wrapper" class="d-flex flex-column">
	<div id="content">
		<nav
			class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
			<button id="sidebarToggleTop"
				class="btn btn-link d-md-none rounded-circle mr-3">
				<i class="fa fa-bars"></i>
			</button>
			<ul class="navbar-nav ml-auto">
				<div class="topbar-divider d-none d-sm-block"></div>
				<li class="nav-item dropdown no-arrow"><a
					class="nav-link dropdown-toggle" href="#" id="userDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span
						class="mr-2 d-none d-lg-inline text-gray-600 small"><%= session.getAttribute("username") %></span>
				</a></li>
			</ul>
		</nav>