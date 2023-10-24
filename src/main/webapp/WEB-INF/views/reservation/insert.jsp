<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<label class="col-sm-12 col-md-2 col-form-label">이름</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" type="text" placeholder="홍길동" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">주민등록번호</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" type="text" placeholder="940908-1234567" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">연락처</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" type="text" placeholder="010-1234-5678" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">성별</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" type="text" placeholder="남" readonly>
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
				<form action="">
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">방문원인</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" type="text">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">방문날짜</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" type="date">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">방문부서</label>
						<div class="col-sm-12 col-md-10">
							<select class="custom-select col-12">
								<option value="1">외과</option>
								<option value="2">내과</option>
							</select>
						</div>
					</div>
					<div style="display: flex; justify-content: flex-end;">
						<a type="button" class="btn btn-primary" href="../reservation/insert">예약완료</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	