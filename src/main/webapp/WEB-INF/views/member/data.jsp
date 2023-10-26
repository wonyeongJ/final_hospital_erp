<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
	<h1>직원상세(재직자)</h1>
	<h3></h3>
	<form action="update" method="post">
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">이름</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" name="memName" value="${memberVO.memName}" placeholder="홍길동" >
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
				<input class="form-control" type="text" name="memJobCd" value="${memberVO.memJobCd}">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">입사일</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control date-picker" type="date" name="memHdate" value="${memberVO.memHdate}" >
			</div>
		</div>
			<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">연봉</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="number" name="memSalary" value="${memberVO.memSalary}" >
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">부서</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" name="memDepCd" value="${memberVO.memDepCd}">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">연차</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="number" name="memAnnual" value="${memberVO.memAnnual}" >
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
				<input class="form-control" type="text" name="memPosCd" value="$memberVO.{memPosCd}">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">성별</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" name="memCodeCd" value="${memberVO.memCodeCd}">
			</div>
		</div>
	</form>
</body>
</html>