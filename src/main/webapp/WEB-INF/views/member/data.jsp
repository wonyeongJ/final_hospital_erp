<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<h1>직원상세(재직자)</h1>
	<h3></h3>
	<form action="update" method="post">
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">이름</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" name="memName" value="${memberVO.memName}" >
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">주민등록번호</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" name="memRnum" value="${memberVO.memRnum}" >
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">이메일</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="email" name="memEmail" value="${memberVO.memEmail}" >
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">직무</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" name="memJobCd" value="${memberVO.jobCd}">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">입사일</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="date" value="${memberVO.memHdate}" readonly>
			</div>
		</div>
			<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">연봉</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="number" value="${memberVO.memSalary}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">부서</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" name="memDepCd" value="${memberVO.depCd}">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">연차</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="number" value="${memberVO.memAnnual}" readonly>
			</div>
		</div>
			<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">근무시간(월)</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="number" value="40" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">직책</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" name="memPosCd" value="${memberVO.posCd}">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">성별</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" name="memCodeCd" value="${memberVO.codeCd}">
			</div>
		</div>
		<div style="display: flex; justify-content: flex-end;">
			<button type="submit" class="btn btn-primary">수정완료</button>
		</div>
	</form>
