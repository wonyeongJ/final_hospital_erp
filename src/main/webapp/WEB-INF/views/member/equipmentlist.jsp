<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<h5 class="h4 text-blue mb-20" style="display: flex;">비품사용내역</h5>
		<table class="table hover multiple-select-row  nowrap datatable4">
			<thead>
				<tr>
					<th class="table-plus datatable-nosort">No</th>
					<th>항목</th>
					<th>S/N</th>
					<th>대여일</th>
					<th>반납일</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${equipmentHistoryAr}" var="equipmentHistoryVO" varStatus="i">	 
				<tr>
					<th class="table-plus">${i.index+1}</th>
					<td>${equipmentHistoryVO.memName}</td>
					<td>${equipmentHistoryVO.ehSnum}</td>
					<td>${equipmentHistoryVO.processedSdate}</td>
					<td>${equipmentHistoryVO.processedRedate}</td>
					<td>
					<c:if test="${equipmentHistoryVO.ehReturn eq 1}">
					<span class="badge badge-success">
	                    <a class="history-delete-btn" id="a2" href="/equipment/historyDeleteMypage?ehCd=${equipmentHistoryVO.ehCd}" onclick='return confirm("해당 비품을 반납 하시겠습니까?");'>반납하기</a>
	                    </span>
	                				
					</c:if>
					<c:if test="${equipmentHistoryVO.ehReturn ne 1}">
											
					</c:if>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>

