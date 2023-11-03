<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>

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
		        <textarea name="proContents" class="form-control" id="not_contents" placeholder="내용입니다" rows="7"></textarea>
		    </div>
           <div class="mb-3">
			    <button onclick="createCommentInput()">댓글 달기</button>
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
                    <div>
                    	<table>
                    		<tr>
				                <td>김아무개</td>
				            </tr>
				            <tr>
				                <td>김아무개2</td>
				            </tr>
				            <tr>
				                <td>김아무개3</td>
				            </tr>
                    	</table>
                    </div>
                </div>
                <button class="btn btn-primary" type="button" id="loadMoreParticipants">더 보기</button>
            </div>
            <div class="mb-3 square-content">
                <button class="btn btn-primary pull-right square-button" type="button">참가하기</button>
            </div>
        </div>
        
        			<!-- 글수정,삭제는 해당글을 작성한사람과 인사과만 버튼이 보여진다 -->	
					<!-- <div class="mb-3">
						<button class="my btn btn-primary" type="button"><a href="./update" style="color: white;">글수정</a></button>
					</div> -->
					
    </div>
</div>

<script>
var commentInputVisible = false;

function createCommentInput() {
    if (!commentInputVisible) {
        // 댓글 입력창 생성
        var commentInput = document.createElement("input");
        commentInput.type = "text";
        commentInput.name = "comment";
        commentInput.placeholder = "댓글 입력";

        // 댓글 등록 버튼 생성
        var submitButton = document.createElement("button");
        submitButton.textContent = "댓글 등록";
        submitButton.onclick = function() {
            var commentText = commentInput.value;
            if (commentText) {
                addComment(commentText);
                commentInput.value = '';
            }
        };

        // 댓글 입력창과 댓글 등록 버튼을 묶어 주기 위한 div 생성
        var inputContainer = document.createElement("div");
        inputContainer.appendChild(commentInput);
        inputContainer.appendChild(submitButton);

        // 댓글 입력창을 댓글 리스트 위에 추가
        var commentList = document.getElementById("commentList");
        commentList.insertBefore(inputContainer, commentList.firstChild);

        // 댓글 입력 버튼 숨김
        var commentButton = document.querySelector('button');
        commentButton.style.display = 'none';

        // 상태 업데이트
        commentInputVisible = true;
    }
}

function addComment(commentText) {
    // 여기에서 댓글을 추가하고 목록에 표시하는 로직을 구현합니다.
}
</script>

	
