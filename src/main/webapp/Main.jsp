<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
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
<header>
<a href="signup.jsp">Signup</a> || <a href="signin.jsp">Signin</a> || <a href="Main.jsp">Home</a>
</header>
</body>

</html>