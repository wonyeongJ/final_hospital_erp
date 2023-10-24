<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<link href="path_to_summernote/summernote.css" rel="stylesheet">
<script src="path_to_summernote/summernote.js"></script>

<div class="container-fluid">
    <div class="row">
        <!-- 왼쪽 컬럼 - 동호회 정보 -->
        <div class="col-md-7 pull-left">
            <div class="mb-3">
                <h3>동호회 정보</h3>
                <span class="input-group-text">작성자: ${member.memName}</span>
            </div>
            <div class="mb-3">
                <label for="not_title" class="form-label">제목 (필수)</label>
                <div class="input-group">
                    <input type="text" name="not_title" class="form-control" id="not_title" placeholder="제목 입력">
                </div>
            </div>
            <!-- 게시글 내용 -->
		    <div class="mb-3">
		        <h3>게시글 내용</h3>
		        <textarea name="proContents" class="form-control" id="not_contents" placeholder="내용 입력" rows="7"></textarea>
		    </div>
            <div class="mb-3">
                <h4>댓글 달기</h4>
                <input type="text" name="comment" class "form-control" id="comment" placeholder="댓글 입력">
            </div>
            <!-- 댓글 목록 -->
            <div id="commentList">
                <!-- 댓글 목록을 여기에 동적으로 추가 -->
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
                <button class="btn btn-primary pull-right square-button" type="button">참가하기</button>
            </div>
        </div>
        			<!-- 글수정,삭제는 해당글을 작성한사람과 인사과만 버튼이 보여진다 -->	
					<div class="mb-3">
						<button class="my btn btn-primary" type="button"><a href="./update" style="color: white;">글수정</a></button>
					</div>
					<div class="mb-3">
						<button class="my btn btn-primary" type="submit" id="btn-delete">글삭제</button>
					</div>
    </div>
</div>




	
