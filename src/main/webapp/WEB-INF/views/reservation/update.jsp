<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<h1>접수관리</h1>
	<br>
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4">진료상세</h4>
						</div>
					</div>
					<div class="form-group row ">
					
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
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">방문원인</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" type="text" value="${reservationVO.resReason }" readonly>
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
				<form action="./update" method="post">
					<input class="form-control" type="hidden" name="patCd" value="${patientVO.patCd}" >
					<div class="form-group">
					<input class="form-control" type="hidden" name="resCd" value="${reservationVO.resCd}" >
						<label>조치내용</label>
						<input id="textareaValue" value="${reservationVO.resMHistory}" type="hidden">
						<textarea class="form-control" name="resMHistory">${reservationVO.resMHistory}</textarea>
					</div>

					<div class="form-group">
						<label>처방</label>
							<br>
						<select class="custom-select2 form-control select2-hidden-accessible" id="drug-selected" name="state" style="width: 1000px;" data-select2-id="1" tabindex="-1" aria-hidden="true">
							<c:forEach items="${drugs}" var="drug" varStatus="status">
								<option id="" value="${drug}" data-select2-id="${drug}">${status.count}. ${drug}</option>
							</c:forEach>
						</select>	
						<select class="custom-select col-12" id="howmany" name="codeName" style="width: 118px;">
							<option value="1p">1p</option>
							<option value="2p">2p</option>
							<option value="3p">3p</option>
							<option value="4p">4p</option>
							<option value="5p">5p</option>
							<option value="6p">6p</option>
							<option value="7p">7p</option>
							<option value="8p">8p</option>
							<option value="9p">9p</option>
							<option value="10p">10p</option>
						</select>
						<input type="button" id="drug-insert-btn" class="btn btn-outline-primary" value="처방에 추가하기">
							<br>
						<input id="textareaValue" value="${reservationVO.resDrug}" type="hidden">
						<textarea class="form-control" id="drug-area" name="resDrug">${reservationVO.resDrug}</textarea>
					</div>

					<div class="form-group row">
						<div class="col-sm-12 col-md-10">
							<div class="col-md-6 col-sm-12" style="text-align: justify;">
								<div class="custom-control custom-radio mb-5" style="float: left">
									<input type="radio" id="male" name="resClinic" value="0" class="custom-control-input">
									<label class="custom-control-label" for="male">예약중</label>
								</div>
								<div class="custom-control custom-radio mb-5" style="float: left">
									<input type="radio" id="female" name="resClinic"  value="1" class="custom-control-input" checked="checked">
									<label class="custom-control-label" for="female">진료완료</label>
								</div>
							</div>
						</div>
					</div>
					<div style="display: flex; justify-content: flex-end;">
						<button type="submit" class="btn btn-primary">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
<script src="/js/reservation/update.js"></script>