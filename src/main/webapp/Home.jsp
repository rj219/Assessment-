<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
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
<%
String name = (String)session.getAttribute("name");
if(name==null)
{
	request.setAttribute("err", "Login First...!!");
	request.getRequestDispatcher("signin.jsp").forward(request, response);
}
%>
<h1>Welcome</h1>
<h2>${name}</h2>
<a href="signup.jsp">Signup</a> || <a href="signin.jsp">Signin</a> || <a href="Main.jsp">Home</a>
<a href="details">Details</a>
</body>
</html>