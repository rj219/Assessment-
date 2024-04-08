<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signin</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<style>
header {
	border: 2px solid rgb(156, 152, 152);
	background-color: skyblue;
	text-align: center;
	padding: 10px;
}

a {
	padding: 50px;
	text-decoration: none;
	color: black;
	font-size:  17px;
	font-weight: 900;     
}
</style>
</head>
<body>
	<header>
		<a href="signup.jsp">Signup</a> || <a href="signin.jsp">Signin</a> ||
		<a href="Main.jsp">Home</a>
	</header>
	<div class="container">
		<div class="row">
			<div class="col-md-5 m-auto">
			
				<form action="signin" method="post">
				<h2 class="text-danger">${err}</h2>
					<div class="form-group">
						<label>Email</label> <input type="text" placeholder="Enter email"
							class="form-control" name="email">
					</div>
					<div class="form-group">
						<label>Password</label> <input type="text"
							placeholder="Enter Password" class="form-control" name="password">
					</div>
					<br>
					<div class="form-group">
						<input type="submit" class="btn btn-success">
						<a href="forgotpass.jsp" class="text-danger">Forgot Password ?</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>