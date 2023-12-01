<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	<h1>접수관리</h1>
	<br>
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4">진료예약</h4>
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
				<form id="reservationInsertFrm" action="insert" method="post">
					<input class="form-control" type="hidden" name="memName" value="${patientVO.patName}">
					<input value="<sec:authentication property="principal.memCd" />" name="memCd" type="hidden">
					<input class="form-control" type="hidden" name="patCd" value="${patientVO.patCd}" >
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">방문원인</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" id="resReason"  name="resReason" type="text">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">방문날짜</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" id="resVdate" name="resVdate" type="datetime-local"  >
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">방문부서</label>
						<div class="col-sm-12 col-md-10">
							<select id="searchDepartment" name="depCd" class="custom-select col-12" >
								<option value="3">외과</option>
								<option value="4">내과</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">담당의</label>
						<div class="col-sm-12 col-md-10">
							<select id="doctorList" name="resMemCd" class="custom-select col-12">
							</select>
						</div>
					</div>
					<div style="display: flex; justify-content: flex-end;">
						<button id="reservationInsertBtn" type="button" class="btn btn-primary" onclick="return confirm('진료 예약을 등록 하시겠습니까?');">진료 예약 등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="/js/reservation/insert.js"></script>