<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자관리</title>
</head>
<body>
	<h1>접수관리</h1>
	<h3> 환자상세</h3>

		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4">환자 상세</h4>
						</div>
					</div>
					<form>
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
							<label class="col-sm-12 col-md-2 col-form-label">연락처</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" type="text" placeholder="010-1234-5678">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">성별</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" type="text" placeholder="남">
							</div>
						</div>
						<div>			
							<div style="display: flex; justify-content: flex-end;">
								<a type="button" class="btn btn-primary" href="./update">수정완료</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
</body>
</html>