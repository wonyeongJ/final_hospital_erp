<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서관리</title>
</head>
<body>
	<h1>부서관리</h1>
	<h3></h3>

		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<!-- Bordered table  start -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4">부서 목록</h4>
						</div>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">부서코드</th>
								<th scope="col">부서이름</th>
								<th scope="col">부서생성일</th>
								<th scope="col">상태</th>
								<th scope="col">Tag</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>인사과</td>
								<td>2018-01-01</td>
								<td>운영</td>
								<td><button type="button" class="btn btn-success">수정</button></td>
							</tr>
						</tbody>
					</table>
				<div style="display: flex; justify-content: flex-end;">
					<a type="button" class="btn btn-primary" href="./insert">부서등록</a>
				</div>
				</div>
				<!-- Bordered table End -->
				
			</div>
		</div>
	
</body>
</html>