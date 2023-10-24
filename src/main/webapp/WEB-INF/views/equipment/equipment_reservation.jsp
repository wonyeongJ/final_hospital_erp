<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link rel="stylesheet" href="/vendors/styles/equipment/detail.css">

<h1>수술실/비품관리</h1>
	<br>
<h2>비품 조회</h2>
	<br><br>

<table class="table table-bordered">
    <thead>
        <tr id="table-top">
            <th scope="col">물품 구매일</th>
            <th scope="col">항목</th>
            <th scope="col">시리얼넘버</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">2023.09.04</th>
            <td>노트북</td>
            <td>NOTEBOOK001</td>
        </tr>
    </tbody>
</table>
    <br>
<div class="form-group row">
    <label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">대여자</label>
    <div class="col-sm-12 col-md-10">
        <input class="form-control" type="text" value="전원영" readonly>
    </div>
</div>
<form action="">
    <div class="form-group row">
        <label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">사번</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control" type="text" value="220103" readonly>
        </div>
    </div>
    <div class="form-group row">
        <label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">대여 종료 일시</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control date-picker" placeholder="Select Return Date" type="text">
        </div>
    </div>
</form>
<div class="clearfix mb-20">
    <div class="pull-right">
        <input type="button" id="" class="btn btn-outline-primary header-white" value="대여 신청"></button>
    </div>
</div>