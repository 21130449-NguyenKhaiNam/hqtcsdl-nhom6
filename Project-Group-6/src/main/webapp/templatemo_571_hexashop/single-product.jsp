<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<title>Hexashop - Product Detail Page</title>


<!-- Additional CSS Files -->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="assets/css/font-awesome.css">

<link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

<link rel="stylesheet" href="assets/css/owl-carousel.css">

<link rel="stylesheet" href="assets/css/lightbox.css">
<!--

TemplateMo 571 Hexashop

https://templatemo.com/tm-571-hexashop

-->
</head>
<%@ page import="model.Account"%>
<%@ page import="model.Cart"%>
<%@ page import="model.Product"%>
<%
Account ac = (Account) request.getSession().getAttribute("account");
Cart cart = (Cart) request.getSession().getAttribute("cart");
Product p = (Product) request.getAttribute("single-product");
if (cart == null) {
	cart = new Cart(ac);
	request.getSession().setAttribute("cart", cart);
}
%>

<body>
	<!-- ***** Preloader Start ***** -->
	<div id="preloader">
		<div class="jumper">
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->


	<!-- ***** Header Area Start ***** -->
	<header class="header-area header-sticky">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">
						<!-- ***** Logo Start ***** -->
						<a href="index.jsp" class="logo"> <img
							src="assets/images/logo.png">
						</a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Menu Start ***** -->
						<ul class="nav">
							<li class="scroll-to-section"><a href="#top" class="active">Trang
									chủ</a></li>
							<li class="scroll-to-section"><a
								href="../browny-v1.0/index.jsp">Giới thiệu</a></li>
							<li class="submenu"><a href="javascript:;">Các trang</a>
								<ul>
									<li><a href="../browny-v1.0/index.jsp">Về chúng tôi</a></li>
									<li><a href="products.jsp">Sản phẩm</a></li>
									<li><a href="contact.jsp">Liên lạc</a></li>
								</ul></li>
							<li class="scroll-to-section"><a href="#explore">Các sản
									phẩm mới</a></li>
							<%
							if (ac == null) {
							%>
							<li class="scroll-to-section"><a
								href="../login-form-20/index.jsp">Đăng nhập</a></li>
							<%
							} else {
							%>
							<li class="scroll-to-section"><a href="#"><%=ac.getFullName()%></a></li>
							<%
							}
							%>
							<li class="scroll-to-section"><a href="#"><img alt=""
									src="assets/images/cart.png"><%=cart.getSize()%></a></li>
						</ul>
						<a class='menu-trigger'> <span>Danh mục</span>
						</a>
						<!-- ***** Menu End ***** -->
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- ***** Header Area End ***** -->

	<!-- ***** Main Banner Area Start ***** -->
	<div class="page-heading" id="top">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="inner-content">
						<h2>Chi tiết sản phẩm</h2>
						<span>Uy tín làm nên thương hiệu</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Main Banner Area End ***** -->


	<!-- ***** Product Area Starts ***** -->
	<section class="section" id="product">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="left-images">
						<img src="<%= p.getPath() %>" alt=""> <img
							src="<%= p.getPath() %>" alt="">
					</div>
				</div>
				<div class="col-lg-4">
					<div class="right-content">
						<h4><%= p.getName() %></h4>
						<span class="price"><%= p.getPrice() %> VND</span>
						<ul class="stars">
							<li><i class="fa fa-star"></i></li>
							<li><i class="fa fa-star"></i></li>
							<li><i class="fa fa-star"></i></li>
							<li><i class="fa fa-star"></i></li>
							<li><i class="fa fa-star"></i></li>
						</ul>
						<span>Sản phẩm đảm bảo được giao ngay trong ngày.</span>
						<div class="quote">
							<i class="fa fa-quote-left"></i>
							<p>Thời hạn đổi trả trong trọn đời</p>
						</div>
						<div class="quantity-content">
							<div class="left-content">
								<h6>No. of Orders</h6>
							</div>
							<div class="right-content">
								<div class="quantity buttons_added">
									<input type="button" value="-" class="minus"><input
										type="number" step="1" min="1" max="" name="quantity"
										value="1" title="Qty" class="input-text qty text" size="4"
										pattern="" inputmode=""><input type="button" value="+"
										class="plus">
								</div>
							</div>
						</div>
						<div class="total">
							<h4>Total:<span><%= p.getPrice() %> / 1 sản phẩm</span></h4>
							<div class="main-border-button">
								<a href="cart?product1=<%= p.getId() %>">Thêm vào giỏ hàng</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ***** Product Area Ends ***** -->

	<!-- ***** Footer Start ***** -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="first-item">
						<div class="logo">
							<img src="assets/images/white-logo.png"
								alt="hexashop ecommerce templatemo">
						</div>
						<ul>
							<li><a href="#">16501 Collins Ave, Sunny Isles Beach, FL
									33160, United States</a></li>
							<li><a href="#">hexashop@company.com</a></li>
							<li><a href="#">010-020-0340</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3">
					<h4>Shopping &amp; Categories</h4>
					<ul>
						<li><a href="#">Men’s Shopping</a></li>
						<li><a href="#">Women’s Shopping</a></li>
						<li><a href="#">Kid's Shopping</a></li>
					</ul>
				</div>
				<div class="col-lg-3">
					<h4>Useful Links</h4>
					<ul>
						<li><a href="#">Homepage</a></li>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Help</a></li>
						<li><a href="#">Contact Us</a></li>
					</ul>
				</div>
				<div class="col-lg-3">
					<h4>Help &amp; Information</h4>
					<ul>
						<li><a href="#">Help</a></li>
						<li><a href="#">FAQ's</a></li>
						<li><a href="#">Shipping</a></li>
						<li><a href="#">Tracking ID</a></li>
					</ul>
				</div>
				<div class="col-lg-12">
					<div class="under-footer">
						<p>
							Copyright © 2022 HexaShop Co., Ltd. All Rights Reserved. <br>Design:
							<a href="https://templatemo.com" target="_parent"
								title="free css templates">TemplateMo</a>
						</p>
						<ul>
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
							<li><a href="#"><i class="fa fa-behance"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>


	<!-- jQuery -->
	<script src="assets/js/jquery-2.1.0.min.js"></script>

	<!-- Bootstrap -->
	<script src="assets/js/popper.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>

	<!-- Plugins -->
	<script src="assets/js/owl-carousel.js"></script>
	<script src="assets/js/accordions.js"></script>
	<script src="assets/js/datepicker.js"></script>
	<script src="assets/js/scrollreveal.min.js"></script>
	<script src="assets/js/waypoints.min.js"></script>
	<script src="assets/js/jquery.counterup.min.js"></script>
	<script src="assets/js/imgfix.min.js"></script>
	<script src="assets/js/slick.js"></script>
	<script src="assets/js/lightbox.js"></script>
	<script src="assets/js/isotope.js"></script>
	<script src="assets/js/quantity.js"></script>

	<!-- Global Init -->
	<script src="assets/js/custom.js"></script>

	<script>
		$(function() {
			var selectedClass = "";
			$("p").click(function() {
				selectedClass = $(this).attr("data-rel");
				$("#portfolio").fadeTo(50, 0.1);
				$("#portfolio div").not("." + selectedClass).fadeOut();
				setTimeout(function() {
					$("." + selectedClass).fadeIn();
					$("#portfolio").fadeTo(50, 1);
				}, 500);

			});
		});
	</script>
</body>
</html>