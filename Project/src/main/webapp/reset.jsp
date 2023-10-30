<%--
  Created by IntelliJ IDEA.
  User: Welcome
  Date: 10/29/2023
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đặt lại mật khẩu</title>
    <link rel="stylesheet" href="./Style/style.css">
    <link rel="stylesheet" href="./Style/form.css">
</head>
<body>
<div id="app">
    <div class="container">
        <div class="form-login">
            <h3 class="form-login_header">Đặt lại mật khẩu</h3>
            <form class="infor">
                <div class="infor_new-password">
                    <input type="hidden" name="action" value="password">
                    <input class="input_password" type="password" required>
                    <label class="infor_label-password">Nhập mật khẩu mới</label>
                </div>
                <div class="infor_confirm-password">
                    <input type="hidden" name="action" value="password">
                    <input class="input_password" type="password" required>
                    <label class="infor_label-password">Nhập lại mật khẩu</label>
                </div>
            </form>
            <button class="reset-btn">Đặt lại mật khẩu</button>
        </div>
    </div>
</div>
</body>
</html>
