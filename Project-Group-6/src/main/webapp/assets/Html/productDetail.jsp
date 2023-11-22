<%--
  Created by IntelliJ IDEA.
  User: TO NHAT
  Date: 29/10/2023
  Time: 2:20 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!--fontawesome-->
<link rel="stylesheet"
	href="../Font/fontawesome-free-6.4.0-web/css/all.min.css">

<!--    google font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100&family=Roboto:wght@300;400;500;700&display=swap"
	rel="stylesheet">

<!--    css-->
<link rel="stylesheet" href="../Style/slidebar.css">
<link rel="stylesheet" href="../Style/productDetail.css">
<title>Product detail</title>
</head>
<body>
	<jsp:include page="header.html" />

	<div class="proDe_container">
		<div class="proDe_main">
			<%--    slidebar hien thi hinh anh de mo san pham--%>
			<div class="slidebar">
				<div class="slidebar-img-list">
					<div class="sliderbar-item active">
						<img src="../Image/productDetail/sofa-1.png" alt="">
					</div>
				</div>
			</div>
			<div class="proDe_control">

				<%--        ten san pham--%>
				<div class="product-name-cont">
					<p class="product-name">Sofa Băng Đẹp Đẳng Cấp Cho Căn Hộ
						KPN919</p>
				</div>

				<%--        gia san pham--%>
				<div class="product-price-cont">
					<p class="product-price">
						1200000 <span>VND</span>
					</p>
				</div>

				<%--        khuyen mai cua san pham--%>
				<div class="product-promotion">
					<p class="product-promotion-title">Khuyến mãi</p>
					<p class="product-promotion-content">Giảm 50% trong tháng 11</p>
					<p class="product-promotion-content">Tặng thêm 1 năm bảo hành</p>
					<p class="product-promotion-content">Miễn phí vệ sinh 2 lần 1
						năm</p>
				</div>
				<div class="product-qty-addCart">
					<%--                muc so luong san pham --%>
					<div class="product-qty-control">
						<i class="fa-solid fa-minus qty-control btn-minus-qty"></i>
						<input type="text" class="product-qty-input" value="1" size="3"> 
						<i class="fa-solid fa-plus qty-control btn-plus-qty"></i>
					</div>
				</div>
				<div class="buying-btn">
					<p>Mua ngay</p>
				</div>

			</div>

		</div>

		<div class="seperate-horizontal-item"></div>
		<%--    mo ta chi tiet san pham--%>
		<div class="proDe_detail">
			<p class="detail_title">Mô tả</p>
			<p class="detail_des">
				Kích thước : Chiều dài: 2m2 (Luôn luôn: Có đặt theo kích thước yêu
				cầu)<br /> Chất liệu : Da Công nghiệp nhập khẩu Hàn Quốc<br />
				Khung sườn : Khung gỗ Dầu tự nhiên chống mối mọt, cong vênh (Qua quy
				trình dấy hiện đại 72H)<br /> Nệm (đệm) mousse : D55 theo tiêu
				chuẩn xuất khẩu. Kháng được vi khuẩn & kháng được nấm mốc, cho bạn
				một sự nâng đỡ tuyệt hảo ở mọi tư thế ngồi, không bị đau lưng và
				sảng khoái (có lò xo trợ nhún). Thứ tự tăng dần về chất lượng Nệm
				Mousse D25 > D40 > D55 > Cao su non thiên nhiên (48D là Mousse chỉ
				có ở sản phẩm Nhập Khẩu)<br /> Chân ghế : Theo bộ<br /> Tính năng
				nổi bật: Thiết kế lạ mắt trên thị trường, nguyên liệu nhập khẩu
				chính hãng. Chất liệu không bám bụi, vệ sinh lau chùi, nằm đọc sách
				thư giãn.<br /> Sản xuất: Thương hiệu Kim Phú (Sản phẩm xuất khẩu
				quốc tế)<br /> Bảo hành: 5 Năm Khung Sườn 5 Năm Nệm Mousse (Khung
				không gãy đổ mối mọt và Nệm mút không lỗi 1 đổi 1 mới chính hãng)<br />
			</p>
		</div>
	</div>

	<script src="../JavaScript/productDetail.js">
		
	</script>


</body>
</html>
