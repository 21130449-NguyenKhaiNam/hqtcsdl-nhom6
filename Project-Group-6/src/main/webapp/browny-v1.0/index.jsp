<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- meta data -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!--font-family-->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&amp;subset=devanagari,latin-ext"
	rel="stylesheet">

<!-- title of site -->
<title>About</title>

<!-- For favicon png -->
<link rel="shortcut icon" type="image/icon"
	href="assets/logo/favicon.png" />

<!--font-awesome.min.css-->
<link rel="stylesheet" href="assets/css/font-awesome.min.css">

<!--flat icon css-->
<link rel="stylesheet" href="assets/css/flaticon.css">

<!--animate.css-->
<link rel="stylesheet" href="assets/css/animate.css">

<!--owl.carousel.css-->
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/owl.theme.default.min.css">

<!--bootstrap.min.css-->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<!-- bootsnav -->
<link rel="stylesheet" href="assets/css/bootsnav.css">

<!--style.css-->
<link rel="stylesheet" href="assets/css/style.css">

<!--responsive.css-->
<link rel="stylesheet" href="assets/css/responsive.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

</head>

<%@ page import="model.Account"%>
<%
Account ac = (Account) request.getSession().getAttribute("account");
%>

<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- top-area Start -->
	<header class="top-area">
		<div class="header-area">
			<!-- Start Navigation -->
			<nav
				class="navbar navbar-default bootsnav navbar-fixed dark no-background">

				<div class="container">

					<!-- Start Header Navigation -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#navbar-menu">
							<i class="fa fa-bars"></i>
						</button>
						<a class="navbar-brand" href="index.jsp">Group 6</a>
					</div>
					<!--/.navbar-header-->
					<!-- End Header Navigation -->

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse menu-ui-design"
						id="navbar-menu">
						<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
							data-out="fadeOutUp">
							<li class=" smooth-menu active"></li>
							<li class="smooth-menu"><a href="#education">Hành trình</a></li>
							<li class="smooth-menu"><a href="#skills">Đánh giá</a></li>
							<li class="smooth-menu"><a href="#experience">Chứng nhận</a></li>
							<li class="smooth-menu"><a href="#portfolio">Sản phẩm</a></li>
							<li class="smooth-menu"><a href="#clients">Chính sách</a></li>
							<li class="smooth-menu"><a href="#contact">Liên hệ</a></li>
							<%
							if (ac == null) {
							%>
							<li><a href="../login-form-20/index.jsp">Đăng nhập</a></li>
							<%
							} else {
							%>
							<li><a href="#"><%=ac.getFullName()%></a></li>
							<%
							}
							%>
						</ul>
						<!--/.nav -->
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!--/.container-->
			</nav>
			<!--/nav-->
			<!-- End Navigation -->
		</div>
		<!--/.header-area-->

		<div class="clearfix"></div>

	</header>
	<!-- /.top-area-->
	<!-- top-area End -->

	<!--welcome-hero start -->
	<section id="welcome-hero" class="welcome-hero">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<div class="header-text">
						<h2>
							Xin chào <span>,</span> chúng tôi là <br> group 6 <br>
							một cửa hàng chuyên về bàn ghế <span>.</span>
						</h2>
						<p>Chất lượng và Phong cách, Mua Sắm Bàn Ghế Tại Đây!</p>
						<a href="assets/download/browney.txt" download>Truy cập cửa
							hàng</a>
					</div>
					<!--/.header-text-->
				</div>
				<!--/.col-->
			</div>
			<!-- /.row-->
		</div>
		<!-- /.container-->

	</section>
	<!--/.welcome-hero-->
	<!--welcome-hero end -->

	<!--about start -->
	<section id="about" class="about">
		<div class="section-heading text-center">
			<h2>Về chúng tôi</h2>
		</div>
		<div class="container">
			<div class="about-content">
				<div class="row">
					<div class="col-sm-6">
						<div class="single-about-txt">
							<h3>
								Chào mừng đến với Group 6 - Nơi Tinh Tế Cho Sự Nghệ Thuật Nội
								Thất! <br> 🌟 Chất Lượng Vượt Trội: Tại Group 6, chúng tôi
								tự hào cung cấp những sản phẩm bàn ghế với chất lượng tốt nhất,
								được chọn lựa cẩn thận để đáp ứng mọi tiêu chuẩn khắt khe về độ
								bền và thiết kế. <br> 🌈 Đa Dạng Phong Cách: Bạn đang tìm
								kiếm bàn ghế hiện đại, cổ điển, hoặc nét đặc trưng riêng biệt?
								Chúng tôi có sự đa dạng về phong cách để đáp ứng mọi sở thích và
								nhu cầu trang trí của bạn.
							</h3>
							<p>
								🛋️ Sự Tận Tâm Dịch Vụ: Đội ngũ chăm sóc khách hàng của chúng
								tôi luôn sẵn lòng hỗ trợ bạn trong quá trình chọn lựa sản phẩm,
								đặt hàng và hậu mãi. Sự hài lòng của bạn là ưu tiên hàng đầu của
								chúng tôi. <br> 🌍 Giao Hàng Toàn Quốc: Dù bạn ở đâu, chúng
								tôi cam kết giao hàng nhanh chóng và an toàn đến tận cửa nhà
								bạn. Sự thuận tiện và tin cậy là cam kết của chúng tôi. <br>
								Hãy đồng hành cùng chúng tôi tại Group 6, nơi nghệ thuật gặp gỡ
								chất lượng, và không gian sống của bạn trở nên hoàn hảo hơn mỗi
								ngày!
							</p>
							<div class="row">
								<div class="col-sm-4">
									<div class="single-about-add-info">
										<h3>phone</h3>
										<p>0123-456-789</p>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="single-about-add-info">
										<h3>email</h3>
										<p>666@gmail.com</p>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="single-about-add-info">
										<h3>website</h3>
										<p>index.html</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-offset-1 col-sm-5">
						<div class="single-about-img">
							<img src="assets/images/about/profile_image.jpg"
								alt="profile_image">
							<div class="about-list-icon">
								<ul>
									<li><a href="#"> <i class="fa fa-facebook"
											aria-hidden="true"></i>
									</a></li>
									<!-- / li -->
									<li><a href="#"> <i class="fa fa-dribbble"
											aria-hidden="true"></i>
									</a></li>
									<!-- / li -->
									<li><a href="#"> <i class="fa fa-twitter"
											aria-hidden="true"></i>
									</a></li>
									<!-- / li -->
									<li><a href="#"> <i class="fa fa-linkedin"
											aria-hidden="true"></i>
									</a></li>
									<!-- / li -->
									<li><a href="#"> <i class="fa fa-instagram"
											aria-hidden="true"></i>
									</a></li>
									<!-- / li -->


								</ul>
								<!-- / ul -->
							</div>
							<!-- /.about-list-icon -->

						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/.about-->
	<!--about end -->

	<!--education start -->
	<section id="education" class="education">
		<div class="section-heading text-center">
			<h2>Hành trình</h2>
		</div>
		<div class="container">
			<div class="education-horizontal-timeline">
				<div class="row">
					<div class="col-sm-4">
						<div class="single-horizontal-timeline">
							<div class="experience-time">
								<h2>2008 - 2010</h2>
								<h3>Lên ý tưởng</h3>
							</div>
							<!--/.experience-time-->
							<div class="timeline-horizontal-border">
								<i class="fa fa-circle" aria-hidden="true"></i> <span
									class="single-timeline-horizontal"></span>
							</div>
							<div class="timeline">
								<div class="timeline-content">
									<h4 class="title">Tập trung tại HCM</h4>
									<h5>HCM, VN</h5>
									<p class="description">Tập hợp được những người cùng ý
										tưởng, lên kế hoạch và đưa ra các hướng giải quyết cũng như
										biện pháp thực hiện. Dự đoán các tình huống và chuẩn bị tinh
										thần</p>
								</div>
								<!--/.timeline-content-->
							</div>
							<!--/.timeline-->
						</div>
					</div>
					<div class="col-sm-4">
						<div class="single-horizontal-timeline">
							<div class="experience-time">
								<h2>2014 - 2018</h2>
								<h3>Hiện thực ý tưởng</h3>
							</div>
							<!--/.experience-time-->
							<div class="timeline-horizontal-border">
								<i class="fa fa-circle" aria-hidden="true"></i> <span
									class="single-timeline-horizontal"></span>
							</div>
							<div class="timeline">
								<div class="timeline-content">
									<h4 class="title">Hành trình đầy khó khăn</h4>
									<h5>north carolina, USA</h5>
									<p class="description">Mỗi cá nhân đều có công việc riêng
										và vì vậy đồ án được đặt tại Mỹ tuy nhiên mọi người đều cố
										gắng.</p>
								</div>
								<!--/.timeline-content-->
							</div>
							<!--/.timeline-->
						</div>
					</div>
					<div class="col-sm-4">
						<div class="single-horizontal-timeline">
							<div class="experience-time">
								<h2>2018 - 2023</h2>
								<h3>Thành phẩm</h3>
							</div>
							<!--/.experience-time-->
							<div class="timeline-horizontal-border">
								<i class="fa fa-circle" aria-hidden="true"></i> <span
									class="single-timeline-horizontal spacial-horizontal-line
									"></span>
							</div>
							<div class="timeline">
								<div class="timeline-content">
									<h4 class="title">Kết quả</h4>
									<h5>HCM, VN</h5>
									<p class="description">Sau khi hoàn thành các thành viên
										cùng trở về VN và tiến hành đưa dự án vào thực tế.</p>
								</div>
								<!--/.timeline-content-->
							</div>
							<!--/.timeline-->
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!--/.education-->
	<!--education end -->

	<!--skills start -->
	<section id="skills" class="skills">
		<div class="skill-content">
			<div class="section-heading text-center">
				<h2>Đánh giá từ các chuyên gia</h2>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="single-skill-content">
							<div class="barWrapper">
								<span class="progressText">Chất lượng</span>
								<div class="single-progress-txt">
									<div class="progress ">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="90" aria-valuemin="10" aria-valuemax="100"
											style=""></div>
									</div>
									<h3>90%</h3>
								</div>
							</div>
							<!-- /.barWrapper -->
							<div class="barWrapper">
								<span class="progressText">Liên kết với các doanh nghiệp</span>
								<div class="single-progress-txt">
									<div class="progress ">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="85" aria-valuemin="10" aria-valuemax="100"
											style=""></div>
									</div>
									<h3>85%</h3>
								</div>
							</div>
							<!-- /.barWrapper -->
							<div class="barWrapper">
								<span class="progressText">Khả năng thu lợi nhuận</span>
								<div class="single-progress-txt">
									<div class="progress ">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="97" aria-valuemin="10" aria-valuemax="100"
											style=""></div>
									</div>
									<h3>97%</h3>
								</div>
							</div>
							<!-- /.barWrapper -->
							<div class="barWrapper">
								<span class="progressText">Số lượng sản phẩm trên thị
									trường</span>
								<div class="single-progress-txt">
									<div class="progress ">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="90" aria-valuemin="10" aria-valuemax="100"
											style=""></div>
									</div>
									<h3>90%</h3>
								</div>
							</div>
							<!-- /.barWrapper -->
						</div>
					</div>
					<div class="col-md-6">
						<div class="single-skill-content">
							<div class="barWrapper">
								<span class="progressText">Sự phổ biến</span>
								<div class="single-progress-txt">
									<div class="progress ">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="90" aria-valuemin="10" aria-valuemax="100"
											style=""></div>
									</div>
									<h3>90%</h3>
								</div>
							</div>
							<!-- /.barWrapper -->
							<div class="barWrapper">
								<span class="progressText">Sự đa dạng sản phẩm</span>
								<div class="single-progress-txt">
									<div class="progress ">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="85" aria-valuemin="10" aria-valuemax="100"
											style=""></div>
									</div>
									<h3>85%</h3>
								</div>
							</div>
							<!-- /.barWrapper -->
							<div class="barWrapper">
								<span class="progressText">Sáng tạo</span>
								<div class="single-progress-txt">
									<div class="progress ">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="97" aria-valuemin="10" aria-valuemax="100"
											style=""></div>
									</div>
									<h3>97%</h3>
								</div>
							</div>
							<!-- /.barWrapper -->
							<div class="barWrapper">
								<span class="progressText">Khả năng xử lý hàng hóa</span>
								<div class="single-progress-txt">
									<div class="progress ">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="90" aria-valuemin="10" aria-valuemax="100"
											style=""></div>
									</div>
									<h3>90%</h3>
								</div>
							</div>
							<!-- /.barWrapper -->
						</div>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.skill-content-->

	</section>
	<!--/.skills-->
	<!--skills end -->

	<!--experience start -->
	<section id="experience" class="experience">
		<div class="section-heading text-center">
			<h2>Giấy chứng nhận</h2>
		</div>
		<div class="container">
			<div class="experience-content">
				<div class="main-timeline">
					<ul>
						<li>
							<div class="single-timeline-box fix">
								<div class="row">
									<div class="col-md-5">
										<div class="experience-time text-right">
											<h2>2018 - Giấy phép Kinh doanh</h2>
											<h3>creative director</h3>
										</div>
										<!--/.experience-time-->
									</div>
									<!--/.col-->
									<div class="col-md-offset-1 col-md-5">
										<div class="timeline">
											<div class="timeline-content">
												<h4 class="title">
													<span><i class="fa fa-circle" aria-hidden="true"></i></span>
													Giấy Phép Kinh Doanh số: 123456789 - GP/KD
												</h4>
												<h5>newyork, USA</h5>
												<p class="description">Giấy chứng nhận được cấp tại Mỹ
													và được Bộ lao động Việt Nam công nhận.</p>
											</div>
											<!--/.timeline-content-->
										</div>
										<!--/.timeline-->
									</div>
									<!--/.col-->
								</div>
							</div> <!--/.single-timeline-box-->
						</li>

						<li>
							<div class="single-timeline-box fix">
								<div class="row">
									<div
										class="col-md-offset-1 col-md-5 experience-time-responsive">
										<div class="experience-time">
											<h2>
												<span><i class="fa fa-circle" aria-hidden="true"></i></span>
												2016 - 2018
											</h2>
											<h3>associate design director</h3>
										</div>
										<!--/.experience-time-->
									</div>
									<!--/.col-->
									<div class="col-md-5">
										<div class="timeline">
											<div class="timeline-content text-right">
												<h4 class="title">Sản phẩm đảm bảo nguồn gốc, chất
													lượng</h4>
												<h5>newyork, USA</h5>
												<p class="description">Song song với quá trình xin giấy
													phép kinh doanh chúng tôi cũng đã được cấp giấy đảm bảo
													chất lượng và nguồn gốc của sản phẩm</p>
											</div>
											<!--/.timeline-content-->
										</div>
										<!--/.timeline-->
									</div>
									<!--/.col-->
									<div class="col-md-offset-1 col-md-5 experience-time-main">
										<div class="experience-time">
											<h2>
												<span><i class="fa fa-circle" aria-hidden="true"></i></span>
												2016 - 2018
											</h2>
											<h3>Chứng nhận An toàn Chất lượng Sản phẩm</h3>
										</div>
										<!--/.experience-time-->
									</div>
									<!--/.col-->
								</div>
							</div> <!--/.single-timeline-box-->
						</li>

						<li>
							<div class="single-timeline-box fix">
								<div class="row">
									<div class="col-md-5">
										<div class="experience-time text-right">
											<h2>2018 - 2020</h2>
											<h3>Chứng chỉ Bảo hành và Đổi trả</h3>
										</div>
										<!--/.experience-time-->
									</div>
									<!--/.col-->
									<div class="col-md-offset-1 col-md-5">
										<div class="timeline">
											<div class="timeline-content">
												<h4 class="title">
													<span><i class="fa fa-circle" aria-hidden="true"></i></span>
													Đảm bảo các chính sách do nhà nước qui định
												</h4>
												<h5>HCM, VN</h5>
												<p class="description">Mọi chính sách do chúng tôi cung
													cấp đều có hiệu lực thực tế.</p>
											</div>
											<!--/.timeline-content-->
										</div>
										<!--/.timeline-->
									</div>
									<!--/.col-->
								</div>
							</div> <!--/.single-timeline-box-->
						</li>
					</ul>
				</div>
				<!--.main-timeline-->
			</div>
			<!--.experience-content-->
		</div>

	</section>
	<!--/.experience-->
	<!--experience end -->

	<!--profiles start -->
	<section id="profiles" class="profiles">
		<div class="profiles-details">
			<div class="section-heading text-center">
				<h2>Các nhãn hàng lớn liên kết với chúng tôi</h2>
			</div>
			<div class="container">
				<div class="profiles-content">
					<div class="row">
						<div class="col-sm-3">
							<div class="single-profile">
								<div class="profile-txt">
									<a href=""><i class="flaticon-themeforest"></i></a>
									<div class="profile-icon-name">themeforest</div>
								</div>
								<div class="single-profile-overlay">
									<div class="profile-txt">
										<a href=""><i class="flaticon-themeforest"></i></a>
										<div class="profile-icon-name">themeforest</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="single-profile">
								<div class="profile-txt">
									<a href=""><i class="flaticon-dribbble"></i></a>
									<div class="profile-icon-name">dribbble</div>
								</div>
								<div class="single-profile-overlay">
									<div class="profile-txt">
										<a href=""><i class="flaticon-dribbble"></i></a>
										<div class="profile-icon-name">dribbble</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="single-profile">
								<div class="profile-txt">
									<a href=""><i class="flaticon-behance-logo"></i></a>
									<div class="profile-icon-name">behance</div>
								</div>
								<div class="single-profile-overlay">
									<div class="profile-txt">
										<a href=""><i class="flaticon-behance-logo"></i></a>
										<div class="profile-icon-name">behance</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="single-profile profile-no-border">
								<div class="profile-txt">
									<a href=""><i class="flaticon-github-logo"></i></a>
									<div class="profile-icon-name">github</div>
								</div>
								<div class="single-profile-overlay">
									<div class="profile-txt">
										<a href=""><i class="flaticon-github-logo"></i></a>
										<div class="profile-icon-name">github</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="profile-border"></div>
					<div class="row">
						<div class="col-sm-3">
							<div class="single-profile">
								<div class="profile-txt">
									<a href=""><i
										class="flaticon-flickr-website-logo-silhouette"></i></a>
									<div class="profile-icon-name">flickR</div>
								</div>
								<div class="single-profile-overlay">
									<div class="profile-txt">
										<a href=""><i
											class="flaticon-flickr-website-logo-silhouette"></i></a>
										<div class="profile-icon-name">flickR</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="single-profile">
								<div class="profile-txt">
									<a href=""><i class="flaticon-smug"></i></a>
									<div class="profile-icon-name">smungMung</div>
								</div>
								<div class="single-profile-overlay">
									<div class="profile-txt">
										<a href=""><i class="flaticon-smug"></i></a>
										<div class="profile-icon-name">smungMung</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="single-profile">
								<div class="profile-txt">
									<a href=""><i class="flaticon-squarespace-logo"></i></a>
									<div class="profile-icon-name">squareSpace</div>
								</div>
								<div class="single-profile-overlay">
									<div class="profile-txt">
										<a href=""><i class="flaticon-squarespace-logo"></i></a>
										<div class="profile-icon-name">squareSpace</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="single-profile profile-no-border">
								<div class="profile-txt">
									<a href=""><i
										class="flaticon-bitbucket-logotype-camera-lens-in-perspective"></i></a>
									<div class="profile-icon-name">bitBucket</div>
								</div>
								<div class="single-profile-overlay">
									<div class="profile-txt">
										<a href=""><i
											class="flaticon-bitbucket-logotype-camera-lens-in-perspective"></i></a>
										<div class="profile-icon-name">bitBucket</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!--/.profiles-->
	<!--profiles end -->

	<!--portfolio start -->
	<section id="portfolio" class="portfolio">
		<div class="portfolio-details">
			<div class="section-heading text-center">
				<h2>Sản phẩm</h2>
			</div>
			<div class="container">
				<div class="portfolio-content">
					<div class="isotope">
						<div class="row">
							<div class="col-sm-4">
								<div class="item">
									<img src="assets/images/portfolio/p1.jpg" alt="portfolio image" />
									<div class="isotope-overlay">
										<a href="../templatemo_571_hexashop/index.html"> Cho phòng
											ngủ </a>
									</div>
									<!-- /.isotope-overlay -->
								</div>
								<!-- /.item -->
								<div class="item">
									<img src="assets/images/portfolio/p2.jpg" alt="portfolio image" />
									<div class="isotope-overlay">
										<a href="../templatemo_571_hexashop/index.html"> Cho nhà
											bếp </a>
									</div>
									<!-- /.isotope-overlay -->
								</div>
								<!-- /.item -->
							</div>
							<!-- /.col -->

							<div class="col-sm-4">
								<div class="item">
									<img src="assets/images/portfolio/p3.jpg" alt="portfolio image" />
									<div class="isotope-overlay">
										<a href="../templatemo_571_hexashop/index.html"> Cho văn
											phòng </a>
									</div>
									<!-- /.isotope-overlay -->
								</div>
								<!-- /.item -->
							</div>
							<!-- /.col -->

							<div class="col-sm-4">
								<div class="item">
									<img src="assets/images/portfolio/p4.jpg" alt="portfolio image" />
									<div class="isotope-overlay">
										<a href="../templatemo_571_hexashop/index.html"> Nội thất
											gia đình </a>
									</div>
									<!-- /.isotope-overlay -->
								</div>
								<!-- /.item -->
								<div class="item">
									<img src="assets/images/portfolio/p5.jpg" alt="portfolio image" />
									<div class="isotope-overlay">
										<a href="../templatemo_571_hexashop/index.html"> Các sản
											phẩm sáng tạo </a>
									</div>
									<!-- /.isotope-overlay -->
								</div>
								<!-- /.item -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
					<!--/.isotope-->
				</div>
				<!--/.gallery-content-->
			</div>
			<!--/.container-->
		</div>
		<!--/.portfolio-details-->

	</section>
	<!--/.portfolio-->
	<!--portfolio end -->

	<!--clients start -->
	<section id="clients" class="clients">
		<div class="section-heading text-center">
			<h2>Chính sách</h2>
		</div>
		<div class="clients-area">
			<div class="container">
				<div class="owl-carousel owl-theme" id="client">
					<div class="item">
						<a href="#"> <img src="assets/images/clients/c1.png"
							alt="brand-image" />
						</a>
					</div>
					<!--/.item-->
					<div class="item">
						<a href="#"> <img src="assets/images/clients/c2.png"
							alt="brand-image" />
						</a>
					</div>
					<!--/.item-->
					<div class="item">
						<a href="#"> <img src="assets/images/clients/c3.png"
							alt="brand-image" />
						</a>
					</div>
					<!--/.item-->
					<div class="item">
						<a href="#"> <img src="assets/images/clients/c4.png"
							alt="brand-image" />
						</a>
					</div>
					<!--/.item-->
					<div class="item">
						<a href="#"> <img src="assets/images/clients/c5.png"
							alt="brand-image" />
						</a>
					</div>
					<!--/.item-->
					<div class="item">
						<a href="#"> <img src="assets/images/clients/c6.png"
							alt="brand-image" />
						</a>
					</div>
					<!--/.item-->
					<div class="item">
						<a href="#"> <img src="assets/images/clients/c7.png"
							alt="brand-image" />
						</a>
					</div>
					<!--/.item-->
				</div>
				<!--/.owl-carousel-->
			</div>
			<!--/.container-->
		</div>
		<!--/.clients-area-->

	</section>
	<!--/.clients-->

	</section>
	<!--/.clients-->
	<!--clients end -->

	<!--contact start -->
	<section id="contact" class="contact">
		<div class="section-heading text-center">
			<h2>Liên hệ với chúng tôi</h2>
		</div>
		<div class="container">
			<div class="contact-content">
				<div class="row">
					<div class="col-md-offset-1 col-md-5 col-sm-6">
						<div class="single-contact-box">
							<div class="contact-form">
								<form>
									<div class="row">
										<div class="col-sm-6 col-xs-12">
											<div class="form-group">
												<input type="text" class="form-control" id="name"
													placeholder="Name*" name="name">
											</div>
											<!--/.form-group-->
										</div>
										<!--/.col-->
										<div class="col-sm-6 col-xs-12">
											<div class="form-group">
												<input type="email" class="form-control" id="email"
													placeholder="Email*" name="email">
											</div>
											<!--/.form-group-->
										</div>
										<!--/.col-->
									</div>
									<!--/.row-->
									<div class="row">
										<div class="col-sm-12">
											<div class="form-group">
												<input type="text" class="form-control" id="subject"
													placeholder="Subject" name="subject">
											</div>
											<!--/.form-group-->
										</div>
										<!--/.col-->
									</div>
									<!--/.row-->
									<div class="row">
										<div class="col-sm-12">
											<div class="form-group">
												<textarea class="form-control" rows="8" id="comment"
													placeholder="Message"></textarea>
											</div>
											<!--/.form-group-->
										</div>
										<!--/.col-->
									</div>
									<!--/.row-->
									<div class="row">
										<div class="col-sm-12">
											<div class="single-contact-btn">
												<a class="contact-btn" href="#" role="button">submit</a>
											</div>
											<!--/.single-single-contact-btn-->
										</div>
										<!--/.col-->
									</div>
									<!--/.row-->
								</form>
								<!--/form-->
							</div>
							<!--/.contact-form-->
						</div>
						<!--/.single-contact-box-->
					</div>
					<!--/.col-->
					<div class="col-md-offset-1 col-md-5 col-sm-6">
						<div class="single-contact-box">
							<div class="contact-adress">
								<div class="contact-add-head">
									<h3>Group 6</h3>
									<p>Cửa hàng uy tín</p>
								</div>
								<div class="contact-add-info">
									<div class="single-contact-add-info">
										<h3>Số điện thoại</h3>
										<p>987-123-6547</p>
									</div>
									<div class="single-contact-add-info">
										<h3>email</h3>
										<p>browny@info.com</p>
									</div>
									<div class="single-contact-add-info">
										<h3>website</h3>
										<p>www.brownsine.com</p>
									</div>
								</div>
							</div>
							<!--/.contact-adress-->
							<div class="hm-foot-icon">
								<ul>
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<!--/li-->
									<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
									<!--/li-->
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<!--/li-->
									<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
									<!--/li-->
									<li><a href="#"><i class="fa fa-instagram"></i></a></li>
									<!--/li-->
								</ul>
								<!--/ul-->
							</div>
							<!--/.hm-foot-icon-->
						</div>
						<!--/.single-contact-box-->
					</div>
					<!--/.col-->
				</div>
				<!--/.row-->
			</div>
			<!--/.contact-content-->
		</div>
		<!--/.container-->

	</section>
	<!--/.contact-->
	<!--contact end -->

	<!--footer-copyright start-->
	<footer id="footer-copyright" class="footer-copyright">
		<div class="container">
			<div class="hm-footer-copyright text-center">
				<p>
					&copy; copyright yourname. design and developed by <a
						href="https://www.themesine.com/">themesine</a>
				</p>
				<!--/p-->
			</div>
			<!--/.text-center-->
		</div>
		<!--/.container-->

		<div id="scroll-Top">
			<div class="return-to-top">
				<i class="fa fa-angle-up " id="scroll-top"></i>
			</div>

		</div>
		<!--/.scroll-Top-->

	</footer>
	<!--/.footer-copyright-->
	<!--footer-copyright end-->

	<!-- Include all js compiled plugins (below), or include individual files as needed -->

	<script src="assets/js/jquery.js"></script>

	<!--modernizr.min.js-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>

	<!--bootstrap.min.js-->
	<script src="assets/js/bootstrap.min.js"></script>

	<!-- bootsnav js -->
	<script src="assets/js/bootsnav.js"></script>

	<!-- jquery.sticky.js -->
	<script src="assets/js/jquery.sticky.js"></script>

	<!-- for progress bar start-->

	<!-- progressbar js -->
	<script src="assets/js/progressbar.js"></script>

	<!-- appear js -->
	<script src="assets/js/jquery.appear.js"></script>

	<!-- for progress bar end -->

	<!--owl.carousel.js-->
	<script src="assets/js/owl.carousel.min.js"></script>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>


	<!--Custom JS-->
	<script src="assets/js/custom.js"></script>

</body>
</html>