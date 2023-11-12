<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<h1>직원관리</h1>
	<h3>  직원조회</h3>

		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
	
				<!-- Export Datatable start -->
				<div class="card-box mb-30">
					<div class="pd-20">
						<h4 class="text-blue h4">직원목록(재직자)</h4>
					</div>
					<div class="pb-20">
						<table class="table hover multiple-select-row datatable2 nowrap">
							<thead>
								<tr>
									<th class="table-plus datatable-nosort">No</th>
									<th>이름</th>
									<th>사번</th>
									<th>과</th>
									<th>직무</th>
									<th>입사일</th>
									<th>연차</th>
									<th>근무시간</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${memberAr}" var="memberVO" varStatus="i">	 
								<tr>
									<th class="table-plus">${i.index+1}</th>
									<td><a href="./data?memCd=${memberVO.memCd}">${memberVO.memName}</a></td>
									<td><a href="./data?memCd=${memberVO.memCd}">${memberVO.memCd}</a></td>
									<td>${memberVO.depName}</td>
									<td>${memberVO.codeName}</td>
									<td>${memberVO.memHdate}</td>
									<td>${memberVO.memAnnual}</td>
									<td>${memberVO.worktime }</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- Export Datatable End -->
			</div>
		</div>
	
	