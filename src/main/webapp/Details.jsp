<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details</title>
<style>
header{
            border: 2px solid rgb(156, 152, 152);
            background-color: skyblue;
            text-align: center;
            padding: 10px;
        }
        a{
            padding: 50px;
            text-decoration: none;
            color: black;
            font-size: 17px;
			font-weight: 900;
        }
</style>
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
</head>
<body>
<%
String name = (String)session.getAttribute("name");
if(name==null)
{
	request.setAttribute("err", "Login First...!!");
	request.getRequestDispatcher("signin.jsp").forward(request, response);
}
%>
<a href="signup.jsp">Signup</a> || <a href="signin.jsp">Signin</a> || <a href="Main.jsp">Home</a>

	<div class="cotainer">
		<div class="row">
			<div class="col-md-9">

				<table class="table">
					<tr>
						<th>Id</th>
						<th>First name</th>
						<th>Last name</th>
						<th>Email</th>
						<th>Mobile</th>
						<th>Address</th>
						<th>Gender</th>
						<th>Password</th>
						<th>Confirmpassword</th>
						<th colspan="2">Action</th>
					</tr>
					
					<c:forEach var="s" items="${data}">
					<tr>
					<td>${s.getId()}</td>
					<td>${s.getFirstname()}</td>
					<td>${s.getLastname()}</td>
					<td>${s.getEmail()}</td>
					<td>${s.getMobile()}</td>
					<td>${s.getAddress()}</td>
					<td>${s.getGender()}</td>
					<td>${s.getPassword()}</td>
					<td>${s.getConfirmpassword()}</td>
					<td><a href="update?action=edit&id=${s.getId()}" class="btn btn-primary">Edit</a></td>
					<td><a href="update?action=delete&id=${s.getId()}" class="btn btn-danger">Delete</a></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>