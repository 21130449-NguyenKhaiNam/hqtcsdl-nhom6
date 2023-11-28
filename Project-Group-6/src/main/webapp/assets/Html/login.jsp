<%--
  Created by IntelliJ IDEA.
  User: Welcome
  Date: 10/29/2023
  Time: 10:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../Style/style.css">
    <link rel="stylesheet" href="../Style/form.css">
</head>
<body>
<div id="app">
    <div class="container">
        <div class="form-login">
            <h3 class="form-login_header">Đăng nhập</h3>
            <form class="infor" action="../../access" method="post">
                    <input type="hidden" name="action" value="sign-in">
                <div class="infor_tele">
                    <input class="input_tele" name="tel" type="tel" required>
                    <label class="infor_label-tele">Số điện thoại</label>
                </div>
                <div class="infor_password">
                    <input class="input_password" name="pass" type="password" required>
                    <label class="infor_label-password">Mật khẩu</label>
                </div>
                <a href="#" class="reset-password">Quên mật khẩu</a>
                <button class="login-btn">Đăng nhập</button>
            </form>
            
            <p class="form-note">
                Chưa có tài khoản?
                <a href="#">Đăng ký tài khoản mới</a>
            </p>
        </div>
    </div>
</div>
</body>
</html>
