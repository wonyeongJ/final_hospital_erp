<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

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
        <div class="form-group row">
            <label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">시작 일시</label>
            <div class="col-sm-12 col-md-10">
                <input class="form-control" placeholder="Choose Start Date and time" type="text" value="2023-10-11" readonly>
            </div>
        </div>
        <div class="form-group row">
            <label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">종료 일시</label>
            <div class="col-sm-12 col-md-10">
                <input class="form-control" placeholder="Choose End Date and time" type="text" value="2023-10-12" readonly>
            </div>
        </div>
        <div class="form-group">
            <label>상세 내용</label>
            <textarea class="form-control" placeholder="contents" readonly>세미나 참석</textarea>
        </div>
    </form>
    <div class="clearfix mb-20">
        <div class="pull-right">
            <a href="update" class="btn btn-outline-primary header-white">일정 수정</a>
        </div>
    </div>
</div>