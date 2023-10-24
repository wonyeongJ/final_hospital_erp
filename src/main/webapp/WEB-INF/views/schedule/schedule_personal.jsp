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
	<input type="button" class="btn btn-outline-primary header-white" value="일정 추가" onclick="window.open('add', '개인 일정 추가하기', 'width=800, height=750')">
</div>
	<br><br>
<div id='calendar'></div>

<!-- 달력을 출력하는 JS -->
<script src="/vendors/scripts/schedule/personal.js"></script>