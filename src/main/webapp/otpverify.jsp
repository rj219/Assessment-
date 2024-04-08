<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OTP verification</title>
</head>
<body>
	<span>${err}</span>
	<form action="otpverify" method="post">
	<input type="text" name="otp" placeholder="enter otp">
	<input type="submit">
	</form>
</body>
</html>