<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="/vendors/styles/equipment/list.css">

<body>
	<div>
		<h1>MYPAGE</h1>
		<c:if test="${commuteVO.comWork eq null }">
		<div style="display: flex; justify-content: flex-end; margin-right: 1%;">
			<button type="button" id="commuteInsert"class="btn btn-danger col-sm-1 col-md-1 mb-20">출근</button>
		</div>
		</c:if>
		<c:if test="${commuteVO.comWork eq 0 }">
		<div style="display: none; justify-content: flex-end; margin-right: 1%;">
			<button type="button" id=""class="btn btn-danger col-sm-1 col-md-1 mb-20" style="display: none;">출근</button>
		</div>
		</c:if>
		<c:if test="${commuteVO.comWork eq 1 }">
		<div style="display: flex; justify-content: flex-end; margin-right: 1%;">
			<button type="button" id="commuteUpdate"class="btn btn-danger col-sm-1 col-md-1 mb-20">퇴근</button>
		</div>
		</c:if>
		
	</div>
	<div class="col-lg-2 col-md-6 col-sm-12 mb-30" style="float:left;">
		<div class="da-card">
			
			<sec:authentication property="principal.memPath" var="memPath"/>
			<c:if test="${empty memPath}">
				<div class="da-card-photo">
	            	<img src="/img/sign/기본이미지.jpg" alt="">
	         	</div>
			</c:if>
			<c:if test="${memPath ne null }">
	         <div class="da-card-photo">
	            <img src="<sec:authentication property="principal.memPath" />" alt="">
	         </div>
	         </c:if>
	         
			<div class="da-card-content" style="display: flex; justify-content: center;">
				<a href="#" type="button" class="btn btn-primary ms-30" data-toggle="modal" data-target="#profile-modal" >프로필사진 변경</a>
				<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" style="display: none;" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="text-center text-primary">프로필 사진 변경</h4>
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							</div>
							
							<div class="modal-body">
								<form action="profileInsert" method="post" id="profileInsertFrm" enctype="multipart/form-data">
									<input type="file" class="form-control" name="multipartFile">
								</form>
							</div>
							<div class="modal-footer">
								<a type="button" id="profileBtn" class="btn btn-primary btn-lg btn-block">Submit</a>
							</div>
											
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="profile-info card-box">
		<h3 class="mb-20 h5 text-blue">내 정보</h3>
		<div id="memIspwch" style="display: none;">
			<sec:authentication property="principal.memIspwch" />
		</div>
		<ul>
			<li>
				<span>이름</span>
				<sec:authentication property="principal.memName" />
			</li>
			<li>
				<span>사번</span>
				<div id="memCd"><sec:authentication property="principal.memCd" /></div>
			</li>
			<li>
				<span>과</span>
				<sec:authentication property="principal.depName" />
			</li>
			<li>
				<span>직무</span>
				<sec:authentication property="principal.jobName" />
			</li>
			<li>
				<span>전화번호</span>
				<sec:authentication property="principal.memPnum" />
			</li>
		</ul>
		<div style="display: flex; justify-content: flex-end;">
			<a href="#" type="button" class="btn btn-primary ms-30" data-toggle="modal" data-target="#stamp-modal" style="margin-right: 10px;" >도장/사인 이미지 변경</a>
			<div class="modal fade" id="stamp-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" style="display: none;" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="text-center text-primary">도장&사인 이미지 변경</h4>
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							</div>
							
							<div class="modal-body">
								 <img src="<sec:authentication property="principal.memSPath" />" alt="">
								<form action="stampUpdate" method="post" id="stampUpdateFrm" enctype="multipart/form-data">
									<input type="file" class="form-control" name="multipartFile">
								</form>
							</div>
							<div class="modal-footer">
								<a type="button" id="stampUpdateBtn" class="btn btn-primary btn-lg btn-block">Submit</a>
							</div>
											
						</div>
					</div>
				</div>
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
									<input type="password" class="form-control form-control-lg" id="newPassword" name="newPassword" placeholder="New Password">
									<div class="input-group-append custom">
										<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
									</div>
									
								</div>
								<div class="input-group custom">
									<input type="password" class="form-control form-control-lg" id="newPasswordConfirm"  name="newPasswordConfirm" placeholder="Confirm New Password">
									<div class="input-group-append custom">
										<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
									</div>
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
				<h5 class="h4 text-blue mb-20" style="display: flex; justify-content: flex-end;">남은연차 : <sec:authentication property="principal.memAnnual" /></h5>
				
				<table class="table table-striped datatable4">
					<thead>
						<tr>
							<th class="table-plus datatable-nosort">No</th>
							<th>문서 제목</th>
							<th>시작일</th>
							<th>종료일</th>
							<th>기간</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${paymentAr}" var="paymentVO" varStatus="i">
					<tr>
						<th class="table-plus">${i.index+1}</th>
						<td><a href="/payment/data?epCd=${paymentVO.epCd}" class="a1">${paymentVO.epTitle}</a> </td>
						<td>${paymentVO.epSDate}</td>
						<td>${paymentVO.epEDate}</td>
						<td>${paymentVO.epDays}</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-lg-6 col-md-12 col-sm-12 mb-30">
			<div id="equipment" class="pd-20 card-box">
				
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