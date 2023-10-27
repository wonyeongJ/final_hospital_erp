<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/views/layout/summernote.jsp"></c:import>


<div class="container-fluid">
    <div class="row justify-content-center my-4">
        <h1 class="col-md-7 text-center">공지사항 등록</h1>
    </div>

    <div class="row justify-content-center my-4">
        <form class="col-md-7" action="/board/notice/insert" method="post" id="frm" enctype="multipart/form-data">
            <!-- 로그인 상태 확인 -->
           <%--  <c:if test="${empty member}">
                <div class="alert alert-danger">관리자만 등록가능합니다.</div>
            </c:if> --%>
            <div class="form-check form-check-inline mb-3">
                <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                <label class="form-check-label" for="inlineCheckbox1">중요공지여부</label>
            </div>
            
            <div class="pull-right">
                <span class="input-group-text">인사과 : 홍길동</span>
            </div>
           <div class="mb-3">
			    <label for="notTile" class="form-label">제목 (필수)</label>
			    <div class="input-group">
			        <input type="text" class="form-control" id="notTitle" name="notTitle" placeholder="제목 입력">
			    </div>
		   </div>
		   <div class="mb-3">
			    <label for="memCd" class="form-label">사번</label>
			    <div class="input-group">
			        <input type="text" class="form-control" id="memCd" name="memCd" placeholder="멤버가없기에일단 사번입력">
			    </div>
		   </div>
			
			<!-- 썸머노트 에디터를 사용할 textarea -->
			<div class="mb-3">
			    <label for="notContents" class="form-label">내용 (필수)</label>
			    <div class="input-group">
			        <textarea name="notContents" class="summernote"></textarea>
			    </div>
			</div>

           	<div class="mb-3">
		        <label for="files" class="form-label">첨부파일</label>
		        <input type="file" name="files" class="form-control" id="files" placeholder="+">
		    </div>
            <div id="fileList" class="my-5"></div>
            <div class="mb-3">
                <button class="my btn btn-primary" type="submit" id="btn">글쓰기</button>
            </div>
        </form>
    </div>
</div>

<script>
    // 썸머노트 초기화
    $('.summernote').summernote({
        height: 150
    });
</script>
<script>
	//폼 제출 시 중요공지여부 값을 변경하여 서버로 전송
	$('#frm').submit(function(event) {
	    var notImportant = $('#inlineCheckbox1').is(':checked') ? 1 : 0;
	    $('#frm').append('<input type="hidden" name="notImportant" value="' + notImportant + '">');
	});
</script>