<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/summernote.jsp"></c:import>
<script src="/vendors/scripts/board/file.js"></script>

<div class="container-fluid">
    <div class="row justify-content-center my-4">
        <h1 class="col-md-7 text-center">동호회 등록</h1>
    </div>

    <div class="row justify-content-center my-4">
        <form class="col-md-7" action="./insert" method="post" id="frm" enctype="multipart/form-data">
            

            <div class="pull-right">
                <span class="input-group-text">${depName} : ${memName}</span>
            </div>

            <div class="mb-3">
                <label for="clubTitle" class="form-label">제목 (필수)</label>
                <div class="input-group">
                    <input type="text" name="clubTitle" class="form-control" id="clubTitle" placeholder="제목 입력">
                </div>
            </div>

           <input class="form-control" name="memCd" value="${memCd}" style="display: none;">

            <!-- 썸머노트 에디터를 사용할 textarea -->
            <div class="mb-3">
                <label for="club_contents" class="form-label">내용 (필수)</label>
                <div class="input-group">
                    <textarea name="clubContents" class="summernote"></textarea>
                </div>
            </div>
			<div class="mb-3">
					    <label for="clubPersonnel" class="form-label">모집 인원 :</label>
					    <div class="d-flex align-items-center">
					        <button class="btn btn-outline-secondary" type="button" id="decrease">-</button>
					        <input type="number" class="form-control" id="clubPersonnel" name="clubPersonnel" min="2" value="2" style="width: 70px">
					        <button class="btn btn-outline-secondary" type="button" id="increase">+</button>
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


<script>
		    // JavaScript를 사용하여 모집 인원 조절 버튼을 제어
		    const maxParticipantsInput = document.getElementById("clubPersonnel");
		    const decreaseButton = document.getElementById("decrease");
		    const increaseButton = document.getElementById("increase");
		
		    decreaseButton.addEventListener("click", () => {
		        if (maxParticipantsInput.value > 2) {
		            maxParticipantsInput.value = parseInt(maxParticipantsInput.value) - 1;
		        }
		    });
		
		    increaseButton.addEventListener("click", () => {
		        maxParticipantsInput.value = parseInt(maxParticipantsInput.value) + 1;
		    });
</script>