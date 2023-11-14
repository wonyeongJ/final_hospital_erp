<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4">환자 상세</h4>
						</div>
					</div>
					<div class="form-group row ">
					<input class="form-control" type="hidden" value="${patientVO.patCd}" >
						<label class="col-sm-12 col-md-2 col-form-label">이름</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" type="text" value="${patientVO.patName}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">주민등록번호</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" type="text" value="${patientVO.patRnum}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">연락처</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" type="text" value="${patientVO.patPnum}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">성별</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" type="text" value="${patientVO.codeName}" readonly>
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
							<c:forEach items="${reservationAr}" var="reservationVO" varStatus="i">
								<tr>
									<th scope="row">${i.index+1}</th>
									<td>${reservationVO.depName}</td>
									<td>${reservationVO.resMemName}</td>
									<td><a href="/reservation/update?resCd=${reservationVO.resCd }">${reservationVO.resReason}</a></td>
									<td>${reservationVO.resVdate}</td>
									<td>${reservationVO.memName}</td>
									<c:if test="${reservationVO.resClinic eq 0}">
										<td>예약중</td>
									</c:if>
									<c:if test="${reservationVO.resClinic eq 1}">
										<td>조치완료</td>
									</c:if>
									<td>
										<c:if test="${reservationVO.resClinic eq 0}">
											<a class="btn btn-success" href="/reservation/update?resCd=${reservationVO.resCd}">수정</a>
											<button class="btn btn-danger">삭제</button>
										</c:if>
										<c:if test="${reservationVO.resClinic eq 1}">
											<button class="btn btn-success">수정</button>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div style="display: flex; justify-content: flex-end;">
						<a type="button" class="btn btn-primary" href="../reservation/insert?patCd=${patientVO.patCd }" style="margin-right: 10px;">진료예약</a>
						<a type="button" class="btn btn-primary" href="./update?patCd=${patientVO.patCd }">환자수정</a>
					</div>
				</div>
				<!-- Bordered table End -->
				
			</div>
		</div>
	
</body>
</html>