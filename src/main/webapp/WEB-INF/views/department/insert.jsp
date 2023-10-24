<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
</head>
<body>
	<h1>부서등록</h1>
	<h3>  </h3>
	<form class="card-box pd-20 mb-30">
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">부서이름</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" placeholder="소아과" >
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">성별</label>
			<div class="col-sm-12 col-md-10">
				<div class="col-md-6 col-sm-12" style="text-align: justify;">
					<div class="custom-control custom-radio mb-5" style="float: left">
						<input type="radio" id="male" name="status" class="custom-control-input">
						<label class="custom-control-label" for="true">운영</label>
					</div>
					<div class="custom-control custom-radio mb-5" style="float: left">
						<input type="radio" id="female" name="status" class="custom-control-input">
						<label class="custom-control-label" for="false">사용안함</label>
					</div>
				</div>
			</div>
		</div>
		<div style="display: flex; justify-content: flex-end;">
			<button type="button" class="btn btn-primary">등록완료</button>
		</div>
	</form>
</body>
</html>