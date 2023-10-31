<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="/vendors/styles/equipment/data.css">
<link rel="stylesheet" href="/vendors/styles/equipment/historyInsert.css">

<h1>수술실/비품관리</h1>
	<br>
<h2>비품 대여</h2>
	<br><br>
<div id="historyInsert-all-component">
    <!-- 고정항목 세션에서 받아오기 -->
    <form action="./historyInsert" method="POST" id="history-insert-form">
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label" style="font-weight: bold; font-size: large; text-align: center;">항목</label>
            <div>
                <input class="form-control" type="text" value="${codeName}" readonly>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label" style="font-weight: bold; font-size: large; text-align: center;">시리얼 넘버</label>
            <div>
                <input class="form-control" type="text" value="${sNum}" readonly>
                <input class="form-control" type="text" name="equCd" value="${equCd}" hidden>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label" style="font-weight: bold; font-size: large; text-align: center;">대여자</label>
            <div>
                <input class="form-control" type="text" value="박병웅" readonly>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label" style="font-weight: bold; font-size: large; text-align: center;">사번</label>
            <div>
                <input class="form-control" type="text" name="memCd" value="2303002" readonly>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label" style="font-weight: bold; font-size: large; text-align: center;">대여 종료 날짜</label>
            <div>
                <input class="form-control date-picker" placeholder="Select Return Date" type="text" name="reDate" onkeydown="return false">
                <br>'무기한'대여&nbsp;<input type="checkbox" id="indefinite-btn" data-size="" data-color="#0099ff" data-switchery="true" style="color: rgb(0, 153, 255);">
                    <!-- checked="true" -->
            </div>
        </div>
    </form>
</div>
    <br>
<div class="clearfix mb-20">
    <input type="button" id="historyInsert-submit-btn" class="btn btn-outline-primary" value="대여 신청"></button>
</div>

<script src="/vendors/scripts/equipment/historyInsert.js"></script>