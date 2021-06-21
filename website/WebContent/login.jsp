<% if(session.getAttribute("rank") != null){
		response.sendRedirect("./index.jsp");
	}
%>
<!doctype html>
<html lang="en">
<head>
<title>Login</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/login.css">

</head>
<body>
<jsp:useBean id="loginError" class="website.com.bean.ErrorDiv"/>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12 col-lg-10">
					<div class="wrap d-md-flex">
						<div
							class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
							<div class="text w-100">
								<h2>Welcome to Danubbios</h2>
								<p>Don't have an account?</p>
								<a href="#" class="btn btn-white btn-outline-white">Sign Up</a>
							</div>
						</div>
						<div class="login-wrap p-4 p-lg-5">
							<div class="d-flex">
								<div class="w-100">
									<h3 class="mb-4">Sign In</h3>
								</div>
								<div class="w-100">
									<p class="social-media d-flex justify-content-end">
										<a href="http://github.com/RonaldoCMS"
											class="social-icon d-flex align-items-center justify-content-center"><span
											class="fa fa-github"></span></a> <a
											href="http://instagram.com/Programmazione.py"
											class="social-icon d-flex align-items-center justify-content-center"><span
											class="fa fa-instagram"></span></a>
									</p>
								</div>
							</div>
							<form action="Login" method="post" class="signin-form">
								<div class="form-group mb-3">
									<label class="label" for="name">Username</label> <input name="username"
										type="text" class="form-control" placeholder="Username"
										required>
								</div>
								<div class="form-group mb-3">
									<label class="label" for="password">Password</label> <input name="password"
										type="password" class="form-control" placeholder="Password"
										required>
								</div>
								<div class="form-group">
									<button type="submit"
										class="form-control btn btn-primary submit px-3">Sign
										In</button>
										<% if(session.getAttribute("error") != null) { %>
					<jsp:setProperty property="error" name="loginError" value="<%= session.getAttribute(\"error\") %>"/>
					<jsp:getProperty property="divError" name="loginError"/>
				<% } %>
								</div>
								<div class="form-group d-md-flex">
									<div class="w-50 text-left">
										<label class="checkbox-wrap checkbox-primary mb-0">Remember
											Me <input type="checkbox" checked> <span
											class="checkmark"></span>
										</label>
									</div>
									<div class="w-50 text-md-right">
										<a href="#">Forgot Password</a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<jsp:include page="includes/jsinclude.jsp"/>

</body>
</html>

