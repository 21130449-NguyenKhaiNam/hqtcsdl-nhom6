<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/general/logo.png" type="../image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="../Style/header.css">
<link rel="stylesheet" href="../Style/index.css">
<title>Header</title>
</head>
<%@ page import="model.Account"%>
<%
Account ac = (Account) request.getSession().getAttribute("account");
%>

<body>
	<div class="header">
		<a href="../Html/productDetail.jsp" class="logo_page"><img
			src="../Image/general/logo.png" alt=""></a>

		<%
		if (ac == null) {
		%>
		<!-- phần đăng nhập hoặc đăng ký của header -->
		<div class="header_login_signin">
			<a href="login.jsp" class="log_in">Đăng nhập</a>
			<div class="line"></div>
			<a href="register.jsp" class="sign_in">Đăng ký</a>
		</div>
		<%
		} else {
		%>
		<div class="header_login_signin">
			<span class="text-white">Xin chào, <span> <%= ac.getFullName() %> </span> </span>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>