<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/summernote.jsp"></c:import>
<script src="/vendors/scripts/board/file.js"></script>
<link rel="stylesheet" href="/vendors/styles/board/updateFile.css">

<div class="container-fluid">
    <div class="row justify-content-center my-4">
        <h1 class="col-md-7 text-center">동호회 수정</h1>
    </div>

    <div class="row justify-content-center my-4">
        <form class="col-md-7" action="../update" method="post" id="frm" enctype="multipart/form-data">
            <input type="hidden" name="clubCd" readonly="readonly" value="${data.clubCd}">
  
            <div class="pull-right">
                <span class="input-group-text">${data.depName} : ${data.memName}</span>
            </div>

            <div class="mb-3">
                <label for="clubTitle" class="form-label">제목 (필수)</label>
                <div class="input-group">
                    <input type="text" name="clubTitle" class="form-control" id="clubTitle" value="${data.clubTitle}">
                </div>
            </div>

            <!-- 썸머노트 에디터를 사용할 textarea -->
            <div class="mb-3">
                <label for="clubContents" class="form-label">내용 (필수)</label>
                <div class="input-group">
                    <textarea name="clubContents" class="summernote">${data.clubContents}</textarea>
                </div>
            </div>

            <div class="mb-3">
                <label for="clubPersonnel" class="form-label">모집 인원 :</label>
                <div class="d-flex align-items-center">
                    <button class="btn btn-outline-secondary" type="button" id="decrease">-</button>
                    <input type="number" class="form-control" id="clubPersonnel" name="clubPersonnel" max="30" value="${data.clubPersonnel}" style="width: 70px">
                    <button class="btn btn-outline-secondary" type="button" id="increase">+</button>
                </div>
                <input type="hidden" id="currentMembers" value="${data.currentMembers}">
            </div>

            <!-- 파일 -->
            <div class="mb-3">
                <button type="button" class="btn btn-primary" id="insert">파일 추가</button>
            </div>
            <div id="fileList" class="my-5">
                <c:forEach items="${data.list}" var="f">
                    <div class="file-item mb-2">
                        <span class="alert alert-primary me-2" role="alert" id="${f.bfCd}">
                            첨부파일: ${f.bfOname}
                        </span>
                        <span class="delets" data-delete-num="${f.bfCd}" data-file-name="${f.bfFname}">X</span>
                    </div>
                </c:forEach>
            </div>

            <div class="mb-3">
                <button class="my btn btn-primary" type="submit" id="btn-update">수정완료</button>
            </div>
        </form>
    </div>
</div>

<script>
    // 썸머노트 초기화
    $('.summernote').summernote({
        height: 300
    });
</script>
<script src="/vendors/scripts/board/ClubUpdate.js"></script>

