<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>전자결재</h1>
<h2>내결재함</h2>

<!-- modal -->
<!-- <div class="col-md-2 col-sm-12 mb-30">
	<div class="pd-20 card-box height-100-p">
							
		<a href="#" class="btn-block" data-toggle="modal" data-target="#Medium-modal" type="button">
			<h5 class="h4" alt="modal">결재문서작성</h5>
		</a>
		<div class="modal fade" id="Medium-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myLargeModalLabel">문서리스트</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					</div>
					<div class="modal-body">
							<a type="button" class="btn btn-secondary" href="/payment/insert">휴가신청</a>
							<a type="button" class="btn btn-secondary" href="/payment/insert">지출결의서</a>
							<a type="button" class="btn btn-success" href="/payment/formInsert">문서양식추가</a>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div> -->

<div>
	
</div>

<div>
	<button type="button" class="btn btn-secondary">전체결재문서</button>
	<button type="button" class="btn btn-secondary">승인대기문서</button>
	<button type="button" class="btn btn-secondary">결재수신문서</button>
	<button type="button" class="btn btn-secondary">참조문서</button>
	<button type="button" class="btn btn-secondary">기안문서</button>
	<button type="button" class="btn btn-secondary">임시저장</button>
	<a type="button" class="btn btn-success" href="/payment/documentForm/list">결재문서작성</a>
</div>

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
										<td><a href="./detail?boardNo=${vo.epCd}">${vo.epTitle}</a></td>
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
										<c:if test="${empty vo.conPStatus}"> 
											<td>결재라인이 추가되지 않음</td>
										</c:if>
										<c:if test="${vo.epDStatus eq '0'}"> 
											<td>미결</td>
										</c:if>
										<c:if test="${vo.epDStatus eq '1'}"> 
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