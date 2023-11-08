<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<h1>&nbsp일정관리</h1>
	<br>
<h2>&nbsp일정 상세</h2>
    <br><br>
<div class="pd-20 card-box mb-30">
    <form action="">
        <!-- <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">상세 내용</label>
            <div class="col-sm-12 col-md-10">
                <input class="form-control" type="textarea" name="" placeholder="contents">
            </div>
        </div> -->
        <input type="hidden" id="schCd" value="${scheduleVO.schCd}">
        <div class="form-group row">
            <label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">시작 일시</label>
            <div class="col-sm-12 col-md-10">
                <input class="form-control" placeholder="" type="text" value="${scheduleVO.startNumString}" readonly>
            </div>
        </div>
        <div class="form-group row">
            <label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">종료 일시</label>
            <div class="col-sm-12 col-md-10">
                <input class="form-control" placeholder="" type="text" value="${scheduleVO.endNumString}" readonly>
            </div>
        </div>
        <div class="form-group">
            <label>상세 내용</label>
            <textarea class="form-control" placeholder="contents" readonly>${scheduleVO.schDesc}</textarea>
        </div>
    </form>
    <div class="clearfix mb-20">
        <div class="pull-right">
            <c:choose> 
                <c:when test="${scheduleVO.codeCd eq 25}">
                    
                    <a href="#" class="btn-block" data-toggle="modal" data-target="#Medium-modal-1" type="button" style="display: block;">
                        <button class="btn btn-outline-primary">수정</button>
                    </a>
                    <div class="modal fade" id="Medium-modal-1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="myLargeModalLabel">개인 일정 수정</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body">
                                    <div class="pd-20 card-box mb-30">
                                            <div class="form-group row">
                                                <label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">시작</label>
                                                <div class="col-sm-12 col-md-10">
                                                    <input class="form-control datetimepicker" id="start" placeholder="${scheduleVO.startNumString}" type="text" readonly style="background-color: white;">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">종료</label>
                                                <div class="col-sm-12 col-md-10">
                                                    <input class="form-control datetimepicker" id="end" placeholder="${scheduleVO.endNumString}" type="text" readonly style="background-color: white;">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>상세 내용</label>
                                                <textarea class="form-control" id="desc" placeholder="contents">${scheduleVO.schDesc}</textarea>
                                            </div>
                                            <div class="clearfix mb-20">
                                                <div class="pull-right">
                                                    <input type="button" class="btn btn-outline-primary" id="personal-schedule-update" value="등록">
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
                    
                    <button class="btn btn-outline-primary" id="personal-schedule-delete">삭제</button>
                </c:when>
			</c:choose>
        </div>
    </div>
</div>

<script src="/vendors/scripts/schedule/data.js"></script>