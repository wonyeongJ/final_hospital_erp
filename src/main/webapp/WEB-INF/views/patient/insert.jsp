<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
</head>
<body>
	<h1>접수관리</h1>
	<h3>환자관리</h3>
	<br>
	<form id="patientInsertFrm" action="insert" method="post" class="card-box pd-20 mb-30">
		<div class="form-group row ">
			<label class="col-sm-12 col-md-2 col-form-label">이름</label>
			<div class="col-sm-12 col-md-3">
				<input class="form-control" type="text" id="patName" name="patName" placeholder="홍길동">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">주민등록번호</label>
			<div class="col-md-2 col-sm-12" >
				<input class="form-control" type="text" id="patRnum1"  placeholder="940908">
			</div>
			<div>
				_
			</div>
			<div class="col-md-2 col-sm-12" >
				<input class="form-control" type="text" id="patRnum2"  placeholder="1234567">
				<input class="form-control" type="hidden" id="patRnum" name="patRnum"  >
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">핸드폰번호</label>
			<div class="col-md-1 col-sm-12">
				<input class="form-control" type="text" id="patPnum1" placeholder="010">
			</div>
			<div>
				_
			</div>
			<div class="col-md-1 col-sm-12">
				<input class="form-control" type="text" id="patPnum2"  placeholder="3333">
			</div>
			<div>
				_
			</div>
			<div class="col-md-1 col-sm-12">
				<input class="form-control" type="text" id="patPnum3"  placeholder="2222">
				<input class="form-control" type="hidden" id="patPnum" name="patPnum">
			</div>
		</div>
	</form>
		
		
		<div style="display: flex; justify-content: flex-end;">
			<button id="insertBtn" type="button" class="btn btn-primary">환자등록</button>
		</div>
		<br>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/js/patient/insert.js"></script> 
</html>