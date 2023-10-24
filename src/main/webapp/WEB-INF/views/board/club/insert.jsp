<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<link href="path_to_summernote/summernote.css" rel="stylesheet">
<script src="path_to_summernote/summernote.js"></script>


	<div class="container-fluid">
	
		<div class="row justify-content-center my-4">
			<h1 class="col-md-7 text-center">모임 등록</h1>
		</div>
		
		<div class="row justify-content-center my-4">
			<form class="col-md-7" action="./insert" method="post" id="frm" enctype="multipart/form-data">
			
				
					
                
	                
	               
					  <div class="pull-right">
							<span class="input-group-text">작성자 : ${member.mem_name}</span>					  
					  </div>
					
                
					
					<div class="mb-3">
					    <label for="not_title" class="form-label">제목 (필수)</label>
					    <div class="input-group">
					        <input type="text" name="not_title" class="form-control" id="not_title" placeholder="제목 입력">
					    </div>
					</div>


					<!-- 내용 필수 조건 -->
					<div class="mb-3">
						<label for="not_contents" class="form-label">내용 (필수)</label>
						<textarea name="proContents" class="form-control" id="not_contents" placeholder="내용 입력" rows="7"></textarea>
					</div>
	 				
					
               
               		 <div class="mb-3">
			            <label for="maxParticipants" class="form-label">최대 모집 인원:</label>
			            <div class="input-group">
			                <input type="number" class="form-control" id="maxParticipants" name="maxParticipants" min="2" value="2">
			                <button class="btn btn-outline-secondary" type="button" id="decrease">-</button>
			                <button class="btn btn-outline-secondary" type="button" id="increase">+</button>
			            </div>
			        </div>
							
					<div class="mb-3">
						<button class="my btn btn-primary" type="submit" id="btn">글쓰기</button>
					</div>
			
			</form>
		</div>
	</div>

		<script>
		    // JavaScript를 사용하여 모집 인원 조절 버튼을 제어
		    const maxParticipantsInput = document.getElementById("maxParticipants");
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

	
