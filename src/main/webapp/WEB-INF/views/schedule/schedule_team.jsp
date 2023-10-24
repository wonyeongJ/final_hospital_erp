<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<link rel="stylesheet" href="/vendors/styles/schedule/team.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- main -->
<h1>일정관리</h1>
	<br>
<h2>과 일정</h2>
<div class="pull-right" id="select-box-1">
	<div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label"></label>
        <div class="col-sm-12 col-md-10">
            <select class="custom-select col-12">
                <option value="0" selected>전체보기</option>
                <option value="1">내과</option>
                <option value="2">외과</option>
                <option value="3">마취과</option>
            </select>
        </div>
    </div>
</div>
	<br><br><br>
<div id='calendar'></div>

<!-- 달력을 출력하는 JS -->
<script src="/vendors/scripts/schedule/team.js"></script>