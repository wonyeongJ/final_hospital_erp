<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>전자결재</h1>
<h2>전체결재함</h2>

<div>
	<div class="card-box mb-30">
					<div class="pd-20">
						<h4 class="text-blue h4">결재문서</h4>
					</div>
					<div class="pb-20">
						<div id="DataTables_Table_2_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
							<table class="datatable2 table nowrap" id="DataTables_Table_2" role="grid">
							
							<thead>
								<tr role="row">
									<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" >순번</th>
									<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" >결재분류</th>
									<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" >결재제목</th>
									<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" >기안자</th>
									<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" >기안날짜</th>
									<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" >결재차수</th>
									<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" >현재결재자</th>
									<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" >결재상태</th>
									<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" >문서상태</th>
								</tr>
							</thead>
							<tbody>
	 							<c:forEach items="${list}" var="vo">
									<tr role="row" class="odd">
										<td class="table-plus sorting_1" tabindex="0">${vo.epCd}</td>
										<td>${vo.dfKind}</td>
										<td><a href="./data?epCd=${vo.epCd}">${vo.epTitle}</a></td>
										<td>${vo.memName}</td>
										<td>${vo.epRDate}</td>
										<td>${vo.conStep}</td>
										<td>${vo.conmemName}</td>
										<c:if test="${vo.conPStatus eq '0'}"> 
											<td>결재중</td>
										</c:if>
										<c:if test="${vo.conPStatus eq '1'}"> 
											<td>반려</td>
										</c:if>
										<c:if test="${vo.conPStatus eq '2'}"> 
											<td>결재완료</td>
										</c:if>
										
											<td>완료</td>
										
										<c:if test="${vo.epDStatus eq '0'}"> 
											<td>미결</td>
										</c:if>
										<c:if test="${vo.epDStatus eq '1'}"> 
											<td>임시저장</td>
										</c:if>
										<c:if test="${vo.epDStatus eq '2'}"> 
											<td>종결</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
</div>