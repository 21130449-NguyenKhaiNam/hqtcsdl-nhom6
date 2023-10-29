<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 29/10/2023
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="assets/Style/style.css">

</head>
<body>
<header id="header"></header>
<!--Main content-->
<main id="main">
    <div class="container-lg">
        <div class="row">

            <!--List service-->
            <div class="col-xl-3">
                <ul class="list-function">
                    <li class="item-function">
                        <input type="radio" name="userFunction" id="user-infor_function" checked>
                        <label for="user-infor_function">Thông tin tài khoản</label>
                    </li>
                    <li class="item-function">
                        <input type="radio" name="userFunction" id="user-setting_function">
                        <label for="user-setting_function"> Cài đặt tài khoản</label>
                    </li>
                </ul>
            </div>

            <div id="per-form" class="col-xl-6">
                <!--personal information-->
                <div id="personal-information-form" class="">
                    <div class="wrapper">
                        <h3 class="form-title">Hồ sơ cá nhân</h3>
                        <div class="user-infor">
                            <form method="post" class="row">

                                <div class="col-md-6 col-sm-12 mb-3">
                                    <div class="form-floating">
                                        <input class="form-control" type="text" name="userName" id="user-name" placeholder="username">
                                        <label for="user-name">Tên người dùng</label>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12 mb-3">
                                    <div class="form-floating">
                                        <input class="form-control" type="text" name="phoneNumber" id="phone-number" placeholder="phonenumber">
                                        <label for="phone-number">Số điện thoại</label>
                                    </div>
                                </div>

                                <div class="col-12 mb-3">
                                    <div class="form-floating">
                                        <input type="email" name="userEmail" class="form-control is-invalid" id="user-email" placeholder="name@example.com">
                                        <label for="user-email">Email</label>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12 mb-3">
                                    <div class="form-floating">
                                        <select class="form-select" id="gender">
                                            <option value="male">Nam</option>
                                            <option value="female">Nữ</option>
                                            <option value="others">Khác</option>
                                        </select>
                                        <label for="gender">Giới tính</label>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12 mb-3">
                                    <div class="form-floating">
                                        <input type="date" name="birthDate" class="form-control" id="birthdate" placeholder="birthdate">
                                        <label for="birthdate">Ngày sinh</label>
                                    </div>
                                </div>

                                <div class="col-12 mb-3">
                                    <div class="form-floating">
                                        <input type="text" name="address" class="form-control" id="address" placeholder="address">
                                        <label for="address">Địa chỉ nhận hàng</label>
                                    </div>
                                </div>
                                <div class="col-12 mb-3">
                                    <button type="submit" class="bg-origin col-3">Lưu thay đổi</button>
                                </div>



                            </form>
                        </div>
                    </div>
                </div>

                <!--user-setting-->
                <div id="user-setting_form" class="d-none">
                    <div class="wrapper">

                        <h3 class="form-title">Thay đổi mật khẩu</h3>

                        <div class="user-setting_form">

                            <form action="">
                                <div class="form-floating col-12 mb-3">
                                    <input type="password" class="form-control " id="current-password" placeholder="Password">
                                    <label for="current-password">Mật khẩu hiện tại</label>
                                </div>

                                <div class="form-floating col-12 mb-3">
                                    <input type="password" class="form-control " id="new-password" placeholder="Password">
                                    <label for="new-password">Mật khẩu mới</label>
                                </div>

                                <div class="form-floating col-12 mb-3">
                                    <input type="password" class="form-control " id="repeat-new_password" placeholder="Password">
                                    <label for="repeat-new_password">Nhập lại mật khẩu mới</label>
                                </div>

                                <div class="col-12 mb-3 ">
                                    <button id="btn-change_password" type="submit" class="bg-origin col-3 disabled" disabled >Lưu thay đổi</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<footer id="footer"></footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<script src="assets/JavaScript/app.js"></script>
</body>
</html>
