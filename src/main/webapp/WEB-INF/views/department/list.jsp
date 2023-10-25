<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
	<h1>부서관리</h1>
	<h3></h3>

		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<!-- Bordered table  start -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4">부서 목록</h4>
						</div>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">부서코드</th>
								<th scope="col">부서이름</th>
								<th scope="col">내선번호</th>
								<th scope="col">상태</th>
								<th scope="col">부서생성일</th>
								<th scope="col">Tag</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${departmentList}" var="departmentVO"> 
							<tr>
								<th scope="row">${departmentVO.depCd}</th>
								<td>${departmentVO.depName}</td>
								<td>${departmentVO.depTnum}</td>
								<td>${departmentVO.depDelete}</td>
								<td>${departmentVO.depRdate}</td>
								<td><button type="button" class="btn btn-success">수정</button></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				<div style="display: flex; justify-content: flex-end;">
					<a type="button" class="btn btn-primary" href="./insert">부서등록</a>
				</div>
				</div>
				<!-- Bordered table End -->
				
			</div>
		</div>
	
</body>
