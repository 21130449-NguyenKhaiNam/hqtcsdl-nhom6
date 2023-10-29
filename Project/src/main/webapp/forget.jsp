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
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="./Style/style.css">
    <link rel="stylesheet" href="./Style/form.css">
</head>
<body>
<div id="app">
    <div class="container">
        <div class="form-login">
            <h3 class="form-login_header">Quên mật khẩu</h3>
            <form class="infor">
                <div class="infor_tele">
                    <input type="hidden" name="action" value="tele">
                    <input class="input_tele" type="tel">
                    <label class="infor_label-tele">Nhập số điện thoại đã đăng ký</label>
                </div>
            </form>
            <button class="forget-btn">Quên mật khẩu</button>
        </div>
    </div>
</div>
</body>
</html>
