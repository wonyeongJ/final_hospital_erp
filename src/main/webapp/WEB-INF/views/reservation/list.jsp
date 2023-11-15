<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="/vendors/styles/patient/data.css">
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
							<label style="display: flex; justify-content: flex-end;">&nbsp;&nbsp;&nbsp;&nbsp;금일 진료목록</label>
							<span class="switchery switchery-default" style="background-color: rgb(0, 89, 178); border-color: rgb(0, 89, 178); box-shadow: rgb(0, 89, 178) 0px 0px 0px 16px inset; transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;"><small style="left: 20px; transition: background-color 0.4s ease 0s, left 0.2s ease 0s; background-color: rgb(255, 255, 255);"></small></span>
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
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${reservationAr}" var="reservationVO" varStatus="i">
								<tr>
									<th scope="row">${i.index+1}</th>
									<td>${reservationVO.depName}</td>
									<td>${reservationVO.resMemName}</td>
									<td><a href="/reservation/data?resCd=${reservationVO.resCd }" class="a1">${reservationVO.resReason}</a></td>
									<td>${reservationVO.resVdate}</td>
									<td>${reservationVO.memName}</td>
									<c:if test="${reservationVO.resClinic eq 0}">
										<td>예약 중</td>
									</c:if>
									<c:if test="${reservationVO.resClinic eq 1}">
										<td>조치완료</td>
									</c:if>
									<td>
										<c:if test="${reservationVO.resClinic eq 0}">
											<!-- <button class="btn btn-success">수정</button>
											<button class="btn btn-danger">삭제</button> -->
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- Bordered table End -->
				
			</div>
		</div>
	
</body>
</html>