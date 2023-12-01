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
					
					<form id="patientUpdateFrm" action="./update" method="post">
						<input class="form-control" type="hidden" name="patCd" value="${patientVO.patCd}" >
						<div class="form-group row ">
							<label class="col-sm-12 col-md-2 col-form-label">이름</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" id="patName" name="patName" type="text" value="${patientVO.patName}" >
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">주민등록번호</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" type="text" id="patRnum" name="patRnum"  value="${patientVO.patRnum}" >
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">연락처</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" id="patPnum" name="patPnum" type="text" value="${patientVO.patPnum}" >
							</div>
						</div>
				
						<div>			
							<div style="display: flex; justify-content: flex-end;">
								<button id="patientUpdateBtn" type="button" class="btn btn-primary" >수정완료</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/js/patient/update.js"></script> 
</html>