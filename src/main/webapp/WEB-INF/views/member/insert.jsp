<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<h1>직원등록</h1>
	<br>
	<form action="insert" method="post" class="card-box pd-20 mb-30 ">
	
		<div class="form-group row ">
			<label class="col-sm-12 col-md-2 col-form-label">이름</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" name="memName" placeholder="홍길동"  >
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">주민등록번호</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" name="memRnum" placeholder="940908-1234567">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">핸드폰번호</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" name="memPnum" placeholder="010-1234-5678">
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
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="email" name="memEmail">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">입사일</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="date" name="memHdate">
			</div>
		</div>
			<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">연봉(만원)</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="number" name="memSalary">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">성별</label>
			<div class="col-sm-12 col-md-10">
				<div class="col-md-6 col-sm-12" style="text-align: justify;">
					<div class="custom-control custom-radio mb-5" style="float: left">
						<input type="radio" id="male" name="codeCd" value="1" class="custom-control-input">
						<label class="custom-control-label" for="male">남자</label>
					</div>
					<div class="custom-control custom-radio mb-5" style="float: left">
						<input type="radio" id="female" name="codeCd" value="2" class="custom-control-input">
						<label class="custom-control-label" for="female">여자</label>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">주소</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" id="address_kakao" type="text" name="memAddress" readonly>
			</div>
		</div>
		<div style="display: flex; justify-content: flex-end;">
			<button type="submit" class="btn btn-primary">직원등록</button>
		</div>
	</form>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
            }
        }).open();
    });
}
</script>
</html>