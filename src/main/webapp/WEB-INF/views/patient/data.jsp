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
				</div>			
				<!-- Bordered table  start -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4">방문일정</h4>
						</div>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">순번</th>
								<th scope="col">담당부서</th>
								<th scope="col">담당의</th>
								<th scope="col">방문원인</th>
								<th scope="col">예약날짜</th>
								<th scope="col">작성자(간호사)</th>
								<th scope="col">조치사항</th>
								<th scope="col">Tag</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>내과</td>
								<td>강영희</td>
								<td>목아픔</td>
								<td>2023-10-21</td>
								<td>이수찬</td>
								<td>예약중</td>
								<td>
									<button class="btn btn-success">수정</button>
									<button class="btn btn-danger">삭제</button>
								</td>
							</tr>
						</tbody>
					</table>
					<div style="display: flex; justify-content: flex-end;">
						<a type="button" class="btn btn-primary" href="../reservation/insert" style="margin-right: 10px;">진료예약</a>
						<a type="button" class="btn btn-primary" href="./update">환자수정</a>
					</div>
				</div>
				<!-- Bordered table End -->
				
			</div>
		</div>
	
</body>
</html>