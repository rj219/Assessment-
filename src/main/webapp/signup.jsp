<%@page import="Model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
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
	<script type="text/javascript">
	
	function validation()
	{
		
		var email = document.getElementById("email").value
		var password = document.getElementById("password").value
		var confirmpassword = document.getElementById("confirmpassword").value
	
		var emailErr = document.getElementById("emailErr")
		var passwordErr = document.getElementById("passwordErr")
		var confirmpasswordErr = document.getElementById("confirmpasswordErr")
		
		var submit = document.getElementById("submit")
		
		var emailExp = /^[a-zA-z_0-9-]+@[a-z]+\.[a-z]{1,3}$/
		var passwordExp = /^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[@!#$%&?"])[a-zA-Z0-9!@#$%&?]{8,20}$/
		
		if(email==""||email==null)
			{
			emailErr.innerHTML="Email Can not be blank.."
			submit.disabled=true;
			}
		else if(!emailExp.test(email))
			{
			emailErr.innerHTML="Invalid Email format..."
			submit.disabled=true;
			}
		else
			{
			emailErr.innerHTML=""
			submit.disabled=false;
			}
		
		
		if(password==""||password==null)
		{
			
			passwordErr.innerHTML="Password is Required !!!"
			submit.disabled=true
		}
		else if(!passwordExp.test(password))
		{
		
			passwordErr.innerHTML="Invalid Formate"
			submit.disabled=true
		}
		else{
			
			passwordErr.innerHTML=""
			submit.disabled=false
		}
		
		
		if(confirmpassword != password)
		{
			confirmpasswordErr.innerHTML="Confirmpassword must be same as pass"
		}
		else{
			confirmpasswordErr.innerHTML=""
		}
			
	}
	
	</script>
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
</head>
<body>
		<%-- <%Student s = (Student)request.getAttribute("sdata");
		String gender = s.getGender();%> --%>
<header>
<a href="signup.jsp">Signup</a> || <a href="signin.jsp">Signin</a> || <a href="Main.jsp">Home</a>
</header>

<div class="container">
<div class="row">
<div class="col-md-5 m-auto">
<form action="reg" method="post">
<h2 class="text-success">Registration Form</h2>
<p class="text-success">${msg}<p>
<p class="text-danger">${err}</p>
<div class="form-group">
<label>First Name</label>
<input type="hidden" name="id" value="${sdata.getId()}">
<input type="text" name="firstname" placeholder="Enter Firstname" class="form-control" value="${sdata.getFirstname()}">
</div>
<div class="form-group">
<label>Last Name</label>
<input type="text" name="lastname" placeholder="Enter Lastname" class="form-control" value="${sdata.getLastname()}">
</div>
<div class="form-group">
<label>Email</label>
<input type="text" name="email" placeholder="Enter email" id="email" class="form-control" value="${sdata.getEmail()}" onkeyup="validation()">
<span id="emailErr" class="text-danger"></span>
</div>
<div class="form-group">
<label>Mobile</label>
<input type="text" name="mobile" placeholder="Enter Phone"  class="form-control" value="${sdata.getMobile()}">
</div>
<div class="form-group">
<label>Address</label>
<input type="text" name="address" placeholder="Enter Address" class="form-control" value="${sdata.getAddress()}">
</div>
<div class="form-group">
<label>Gender</label>
<input type="radio" name="gender"  value="male" <c:if test="${sdata.getGender().equals('male')}"> checked = "/checked"/</c:if> >Male
<input type="radio" name="gender" value="female" <c:if test="${sdata.getGender().equals('female')}"> checked = "/checked"/</c:if>>Female
</div>
<div>
<label>Password</label>
<input type="password" name="password" placeholder="Enter Password" id="password" class="form-control"  value="${sdata.getPassword()}" onkeyup="validation()">
<span id="passwordErr" class="text-danger"></span>
</div>
<div class="from-group">
<label>Confirm Password</label>
<input type="password" name="confirmpassword" placeholder="Enter confirm password" id="confirmpassword" class="form-control" value="${sdata.getConfirmpassword()}" onkeyup="validation()">
<span id="confirmpasswordErr" class="text-danger"></span>
</div>
<br>
<div class="form-group">
<input type="submit" id="submit" class="btn btn-success">
</div>
</form>
</div>
</div>
</div>
</body>
</html>