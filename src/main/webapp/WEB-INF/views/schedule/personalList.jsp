<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- main -->
<h1>일정관리</h1>
	<br>
<h2>개인 일정</h2>
<div class="pull-right">
	<a href="#" class="btn-block" data-toggle="modal" data-target="#Medium-modal-1" type="button" style="display: block;">
		<button class="btn btn-outline-primary">일정등록</button>
	</a>
	<div class="modal fade" id="Medium-modal-1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myLargeModalLabel">개인 일정 등록</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
				<div class="modal-body">
					<div class="pd-20 card-box mb-30">
						<form action="">
							<!-- <div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">상세 내용</label>
								<div class="col-sm-12 col-md-10">
									<input class="form-control" type="textarea" name="" placeholder="contents">
								</div>
							</div> -->
							<div class="form-group row">
								<label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">시작 일시</label>
								<div class="col-sm-12 col-md-10">
									<input class="form-control datetimepicker" placeholder="Choose Start Date and time" type="text">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">종료 일시</label>
								<div class="col-sm-12 col-md-10">
									<input class="form-control datetimepicker" placeholder="Choose End Date and time" type="text">
								</div>
							</div>
							<div class="form-group">
								<label>상세 내용</label>
								<textarea class="form-control" placeholder="contents"></textarea>
							</div>
						</form>
						<div class="clearfix mb-20">
							<div class="pull-right">
								<input type="button" id="" class="btn btn-outline-primary header-white" value="일정 등록"></button>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
	<br><br>
<div id='calendar'></div>

<!-- 달력을 출력하는 JS -->
<script src="/vendors/scripts/schedule/personalList.js"></script>