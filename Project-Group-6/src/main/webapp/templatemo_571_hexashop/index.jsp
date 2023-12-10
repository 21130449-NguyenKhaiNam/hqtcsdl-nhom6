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

<title>Cửa hàng</title>


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
<%
Account ac = (Account) request.getSession().getAttribute("account");
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
							<li class="scroll-to-section"><a href="#"><img alt="" src="assets/images/cart.png">0</a></li>
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
	<div class="main-banner" id="top">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6">
					<div class="left-content">
						<div class="thumb">
							<div class="inner-content">
								<h4>Chúng tôi là group 6</h4>
								<span>Awesome, clean &amp; creative HTML5 Template</span>
								<div class="main-border-button">
									<a href="#">Purchase Now!</a>
								</div>
							</div>
							<img src="assets/images/left-banner-image.jpg" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="right-content">
						<div class="row">
							<div class="col-lg-6">
								<div class="right-first-image">
									<div class="thumb">
										<div class="inner-content">
											<h4>Bàn ghế</h4>
											<span>Sản phẩm bàn ghế tốt nhất</span>
										</div>
										<div class="hover-content">
											<div class="inner">
												<h4>Gia công tại xưởng</h4>
												<p>Chúng tôi bảo hành tới trọn đời</p>
												<div class="main-border-button">
													<a href="#">Tìm hiểu thêm</a>
												</div>
											</div>
										</div>
										<img src="assets/images/baner-right-image-01.jpg">
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="right-first-image">
									<div class="thumb">
										<div class="inner-content">
											<h4>Bàn tủ</h4>
											<span>Đảm bảo chất lượng</span>
										</div>
										<div class="hover-content">
											<div class="inner">
												<h4>Bàn tủ</h4>
												<p>Chúng tôi luôn đặt chữ tín lên hàng đầu</p>
												<div class="main-border-button">
													<a href="#">Tìm hiểu thêm</a>
												</div>
											</div>
										</div>
										<img src="assets/images/baner-right-image-02.jpg">
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="right-first-image">
									<div class="thumb">
										<div class="inner-content">
											<h4>Sản phẩm an toàn</h4>
											<span>Chất lượng sản phẩm có giấy chứng nhận</span>
										</div>
										<div class="hover-content">
											<div class="inner">
												<h4>Sản phẩm an toàn</h4>
												<p>Được cấp giấy do bộ kiểm định.</p>
												<div class="main-border-button">
													<a href="#">Tìm hiểu thêm</a>
												</div>
											</div>
										</div>
										<img src="assets/images/baner-right-image-03.jpg">
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="right-first-image">
									<div class="thumb">
										<div class="inner-content">
											<h4>Nhận gia công</h4>
											<span>Chúng tôi nhận gia công mọi sản phẩm</span>
										</div>
										<div class="hover-content">
											<div class="inner">
												<h4>Nhận gia công</h4>
												<p>Liên hệ ngay với chúng tôi</p>
												<div class="main-border-button">
													<a href="#">Tìm hiểu thêm</a>
												</div>
											</div>
										</div>
										<img src="assets/images/baner-right-image-04.jpg">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Main Banner Area End ***** -->

	<!-- ***** Bàn tủ Area Starts ***** -->
	<section class="section" id="men">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section-heading">
						<h2>Bàn ghế mới nhất</h2>
						<span>Bàn ghế đẹp, nhiều mẫu mã đa dạng loại</span>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="men-item-carousel">
						<div class="owl-men-item owl-carousel">
							<div class="item">
								<div class="thumb">
									<div class="hover-content">
										<ul>
											<li><a href="single-product.jsp"><i
													class="fa fa-eye"></i></a></li>
											<li><a href="single-product.jsp"><i
													class="fa fa-star"></i></a></li>
											<li><a href="single-product.jsp"><i
													class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<img src="assets/images/men-01.jpg" alt="">
								</div>
								<div class="down-content">
									<h4>Cho nhà ở</h4>
									<span>$120.00</span>
									<ul class="stars">
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
									</ul>
								</div>
							</div>
							<div class="item">
								<div class="thumb">
									<div class="hover-content">
										<ul>
											<li><a href="single-product.jsp"><i
													class="fa fa-eye"></i></a></li>
											<li><a href="single-product.jsp"><i
													class="fa fa-star"></i></a></li>
											<li><a href="single-product.jsp"><i
													class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<img src="assets/images/men-02.jpg" alt="">
								</div>
								<div class="down-content">
									<h4>Cho phòng bếp</h4>
									<span>$90.00</span>
									<ul class="stars">
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
									</ul>
								</div>
							</div>
							<div class="item">
								<div class="thumb">
									<div class="hover-content">
										<ul>
											<li><a href="single-product.jsp"><i
													class="fa fa-eye"></i></a></li>
											<li><a href="single-product.jsp"><i
													class="fa fa-star"></i></a></li>
											<li><a href="single-product.jsp"><i
													class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<img src="assets/images/men-03.jpg" alt="">
								</div>
								<div class="down-content">
									<h4>Mọi không gian</h4>
									<span>$150.00</span>
									<ul class="stars">
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
									</ul>
								</div>
							</div>
							<div class="item">
								<div class="thumb">
									<div class="hover-content">
										<ul>
											<li><a href="single-product.jsp"><i
													class="fa fa-eye"></i></a></li>
											<li><a href="single-product.jsp"><i
													class="fa fa-star"></i></a></li>
											<li><a href="single-product.jsp"><i
													class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<img src="assets/images/men-01.jpg" alt="">
								</div>
								<div class="down-content">
									<h4>Cho nhà ở</h4>
									<span>$120.00</span>
									<ul class="stars">
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ***** Bàn tủ Area Ends ***** -->

	<!-- ***** Sản phẩm an toàn Area Starts ***** -->
	<section class="section" id="kids">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section-heading">
						<h2>Nhập khẩu mới nhất</h2>
						<span>Hàng ngoại tốt nhất</span>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="kid-item-carousel">
						<div class="owl-kid-item owl-carousel">
							<div class="item">
								<div class="thumb">
									<div class="hover-content">
										<ul>
											<li><a href="single-product.jsp"><i
													class="fa fa-eye"></i></a></li>
											<li><a href="single-product.jsp"><i
													class="fa fa-star"></i></a></li>
											<li><a href="single-product.jsp"><i
													class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<img src="assets/images/kid-01.jpg" alt="">
								</div>
								<div class="down-content">
									<h4>Nhập khẩu từ mỹ</h4>
									<span>$80.00</span>
									<ul class="stars">
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
									</ul>
								</div>
							</div>
							<div class="item">
								<div class="thumb">
									<div class="hover-content">
										<ul>
											<li><a href="single-product.jsp"><i
													class="fa fa-eye"></i></a></li>
											<li><a href="single-product.jsp"><i
													class="fa fa-star"></i></a></li>
											<li><a href="single-product.jsp"><i
													class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<img src="assets/images/kid-02.jpg" alt="">
								</div>
								<div class="down-content">
									<h4>Xuất xứ tại Việt</h4>
									<span>$12.00</span>
									<ul class="stars">
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
									</ul>
								</div>
							</div>
							<div class="item">
								<div class="thumb">
									<div class="hover-content">
										<ul>
											<li><a href="single-product.jsp"><i
													class="fa fa-eye"></i></a></li>
											<li><a href="single-product.jsp"><i
													class="fa fa-star"></i></a></li>
											<li><a href="single-product.jsp"><i
													class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<img src="assets/images/kid-03.jpg" alt="">
								</div>
								<div class="down-content">
									<h4>Tại Đài Loan</h4>
									<span>$30.00</span>
									<ul class="stars">
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
									</ul>
								</div>
							</div>
							<div class="item">
								<div class="thumb">
									<div class="hover-content">
										<ul>
											<li><a href="single-product.jsp"><i
													class="fa fa-eye"></i></a></li>
											<li><a href="single-product.jsp"><i
													class="fa fa-star"></i></a></li>
											<li><a href="single-product.jsp"><i
													class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<img src="assets/images/kid-01.jpg" alt="">
								</div>
								<div class="down-content">
									<h4>Cho nhà ở</h4>
									<span>$120.00</span>
									<ul class="stars">
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
										<li><i class="fa fa-star"></i></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ***** Sản phẩm an toàn Area Ends ***** -->

	<!-- ***** Explore Area Starts ***** -->
	<section class="section" id="explore">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="left-content">
						<h2>Về sản phẩm của chúng tôi</h2>
						<span>Khám Phá Sự Tinh Tế trong Từng Sản Phẩm Của Chúng Tôi
							🌟 <br> Chúng tôi, đội ngũ Group 6, xin hân hạnh giới thiệu
							đến quý khách hàng những sản phẩm nội thất độc đáo và sang trọng
							nhất, mang đến cho không gian sống của bạn sự tinh tế và phong
							cách đẳng cấp.
						</span>
						<div class="quote">
							<i class="fa fa-quote-left"></i>
							<p>"Chấp cánh ước mơ với nội thất đẳng cấp - Nơi Tinh Tế Gặp
								Gỡ Chất Lượng!"</p>
						</div>
						<p>Phụ Kiện Nội Thất Tinh Tế 🌟 Bộ sưu tập phụ kiện nội thất
							của chúng tôi không chỉ là điểm nhấn tinh tế mà còn là cách hoàn
							thiện mỗi không gian. Với từng chi tiết nhỏ nhất, chúng tôi chắc
							chắn sẽ làm hài lòng cả những khách hàng khó tính nhất.</p>
						<p>Sofa và Bàn Kết Hợp Hài Hòa 🛋️ Sự thoải mái và phong cách
							hòa quyện trong từng chiếc sofa và bàn của chúng tôi. Với sự đa
							dạng về kiểu dáng và chất liệu, từ sofa da cao cấp đến sofa vải
							mềm mại, chúng tôi cam kết đem đến sự thoải mái tối đa và tạo
							điểm nhấn cho không gian của bạn.</p>
						<div class="main-border-button">
							<a href="products.jsp">Tìm hiểu thêm</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="right-content">
						<div class="row">
							<div class="col-lg-6">
								<div class="leather">
									<h4>Phòng ngủ</h4>
									<span>Giúp bạn vui hơn sau ngày dài</span>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="first-image">
									<img src="assets/images/explore-image-01.jpg" alt="">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="second-image">
									<img src="assets/images/explore-image-02.jpg" alt="">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="types">
									<h4>Phòng khách</h4>
									<span>Tự tin hơn trong các cuộc tại gia</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ***** Explore Area Ends ***** -->

	<!-- ***** Social Area Starts ***** -->
	<section class="section" id="social">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-heading">
						<h2>Sản phẩm nổi bật</h2>
						<span>Chúng tôi có mặt ở mọi nền tảng.</span>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row images">
				<div class="col-2">
					<div class="thumb">
						<div class="icon">
							<a href="http://instagram.com">
								<h6>Fashion</h6> <i class="fa fa-instagram"></i>
							</a>
						</div>
						<img src="assets/images/instagram-01.jpg" alt="">
					</div>
				</div>
				<div class="col-2">
					<div class="thumb">
						<div class="icon">
							<a href="http://instagram.com">
								<h6>New</h6> <i class="fa fa-instagram"></i>
							</a>
						</div>
						<img src="assets/images/instagram-02.jpg" alt="">
					</div>
				</div>
				<div class="col-2">
					<div class="thumb">
						<div class="icon">
							<a href="http://instagram.com">
								<h6>Brand</h6> <i class="fa fa-instagram"></i>
							</a>
						</div>
						<img src="assets/images/instagram-03.jpg" alt="">
					</div>
				</div>
				<div class="col-2">
					<div class="thumb">
						<div class="icon">
							<a href="http://instagram.com">
								<h6>Makeup</h6> <i class="fa fa-instagram"></i>
							</a>
						</div>
						<img src="assets/images/instagram-04.jpg" alt="">
					</div>
				</div>
				<div class="col-2">
					<div class="thumb">
						<div class="icon">
							<a href="http://instagram.com">
								<h6>Leather</h6> <i class="fa fa-instagram"></i>
							</a>
						</div>
						<img src="assets/images/instagram-05.jpg" alt="">
					</div>
				</div>
				<div class="col-2">
					<div class="thumb">
						<div class="icon">
							<a href="http://instagram.com">
								<h6>Bag</h6> <i class="fa fa-instagram"></i>
							</a>
						</div>
						<img src="assets/images/instagram-06.jpg" alt="">
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ***** Social Area Ends ***** -->

	<!-- ***** Subscribe Area Starts ***** -->
	<div class="subscribe">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="section-heading">
						<h2>Nếu là người mới chúng tôi sẽ tặng bạn 30%</h2>
						<span>Hãy gửi email của bạn đẻ chúng tôi tặng bạn phiếu
							giảm nhé.</span>
					</div>
					<form id="subscribe" action="" method="get">
						<div class="row">
							<div class="col-lg-5">
								<fieldset>
									<input name="name" type="text" id="name"
										placeholder="Your Name" required="">
								</fieldset>
							</div>
							<div class="col-lg-5">
								<fieldset>
									<input name="email" type="text" id="email"
										pattern="[^ @]*@[^ @]*" placeholder="Your Email Address"
										required="">
								</fieldset>
							</div>
							<div class="col-lg-2">
								<fieldset>
									<button type="submit" id="form-submit" class="main-dark-button">
										<i class="fa fa-paper-plane"></i>
									</button>
								</fieldset>
							</div>
						</div>
					</form>
				</div>
				<div class="col-lg-4">
					<div class="row">
						<div class="col-6">
							<ul>
								<li>Store Location:<br> <span>Sunny Isles
										Beach, FL 33160, United States</span></li>
								<li>Phone:<br> <span>010-020-0340</span></li>
								<li>Office Location:<br> <span>North Miami
										Beach</span></li>
							</ul>
						</div>
						<div class="col-6">
							<ul>
								<li>Work Hours:<br> <span>07:30 AM - 9:30 PM
										Daily</span></li>
								<li>Email:<br> <span>info@company.com</span></li>
								<li>Social Media:<br> <span><a href="#">Facebook</a>,
										<a href="#">Instagram</a>, <a href="#">Behance</a>, <a
										href="#">Linkedin</a></span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Subscribe Area Ends ***** -->

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
						<li><a href="#">Nhập khẩu Shopping</a></li>
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