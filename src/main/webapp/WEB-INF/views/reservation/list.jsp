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
	<br>
	
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<!-- Bordered table  start -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4" style="display: flex; float: left;">진료 관리</h4>
							<label style="display: flex; justify-content: flex-end;">오늘진료목록보기</label>
							<span class="switchery switchery-default" style="background-color: rgb(0, 89, 178); border-color: rgb(0, 89, 178); box-shadow: rgb(0, 89, 178) 0px 0px 0px 16px inset; transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;"><small style="left: 20px; transition: background-color 0.4s ease 0s, left 0.2s ease 0s; background-color: rgb(255, 255, 255);"></small></span>
						</div>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">순번</th>
								<th scope="col">방문환자</th>
								<th scope="col">방문부서</th>
								<th scope="col">담당의</th>
								<th scope="col">방문원인</th>
								<th scope="col">방문날짜</th>
								<th scope="col">작성자(간호사)</th>
								<th scope="col">비고</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>김영희</td>
								<td>외과</td>
								<td>홍길동</td>
								<td>목아픔</td>
								<td>2023-10-21</td>
								<td>김간호사</td>
									<td>
									<button class="btn btn-success">수정</button>
									<button class="btn btn-danger">삭제</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- Bordered table End -->
				
			</div>
		</div>
	
</body>
</html>