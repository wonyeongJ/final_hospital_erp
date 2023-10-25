<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="container-fluid">
    <div class="row justify-content-center my-4">
        <h1 class="col-md-7 text-center">공지사항 등록</h1>
    </div>

    <div class="row justify-content-center my-4">
        <form class="col-md-7" action="./insert" method="post" id="frm" enctype="multipart/form-data">
            <!-- 로그인 상태 확인 -->
            <c:if test="${empty member}">
                <div class="alert alert-danger">관리자만 등록가능합니다.</div>
            </c:if>
            <div class="form-check form-check-inline mb-3">
                <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                <label class="form-check-label" for="inlineCheckbox1">중요공지여부</label>
            </div>
            <div class="pull-right">
                <span class="input-group-text">인사과: ${member.mem_name}</span>
            </div>
            <div class="mb-3">
                <label for="not_title" class="form-label">제목 (필수)</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="not_title" name="not_title" placeholder="제목 입력">
                </div>
            </div>
            <!-- 썸머노트 에디터를 사용할 textarea -->
            <div class="mb-3">
                <label for="not_contents" class="form-label">내용 (필수)</label>
                <div class="input-group">
                    <textarea name="not_contents" class="summernote"></textarea>
                </div>
            </div>
            <div class="mb-3">
                <label for="pic" class="form-label">첨부파일</label>
                <input type="file" name="photos" class="form-control" id="pic" placeholder="+">
            </div>
            <div id="fileList" class="my-5"></div>
            <div class="mb-3">
                <button class="my btn btn-danger" type="submit" id="btn">글쓰기</button>
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