<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


	<h1>직원상세(퇴사자)</h1>
	<br>
	<form class="card-box pd-20 mb-30 ">
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">사번</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" name="memCd" value="${memberVO.memCd}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">이름</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" name="memName" value="${memberVO.memName}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">주민등록번호</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text"  value="${memberVO.memRnum}" readonly >
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">이메일</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="email" name="memEmail" value="${memberVO.memEmail}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">직무</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" value="${memberVO.jobName}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">입사일</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="date" value="${memberVO.memHdate}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">퇴사일</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="date" value="${memberVO.memQdate}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">연봉</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="number"  value="${memberVO.memSalary}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">부서</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" value="${memberVO.depName}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">연차</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="number" name="memAnnual" value="${memberVO.memAnnual}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">직책</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text"  value="${memberVO.posName}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">성별</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" name="memCodeCd" value="${memberVO.codeName}" readonly>
			</div>
		</div>
		<br>
		<br>
	</form>

	
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>

		
	
