<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<h1>수술실/비품관리</h1>
	<br>
<h2>비품등록</h2>
	<br><br>

<div class="pd-20 card-box mb-30">
    <form action="">
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">시리얼넘버</label>
            <div class="col-sm-12 col-md-10">
                <input class="form-control" type="text" name="" placeholder="serial number">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">항목</label>
            <div class="col-sm-12 col-md-10">
                <select class="custom-select col-12">
                    <option selected="">choose category</option>
                    <option value="1">의자</option>
                    <option value="2">책상</option>
                    <option value="3">노트북</option>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">구매날짜</label>
            <div class="col-sm-12 col-md-10">
                <input class="form-control datetimepicker" placeholder="Choose Date and time" type="text">
            </div>
        </div>
    </form>
    <div class="clearfix mb-20">
        <div class="pull-right">
            <input type="button" id="" class="btn btn-outline-primary header-white" value="비품등록"></button>
        </div>
    </div>
</div>