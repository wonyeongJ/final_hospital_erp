<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
		<h3 class="mb-20 h5 text-blue">내 정보</h3>
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
			<a href="#" type="button" class="btn btn-primary ms-30" data-toggle="modal" data-target="#Medium-modal" >비밀번호 변경</a>
			<div class="modal fade" id="Medium-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" style="display: none;" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="text-center text-primary">Reset Password</h4>
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						</div>
						<div class="modal-body">
							<form:form modelAttribute="passwordVO" id="updatePasswordFrm" action="./updatePassword" method="post" >
								<div class="input-group custom">
									<input type="text" class="form-control form-control-lg" name="newPassword" placeholder="New Password">
									<div class="input-group-append custom">
										<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
									</div>
									<form:errors path="newPassword"></form:errors>
								</div>
								<div class="input-group custom">
									<input type="text" class="form-control form-control-lg" name="newPasswordConfirm" placeholder="Confirm New Password">
									<div class="input-group-append custom">
										<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
									</div>
								</div>
									<div>
										<form:errors path="newPasswordConfirm"></form:errors>
									</div>
								<div class="row align-items-center">
									<div class="col-5">
										<div class="input-group mb-0">
											<!--
												use code for form submit
												<input class="btn btn-primary btn-lg btn-block" type="submit" value="Submit">
											-->
										</div>
									</div>
								</div>
							</form:form>
						</div>
						<div class="modal-footer">
							<a type="button" id="updatePasswordBtn" class="btn btn-primary btn-lg btn-block"   >Submit</a>
						</div>
										
					</div>
				</div>
			</div>
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
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="/js/member/mypage.js"></script>
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