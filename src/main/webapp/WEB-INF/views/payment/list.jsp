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
	<button type="button" class="btn btn-secondary btn-listResult" id="listResult1">전체결재문서</button>
	<button type="button" class="btn btn-secondary btn-listResult" id="listResult2">승인대기문서</button>
	<button type="button" class="btn btn-secondary btn-listResult" id="listResult3">결재수신문서</button>
	<button type="button" class="btn btn-secondary btn-listResult" id="listResult4">참조문서</button>
	<button type="button" class="btn btn-secondary btn-listResult" id="listResult5">기안문서</button>
	<button type="button" class="btn btn-secondary btn-listResult" id="listResult6">임시저장</button>
	<a type="button" class="btn btn-success" href="/payment/documentForm/list">결재문서작성</a>
</div>

<div id="ajaxListResult">

</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function () {
		$(".btn-listResult").on("click", function () {
			dfCodeResult=$(this).attr('id');
	        console.log(dfCodeResult)
 			$.ajax({
			    type : 'get', // 타입 (get, post, put 등등)
			    url : '/payment/listResult', // 요청할 서버url
			    data : {
			    	dfCodeResult : dfCodeResult
			    },
			    contentType : 'application/json; charset=utf-8',
			    success : function(result) { // 결과 성공 콜백함수
			        $('#ajaxListResult').empty();
			    	$('#ajaxListResult').append(result);
			    },
			    error : function(request, status, error) { // 결과 에러 콜백함수
			        console.log(error)
			    }
			}) 
		});
	});
</script>