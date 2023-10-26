<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>전자결재</h1>
<h2>결재문서작성</h2>

<div>
	<a type="button" class="btn btn-secondary" >휴가신청</a>
	<a type="button" class="btn btn-secondary" >지출결의서</a>
	<a type="button" class="btn btn-success" href="/payment/formInsert">문서양식추가</a>
</div>
<br><br><br><br>
<div class="form-group">
	<label>문서양식 ajax로 불러올 장소</label>
	<textarea class="form-control"></textarea>
</div>