<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자관리</title>
</head>
<body>
	<h1>접수관리</h1>
	<h3> 환자관리</h3>

		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<!-- Bordered table  start -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4">환자 목록</h4>
						</div>
					</div>
					<table class="table hover multiple-select-row datatable2 nowrap">
						<thead>
							<tr>
								<th scope="col">NO</th>
								<th scope="col">이름</th>
								<th scope="col">주민등록번호</th>
								<th scope="col">성별</th>
								<th scope="col">연락처</th>
								<th scope="col">마지막방문일</th>
								<th scope="col">비고</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${patientAr}" var="patientVO" varStatus="i">	
							<tr>
								<th scope="row">${i.index+1}</th>
								<td><a href="./data?patCd=${patientVO.patCd}">${patientVO.patName}</a></td>
								<td>${patientVO.patRnum}</td>
								<td>${patientVO.codeName}</td>
								<td>${patientVO.patPnum}</td>
								<td>${patientVO.resVdate}</td>
								<td></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				<div style="display: flex; justify-content: flex-end;">
					<a type="button" class="btn btn-primary" href="./insert">환자등록</a>
				</div>
				</div>
				<!-- Bordered table End -->
				
			</div>
		</div>
	
</body>
</html>