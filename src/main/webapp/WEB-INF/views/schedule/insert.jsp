<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<h1>&nbsp일정관리</h1>
	<br>
<h2>&nbsp개인 일정 추가하기</h2>
    <br><br>
<div class="pd-20 card-box mb-30">
    <div class="form-group row">
        <label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">시작</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control datetimepicker" id="start" placeholder="Choose Date and time" type="text" readonly style="background-color: white;" value="${date}">
        </div>
    </div>
    <div class="form-group row">
        <label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">종료</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control datetimepicker" id="end" placeholder="Choose Date and time" type="text" readonly style="background-color: white;" value="${date}">
        </div>
    </div>
    <div class="form-group">
        <label>상세 내용</label>
        <textarea class="form-control" id="desc" placeholder="contents"></textarea>
    </div>
    <div class="clearfix mb-20">
        <div class="pull-right">
            <input type="button" class="btn btn-outline-primary" id="personal-schedule-insert" value="등록">
        </div>
    </div>
</div>

<script src="/vendors/scripts/schedule/insert.js"></script>