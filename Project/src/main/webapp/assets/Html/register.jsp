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
    <title>Đăng ký</title>
  <link rel="stylesheet" href="../Style/style.css">
  <link rel="stylesheet" href="../Style/form.css">
</head>
<body>
<div id="app">
  <div class="container">
    <div class="form-login">
      <h3 class="form-login_header">Đăng ký tài khoản</h3>
      <form class="infor">
        <div class="infor_name">
          <input type="hidden" name="action" value="name">
          <input class="input_name" type="text">
          <label class="infor_label-name">Họ và tên</label>
        </div>
        <div class="infor_tele">
          <input type="hidden" name="action" value="tele">
          <input class="input_tele" type="tel">
          <label class="infor_label-tele">Số điện thoại</label>
        </div>
        <div class="infor_password">
          <input type="hidden" name="action" value="password">
          <input class="input_password" type="password">
          <label class="infor_label-password">Mật khẩu</label>
        </div>
        <div class="infor_password">
          <input type="hidden" name="action" value="password">
          <input class="input_password" type="password">
          <label class="infor_label-password">Nhập lại mật khẩu</label>
        </div>
      </form>
      <div class="form-policy">
        <label for="">
          <input type="checkbox" name="" id="">
        </label>
        <p>
          Bằng việc Đăng ký, bạn đã đọc và đồng ý với Điều khoản sử dụng và Chính sách bảo mật của
        </p>
      </div>
      <button class="register-btn">Đăng ký</button>
      <p class="form-note">
        Đã có tài khoản?
        <a href="">Đăng nhập ngay</a>
      </p>
    </div>
  </div>
</div>
</body>
</html>
