<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<h1>약품</h1>
	<br>
<h2>약품 조회</h2>
	<br><br>
<select class="custom-select col-12" name="drug">
	<c:forEach items="${drugs}" var="drug" varStatus="status">
		<option value="${drug}">${drug}</option>
	</c:forEach>
</select>