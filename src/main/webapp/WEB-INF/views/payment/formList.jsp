<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>전자결재</h1>
<h2>결재문서작성</h2>

<div>
	<a type="button" class="btn btn-danger" href="/payment/documentForm/insert">문서양식추가</a>
</div>

<div>
	<c:forEach items="${list}" var="vo">
		<input type="button" class="btn btn-success btn-formData" data-dfCd="${vo.dfCd}" id="${vo.dfCd}" value="${vo.dfKind}">
	</c:forEach>
</div>


<div id="ajaxResult">

</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function () {
		$(".btn-formData").on("click", function () {
			dfCodeResult=$(this).attr('id');
	        console.log(dfCodeResult);
			console.log($(this).attr('id'));
			console.log($(this).val());
			console.log(this);
			console.log($(this));
			$.ajax({
			    type : 'get', // 타입 (get, post, put 등등)
			    url : '/payment/insert?dfCd='+dfCodeResult, // 요청할 서버url
			    //async : true, // 비동기화 여부 (default : true)
 			    //dataType : 'json', // 데이터 타입 (html, xml, json, text 등등)
			    /* data : JSON.stringify({ // 보낼 데이터 (Object , String, Array)
			      "DF_KIND" : '1',
			      "DF_VTAB" : '1',
			      "DF_OTAB" : '1',
			      "DF_DTAB" : '1',
			      "DF_PTAB" : '1',
			      "DF_LTAB" : '1',
			      "DF_IN1TAB" : '1',
			      "DF_IN2TAB" : '1',
			      "DF_IN3TAB" : '1',
			      "DF_CONTENTS" : '1',
			    }), */ 
			    contentType : 'application/json; charset=utf-8',
			    success : function(result) { // 결과 성공 콜백함수
			        $('#ajaxResult').empty();
			    	$('#ajaxResult').append(result);
			    },
			    error : function(request, status, error) { // 결과 에러 콜백함수
			        console.log(error)
			    }
			})
		});
	});
</script>