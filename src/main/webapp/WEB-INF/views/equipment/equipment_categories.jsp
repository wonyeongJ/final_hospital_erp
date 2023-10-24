<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <style>

table, tr, td, th{

padding: 10px;

margin: auto;

border: none;

}
        
    </style>

<h1>수술실/비품관리</h1>
	<br>
<h2>비품항목관리</h2>
	<br><br>

<table class="table table-bordered">
    <thead>
        <tr>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col"></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">1</th>
            <td>의자</td>
            <td><button class="btn btn-outline-primary header-white">수정</button></td>
        </tr>
        <tr>
            <th scope="row">2</th>
            <td>책상</td>
            <td><button class="btn btn-outline-primary header-white">수정</button></td>
        </tr>
        <tr>
            <th scope="row">3</th>
            <td>노트북</td>
            <td><button class="btn btn-outline-primary header-white">수정</button></td>
        </tr>
        <tr>
            <th scope="row"></th>
            <td><input type="text" placeholder="추가할 항목의 이름을 써주세요." class="form-control"></td>
            <td><button class="btn btn-outline-primary header-white">비품항목등록</button></td>
        </tr>
    </tbody>
</table>
    <br>
<div class="clearfix mb-20">
    <div class="pull-right">
        <button class="btn btn-outline-primary header-white" style="position: relative; right: 125%">비품관리 페이지로 돌아가기</button>
    </div>
</div>