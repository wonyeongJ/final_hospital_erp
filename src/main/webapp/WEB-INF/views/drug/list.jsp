<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<h1>약품</h1>
	<br>
<h2>약품 조회</h2>
	<br><br>

<div class="col-md-6" data-select2-id="8">
	<div class="form-group" data-select2-id="7">
		<label>약품 리스트</label>
		<select class="custom-select2 form-control select2-hidden-accessible" name="state" style="width: 100%; height: 38px;" data-select2-id="1" tabindex="-1" aria-hidden="true">
			<c:forEach items="${drugs}" var="drug" varStatus="status">
				<option value="${drug}" data-select2-id="${drug}">${status.count}. ${drug}</option>
			</c:forEach>
	</div>
</div>