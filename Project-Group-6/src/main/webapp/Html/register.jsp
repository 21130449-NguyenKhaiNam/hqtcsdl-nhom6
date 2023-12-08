<%--
  Created by IntelliJ IDEA.
  User: Welcome
  Date: 10/29/2023
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Đăng ký</title>
<link rel="stylesheet" href="../Style/style.css">
<link rel="stylesheet" href="../Style/form.css">
</head>
<%
String status = (String) request.getParameter("status");
String note = "";
if (status != null) {
	switch (status) {
	case "failed-0":
		note = "Sai thông tin đăng ký";
		break;
	case "failed":
		note = "Đăng ký không thành công";
		break;
	default:
		break;
	}
} else {
	note = "";
}
%>

<body>
	<div id="app">
		<div class="container">
			<div class="form-login">
				<h3 class="form-login_header">Đăng ký tài khoản</h3>
				<form class="infor" action="../Html/access" method="post">
					<span class="text-danger text-justify"><%=note%></span> <input
						type="hidden" name="action" value="register">
					<div class="infor_name">
						<input class="input_name" type="text" name="name" required>
						<label class="infor_label-name">Họ và tên</label>
					</div>
					<div class="infor_tele">
						<input class="input_tele" type="tel" name="tel"> <label
							class="infor_label-tele" required>Số điện thoại</label>
					</div>
					<div class="infor_password">
						<input class="input_password" type="password" name="pass">
						<label class="infor_label-password" required>Mật khẩu</label>
					</div>
					<div class="infor_password">
						<input class="input_password" type="password" name="rePass">
						<label class="infor_label-password" required>Nhập lại mật
							khẩu</label>
					</div>
					<div class="form-policy">
						<p>Bằng việc tiếp tục, bạn đã đọc và đồng ý với Điều khoản sử
							dụng và Chính sách bảo mật của</p>
					</div>
					<button class="register-btn">Đăng ký</button>
					<p class="form-note">
						Đã có tài khoản? <a href="login.jsp">Đăng nhập ngay</a>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
