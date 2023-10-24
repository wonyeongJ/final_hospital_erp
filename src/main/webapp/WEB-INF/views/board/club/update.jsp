<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="path_to_summernote/summernote.css" rel="stylesheet">
<script src="path_to_summernote/summernote.js"></script>

<div class="container-fluid">
    <form class="col-md-7" action="./update" method="post" id="frm" enctype="multipart/form-data" style="max-width: 100% !important">
        <div class="row">
            <!-- 왼쪽 컬럼 - 동호회 정보 -->
            <div class="col-md-7 pull-left" style="width: 70%">
                <div class="mb-3">
                    <h3>동호회 정보</h3>
                    <span class="input-group-text">작성자: ${member.mem_name}</span>
                </div>
                <div class="mb-3">
                    <label for="not_title" class="form-label">제목 (필수)</label>
                    <div class="input-group">
                        <input type="text" name="not_title" class="form-control" id="not_title" placeholder="제목 입력">
                    </div>
                </div>
                <!-- 썸머노트 에디터를 사용할 textarea -->
                <div class="mb-3">
                    <label for="not_contents" class="form-label">내용 (필수)</label>
                    <div class="input-group">
                        <textarea name="not_contents" class="summernote"></textarea>
                    </div>
                </div>

                <!-- 최대 모집 인원 -->
                <div class="mb-3">
                    <label for="maxParticipants" class="form-label">최대 모집 인원:</label>
                    <div class="d-flex align-items-center">
                        <button class="btn btn-outline-secondary" type="button" id="decrease">-</button>
                        <input type="number" class="form-control" id="maxParticipants" name="maxParticipants" min="2" value="2" style="width: 70px">
                        <button class="btn btn-outline-secondary" type="button" id="increase">+</button>
                    </div>
                </div>
            </div>

            <!-- 오른쪽 컬럼 - 모집 인원, 참가자, 더 보기 버튼, 참가하기 버튼 -->
            <div class="col-md-5 pull-right square-column">
                <div class="mb-3 square-content">
                    <h3>모집 정보</h3>
                    <span class="input-group-text pull-right">모집인원: {모집인원수}</span>
                </div>
                <div class="mb-3 square-content">
                    <h4>참가자 목록</h4>
                    <!-- 참가자 목록을 스크롤로 보여주는 영역 -->
                    <div id="participantList" class="square-scroll">
                        <!-- 참가자 목록을 여기에 동적으로 추가 -->
                    </div>
                    <button class="btn btn-primary" type="button" id="loadMoreParticipants">더 보기</button>
                </div>
                <div class="mb-3 square-content">
                    <h3>모집상태 변경</h3>
                    <select class="form-select" id="recruitmentStatus">
                        <option value="모집중">모집중</option>
                        <option value="모집완료">모집완료</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="mb-3">
            <button class="my btn btn-primary" type="submit" id="btn-update">수정완료</button>
        </div>
    </form>
</div>
<script>
    // 썸머노트 초기화
    $('.summernote').summernote({
        height: 150
    });
</script>