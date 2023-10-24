<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<h1>&nbsp일정관리</h1>
	<br>
<h2>&nbsp개인 일정 수정하기</h2>
    <br><br>
<div class="pd-20 card-box mb-30">
    <form action="">
        <!-- <div class="form-group row">
            <label class="col-sm-12 col-md-2 col-form-label">상세 내용</label>
            <div class="col-sm-12 col-md-10">
                <input class="form-control" type="textarea" name="" placeholder="contents">
            </div>
        </div> -->
        <div class="form-group row">
            <label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">시작 일시</label>
            <div class="col-sm-12 col-md-10">
                <input class="form-control datetimepicker" placeholder="Choose Start Date and time" type="text">
            </div>
        </div>
        <div class="form-group row">
            <label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">종료 일시</label>
            <div class="col-sm-12 col-md-10">
                <input class="form-control datetimepicker" placeholder="Choose End Date and time" type="text">
            </div>
        </div>
        <div class="form-group">
            <label>상세 내용</label>
            <textarea class="form-control" placeholder="contents"></textarea>
        </div>
    </form>
    <div class="clearfix mb-20">
        <div class="pull-right">
            <input type="button" id="" class="btn btn-outline-primary header-white" value="일정 수정"></button>
        </div>
    </div>
</div>