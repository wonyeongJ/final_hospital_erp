<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="/WEB-INF/views/layout/summernote.jsp"></c:import>
<script src="/vendors/scripts/board/file.js"></script>
<link rel="stylesheet" href="/vendors/styles/board/updateFile.css">

<div class="container-fluid">
    <div class="row justify-content-center my-4">
        <h1 class="col-md-7 text-center">민원 수정</h1>
    </div>

    <div class="row justify-content-center my-4">
        <form class="col-md-7" action="./update" method="post" id="frm" enctype="multipart/form-data">
            <input type="hidden" name="compCd" readonly="readonly"  value="${board.compCd}">

            <div class="form-check form-check-inline mb-3">
                <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="compSecret" value="1">
                <label class="form-check-label" for="inlineCheckbox1">비밀글 (수정시 꼭 확인바람)</label>
                <input type="hidden" name="compSecret" value="0"> <!-- 기본값으로 0을 설정 -->
            </div>
            <div class="pull-right">
                <span class="input-group-text">인사과: 홍길동</span>
            </div>
            <!-- 해당 글의 민원종류로 Selected -->
					 <div>
					 	 <div>
		                  <label for="code_cd">민원종류 선택 :</label>
						    <select id="code_cd" name="code_cd">
						        <option value="19">환자민원</option>
						        <option value="20">시설민원</option>
						        <option value="21">사내민원</option>
						    </select>
						</div>
					 </div>

            <div class="mb-3">
                <label for="compTitle" class="form-label">제목 (필수)</label>
                <div class="input-group">
                    <input type="text" name="compTitle" class="form-control" id="compTitle" value="${board.compTitle}">
                </div>
            </div>

            <!-- 썸머노트 에디터를 사용할 textarea -->
            <div class="mb-3">
                <label for="compContents" class="form-label">내용 (필수)</label>
                <div class="input-group">
                    <textarea name="compContents" class="summernote">${board.compContents}</textarea>
                </div>
            </div>
            
            <!-- 파일 -->
            <div class="mb-3">
                <button type="button" class="btn btn-primary" id="insert">파일 추가</button>
            </div>
            <div id="fileList" class="my-5">
                <c:forEach items="${board.list}" var="f">
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
        height: 150
    });
</script>
