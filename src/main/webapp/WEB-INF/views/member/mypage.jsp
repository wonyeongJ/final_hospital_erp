<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title>MYPAGE</title>

	<!-- Site favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="vendors/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="vendors/images/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="vendors/images/favicon-16x16.png">

	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="vendors/styles/core.css">
	<link rel="stylesheet" type="text/css" href="vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="src/plugins/cropperjs/dist/cropper.css">
	<link rel="stylesheet" type="text/css" href="vendors/styles/style.css">

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-119386393-1');
	</script>

</head>
<body>
	<div>
		<h1>MYPAGE</h1>
		<div style="display: flex; justify-content: flex-end; margin-right: 1%;">
			<button type="button" class="btn btn-danger col-sm-1 col-md-1 mb-20">출근</button>
		</div>
	</div>
	<div class="col-lg-2 col-md-6 col-sm-12 mb-30" style="float:left;">
		<div class="da-card">
			<div class="da-card-photo">
				<img src="/vendors/images/photo1.jpg" alt="">
			</div>
			<div class="da-card-content" style="display: flex; justify-content: center;">
				
				<button type="button" class="btn btn-primary" >프로필 변경</button>
			</div>
		</div>
	</div>
	<div class="profile-info card-box">
		<h3 class="mb-20 h5 text-blue">내 정보</h5>
		<ul>
			<li>
				<span>이름</span>
				홍길동
			</li>
			<li>
				<span>사번</span>
				1801001
			</li>
			<li>
				<span>과</span>
				외과
			</li>
			<li>
				<span>직무</span>
				의사
			</li>
			<li>
				<span>내선번호</span>
				02-218-3648
			</li>
		</ul>
		<div style="display: flex; justify-content: flex-end;">
			<button type="button" class="btn btn-primary" style="margin-right: 10px;">도장/사인 이미지 변경</button>
			<button type="button" class="btn btn-primary ms-30" >비밀번호 변경</button>
		</div>
	</div>
	<br>

	<div class="row clearfix">
		<div class="col-lg-6 col-md-12 col-sm-12 mb-30">
			<div class="pd-20 card-box">
				<h5 class="h4 text-blue mb-20" style="display: flex; float: left;">연차사용내역</h5>
				<h5 class="h4 text-blue mb-20" style="display: flex; justify-content: flex-end;">남은연차 : 15</h5>
				
				<table class="table table-striped">
					<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">사용날짜</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<th scope="row">1</th>
						<td scope="row">2023-08-05</td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-lg-6 col-md-12 col-sm-12 mb-30">
			<div class="pd-20 card-box">
				<h5 class="h4 text-blue mb-20" style="display: flex;">비품사용내역</h5>
				
				<table class="table table-striped">
					<thead>
					<tr>
						<th scope="col">#</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<th scope="row">1</th>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	
	<!-- js -->
	<script src="vendors/scripts/core.js"></script>
	<script src="vendors/scripts/script.min.js"></script>
	<script src="vendors/scripts/process.js"></script>
	<script src="vendors/scripts/layout-settings.js"></script>
	<script src="src/plugins/cropperjs/dist/cropper.js"></script>
	<script>
		window.addEventListener('DOMContentLoaded', function () {
			var image = document.getElementById('image');
			var cropBoxData;
			var canvasData;
			var cropper;

			
		});
	</script>
</body>
</html>