<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- Site favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="/vendors/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/vendors/images/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/vendors/images/favicon-16x16.png">

	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="/vendors/styles/core.css">
	<link rel="stylesheet" type="text/css" href="/vendors/styles/main.css">
	<link rel="stylesheet" type="text/css" href="/vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="/src/plugins/datatables/css/responsive.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="/vendors/styles/style.css">
	<link rel="stylesheet" type="text/css" href="/src/plugins/switchery/switchery.min.css">
	<!-- bootstrap-tagsinput css -->
	<link rel="stylesheet" type="text/css" href="/src/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css">
	<!-- bootstrap-touchspin css -->
	<link rel="stylesheet" type="text/css" href="/src/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.css">
	

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
								<c:if test="${empty vo.conPStatus}"> 
									<td>결재라인이 추가되지 않음</td>
								</c:if>
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
	
		<!-- js -->
	<script src="/vendors/scripts/core.js"></script>
	<script src="/vendors/scripts/script.min.js"></script>
	<script src="/vendors/scripts/process.js"></script>
	<script src="/vendors/scripts/layout-settings.js"></script>
	<script src="/src/plugins/apexcharts/apexcharts.min.js"></script>
	<script src="/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script src="/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script src="/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script src="/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
	<!-- <script src="/vendors/scripts/dashboard.js"></script> -->
	<script src="/src/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
	<script src="/src/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
	<script src="/vendors/scripts/advanced-components.js"></script>
	<!-- buttons for Export datatable -->
	<script src="/src/plugins/datatables/js/dataTables.buttons.min.js"></script>
	<script src="/src/plugins/datatables/js/buttons.bootstrap4.min.js"></script>
	<script src="/src/plugins/datatables/js/buttons.print.min.js"></script>
	<script src="/src/plugins/datatables/js/buttons.html5.min.js"></script>
	<script src="/src/plugins/datatables/js/buttons.flash.min.js"></script>
	<script src="/src/plugins/datatables/js/pdfmake.min.js"></script>
	<script src="/src/plugins/datatables/js/vfs_fonts.js"></script>
	<!-- Datatable Setting js -->
	<script src="/vendors/scripts/datatable-setting.js"></script>
	
	<!-- 토글 가져오는 js -->
	<script src="/src/plugins/switchery/switchery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/orgchart/3.8.0/js/jquery.orgchart.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/orgchart/3.8.0/js/jquery.orgchart.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/orgchart/3.8.0/js/jquery.orgchart.min.js.map"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" ></script>