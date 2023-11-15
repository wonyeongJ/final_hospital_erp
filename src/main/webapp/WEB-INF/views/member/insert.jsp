<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<body>
	<h1>직원등록</h1>
	<br>
	<form:form modelAttribute="memberVO" action="insert" method="post" id="memberInsertFrm" class="card-box pd-20 mb-30 ">
	
		<div class="form-group row ">
			<label class="col-sm-12 col-md-2 col-form-label">이름</label>
			<div class="col-sm-12 col-md-3">
				<input class="form-control" type="text" id="memName" name="memName" placeholder="홍길동">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">주민등록번호</label>
			<div class="col-md-2 col-sm-12" >
				<input class="form-control" type="text" id="memRnum1"  placeholder="940908">
			</div>
			<div>
				_
			</div>
			<div class="col-md-2 col-sm-12" >
				<input class="form-control" type="text" id="memRnum2"  placeholder="1234567">
				<input class="form-control" type="hidden" id="memRnum" name="memRnum"  >
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">핸드폰번호</label>
			<div class="col-md-1 col-sm-12">
				<input class="form-control" type="text" id="memPnum1" placeholder="010">
			</div>
			<div>
				_
			</div>
			<div class="col-md-1 col-sm-12">
				<input class="form-control" type="text" id="memPnum2"  placeholder="3333">
			</div>
			<div>
				_
			</div>
			<div class="col-md-1 col-sm-12">
				<input class="form-control" type="text" id="memPnum3"  placeholder="2222">
				<input class="form-control" type="hidden" id="memPnum" name="memPnum">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">직무</label>
			<div class="col-sm-12 col-md-10">
				<div class="col-md-6 col-sm-12" style="text-align: justify;">
					<div class="custom-control custom-radio mb-5" style="float: left">
						<input type="radio" id="customRadio1" name="jobCd" value="3" class="custom-control-input">
						<label class="custom-control-label" for="customRadio1">의사</label>
					</div>
					<div class="custom-control custom-radio mb-5" style="float: left">
						<input type="radio" id="customRadio2" name="jobCd" value="4" class="custom-control-input">
						<label class="custom-control-label" for="customRadio2">간호사</label>
					</div>
					<div class="custom-control custom-radio mb-5" style="float: left">
						<input type="radio" id="customRadio3" name="jobCd" value="5" class="custom-control-input">
						<label class="custom-control-label" for="customRadio3">사무직</label>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">이메일</label>
			<div class="col-sm-12 col-md-2">
				<input class="form-control" type="email" id="memEmail1"  placeholder="emailid">
			</div>
			<div>
				@
			</div>
			<div class="col-sm-12 col-md-2">
				<input class="form-control" type="email" id="memEmail2"  placeholder="domain.com">
				<input class="form-control" type="hidden" id="memEmail" name="memEmail" >
			</div>
			<div class="col-sm-12 col-md-2">
				<button id="emailAthenticationBtn" type="button" class="btn btn-primary">인증요청</button>
			</div>
		</div>
		<div class="form-group row " id="emailShow" style="display: none;">
			<label class="col-sm-12 col-md-2 col-form-label">인증번호</label>
			<div class="col-sm-12 col-md-3">
				<input class="form-control" type="text" id="emailValue" placeholder="인증코드를 입력하세요.">
			</div>
				<input class="form-control" type="hidden" id="emailValue2">
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">입사일</label>
			<div class="col-sm-12 col-md-4">
				<input class="form-control" type="date" id="memHdate" name="memHdate">
			</div>
		</div>
			<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">연봉(만원)</label>
			<div class="col-sm-12 col-md-4">
				<input class="form-control" type="number" id="memSalary" name="memSalary">
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">주소</label>
			<div class="col-sm-12 col-md-4">
				<input class="form-control" id="address_kakao" type="text" name="memAddress" readonly>
			</div>
		</div>
		<div style="display: flex; justify-content: flex-end;">
			<button type="button" id="insertBtn" class="btn btn-primary">직원등록</button>
		</div>
	</form:form>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/js/member/insert.js"></script> 

<script type="text/javascript">
	$(document).ready(function(){ 
	    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("address_kakao").value = data.address; // 주소 넣기
	            }
	        }).open();
	    });
	})

</script>
