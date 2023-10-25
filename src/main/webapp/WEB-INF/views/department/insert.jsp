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
	<form action="insert" method="post" class="card-box pd-20 mb-30">
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">부서이름</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" name="depName" type="text" placeholder="부서이름을 입력하세요" >
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">내선 번호</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" name="depTnum" type="text" placeholder="02-621-0450" >
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">상태</label>
			<div class="col-sm-12 col-md-10">
				<div class="col-md-6 col-sm-12" style="text-align: justify;">
					<div class="custom-control custom-radio mb-5" style="float: left">
						<input type="radio" id="operation" name="depDelete" value="0" class="custom-control-input">
						<label class="custom-control-label" for="operation">운영</label>
					</div>
					<div class="custom-control custom-radio mb-5" style="float: left">
						<input type="radio" id="notOperation" name="depDelete" value="1" class="custom-control-input">
						<label class="custom-control-label" for="notOperation">사용안함</label>
					</div>
				</div>
			</div>
		</div>
		<div style="display: flex; justify-content: flex-end;">
			<button type="submit" class="btn btn-primary">등록완료</button>
		</div>
	</form>
</body>
</html>