<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="/vendors/styles/equipment/data.css">
<link rel="stylesheet" href="/vendors/styles/equipment/list.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<h1>수술실/비품관리</h1>
	<br>
<h2>비품 상세</h2>
	<br><br>

<table class="table table-bordered" style="text-align: center;">
    <thead>
        <tr id="table-top">
            <th scope="col">물품 구매일</th>
            <th scope="col">항목</th>
            <th scope="col">시리얼넘버</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">${pDate}</th>
            <td>${codeVO.codeName}</td>
            <td>${equipmentVO.equSnum}</td>
        </tr>
    </tbody>
</table>
    <br>
<table class="table table-bordered" style="text-align: center;">
    <thead>
        <tr id="table-top">
            <th scope="col">대여자</th>
            <th scope="col">대여 날짜</th>
            <th scope="col">반납 날짜</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${equipmentHistory}" var="equH">
            <tr>
                <th scope="row">${equH.memName}</th>
                <td>${equH.processedSdate}</td>
                <td>${equH.processedRedate}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
    <br>
<div class="pull-right">
    <a href="#" class="btn-block" data-toggle="modal" data-target="#Medium-modal-1" type="button" style="display: block;">
        <button class="btn btn-outline-primary">비품 수정</button>
    </a>
    <div class="modal fade" id="Medium-modal-1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myLargeModalLabel">비품 수정</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <div class="pd-20 card-box mb-30">
                        <div class="form-group row">
                            <label class="col-sm-12 col-md-2 col-form-label">시리얼넘버</label>
                            <div class="col-sm-12 col-md-10">
                                <input class="form-control" type="text" name="equSnum" value="${equipmentVO.equSnum}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-12 col-md-2 col-form-label">항목</label>
                            <div class="col-sm-12 col-md-10">
                                <select class="custom-select col-12" name="codeName">
                                    <option selected="">choose category</option>
                                    <c:forEach items="${categories}" var="category">
                                        <option value="${category.codeName}">${category.codeName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">구매날짜</label>
                            <div class="col-sm-12 col-md-10">
                                <input class="form-control datetimepicker" placeholder="Choice Date and Time" type="text" name="">
                            </div>
                        </div>
                        <div class="clearfix mb-20">
                            <div class="pull-right" value="${equipmentVO.equCd}">
                                <input type="button" id="" class="btn btn-outline-primary equipment-update-btn" value="비품 수정"></button>
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
    <button class="btn btn-outline-primary equipment-delete-btn" value="${equipmentVO.equCd}">비품 삭제</button>
</div>
    <br><br>

<script src="/vendors/scripts/equipment/data.js"></script>