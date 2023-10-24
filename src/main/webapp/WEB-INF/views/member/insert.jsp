<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
</head>
<body>
	<h1>직원등록</h1>
	<br>
	<form class="card-box pd-20 mb-30 ">
	
		<div class="form-group row ">
			<label class="col-sm-12 col-md-2 col-form-label">이름</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" placeholder="홍길동" >
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">주민등록번호</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" placeholder="940908-1234567">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">직무</label>
			<div class="col-sm-12 col-md-10">
				<div class="col-md-6 col-sm-12" style="text-align: justify;">
					<div class="custom-control custom-radio mb-5" style="float: left">
						<input type="radio" id="customRadio1" name="customRadio" class="custom-control-input">
						<label class="custom-control-label" for="customRadio1">의사</label>
					</div>
					<div class="custom-control custom-radio mb-5" style="float: left">
						<input type="radio" id="customRadio2" name="customRadio" class="custom-control-input">
						<label class="custom-control-label" for="customRadio2">간호사</label>
					</div>
					<div class="custom-control custom-radio mb-5" style="float: left">
						<input type="radio" id="customRadio3" name="customRadio" class="custom-control-input">
						<label class="custom-control-label" for="customRadio3">사무직</label>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">이메일</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="email">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">입사일</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="date">
			</div>
		</div>
			<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">연봉(만원)</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="number" >
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">성별</label>
			<div class="col-sm-12 col-md-10">
				<div class="col-md-6 col-sm-12" style="text-align: justify;">
					<div class="custom-control custom-radio mb-5" style="float: left">
						<input type="radio" id="male" name="sex" class="custom-control-input">
						<label class="custom-control-label" for="male">남자</label>
					</div>
					<div class="custom-control custom-radio mb-5" style="float: left">
						<input type="radio" id="female" name="sex" class="custom-control-input">
						<label class="custom-control-label" for="female">여자</label>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">주소</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text">
			</div>
		</div>
		<div style="display: flex; justify-content: flex-end;">
			<button type="button" class="btn btn-primary">직원등록</button>
		</div>
	</form>
</body>
</html>