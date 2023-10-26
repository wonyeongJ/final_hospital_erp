<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link rel="stylesheet" href="/vendors/styles/equipment/data.css">
<link rel="stylesheet" href="/vendors/styles/equipment/historyInsert.css">

<h1>수술실/비품관리</h1>
	<br>
<h2>비품 대여</h2>
	<br><br>
<div id="historyInsert-all-component">
    <form action="">
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label" style="font-weight: bold; font-size: large; text-align: center;">항목</label>
            <div>
                <input class="form-control" type="text" value="노트북" readonly>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label" style="font-weight: bold; font-size: large; text-align: center;">시리얼 넘버</label>
            <div>
                <input class="form-control" type="text" value="NOTEBOOK001" readonly>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label" style="font-weight: bold; font-size: large; text-align: center;">대여자</label>
            <div>
                <input class="form-control" type="text" value="전원영" readonly>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label" style="font-weight: bold; font-size: large; text-align: center;">사번</label>
            <div>
                <input class="form-control" type="text" value="220103" readonly>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label" style="font-weight: bold; font-size: large; text-align: center;">대여 종료 날짜</label>
            <div>
                <input class="form-control date-picker" placeholder="Select Return Date" type="text">
            </div>
        </div>
    </form>
</div>
    <br>
<div class="clearfix mb-20">
    <input type="button" id="historyInsert-submit-btn" class="btn btn-outline-primary" value="대여 신청"></button>
</div>