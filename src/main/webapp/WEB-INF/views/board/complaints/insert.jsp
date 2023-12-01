<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/summernote.jsp"></c:import>
<script src="/vendors/scripts/board/file.js"></script>

<div class="container-fluid">
    <div class="row justify-content-center my-4">
        <h1 class="col-md-7 text-center">민원게시판 등록</h1>
    </div>

    <div class="row justify-content-center my-4">
        <form class="col-md-7" action="./insert" method="post" id="frm" enctype="multipart/form-data">
            <div class="form-check form-check-inline mb-3">
                <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="compSecret" value="1">
                <label class="form-check-label" for="inlineCheckbox1">비밀글</label>
                <input type="hidden" name="compSecret" value="0"> <!-- 기본값으로 0을 설정 -->
            </div>

            <div>
                <div>
                    <label for="codeCd">민원종류 선택 :</label>
                    <select id="codeCd" name="codeCd">
                        <option value="19">환자민원</option>
                        <option value="20">시설민원</option>
                        <option value="21">사내민원</option>
                    </select>
                </div>
            </div>

            <div class="pull-right">
                <span class="input-group-text">${depName} : ${memName}</span>
            </div>

            <div class="mb-3">
                <label for="compTitle" class="form-label">제목 (필수)</label>
                <div class="input-group">
                    <input type="text" name="compTitle" class="form-control" id="compTitle" placeholder="제목 입력">
                </div>
            </div>

           <input class="form-control" name="memCd" value="${memCd}" style="display: none;">

            <!-- 썸머노트 에디터를 사용할 textarea -->
            <div class="mb-3">
                <label for="complaints_contents" class="form-label">내용 (필수)</label>
                <div class="input-group">
                    <textarea name="compContents" class="summernote"></textarea>
                </div>
            </div>

            <div class="mb-3">
			    <button type="button" class="btn btn-primary" id="insert">파일 추가 <i class="icon-copy fi-upload"></i></button>
			</div>
			<div id="fileList" class="my-5">
			    <!-- 초기에는 아무 파일 입력 상자도 없습니다. -->
			</div>

            <div class="mb-3">
                <button class="my btn btn-primary" type="submit" id="btn">글쓰기</button>
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
<script src="/vendors/scripts/board/ComplaintsInsert.js"></script>
