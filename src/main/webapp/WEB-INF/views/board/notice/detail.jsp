<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<link href="path_to_summernote/summernote.css" rel="stylesheet">
<script src="path_to_summernote/summernote.js"></script>


	<div class="container-fluid">
	
		<div class="row justify-content-center my-4">
			<h1 class="col-md-7 text-center">공지사항 상세</h1>
		</div>
		
		<div class="row justify-content-center my-4">
			<form class="col-md-7" action="./add" method="post" id="frm" enctype="multipart/form-data">
			
                
	                
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
					        <input type="text" name="not_title" class="form-control" id="not_title" placeholder="제목 입력">
					    </div>
					</div>


					<!-- 내용 필수 조건 -->
					<div class="mb-3">
						<label for="not_contents" class="form-label">내용 (필수)</label>
						<textarea name="proContents" class="form-control" id="not_contents" placeholder="내용 입력" rows="7"></textarea>
					</div>
	 				<div class="mb-3">
	                    <label for="pic" class="form-label">첨부파일</label>
	                    <input type="file" name="photos" class="form-control" id="pic" placeholder="+">
	                </div>
					
               
					<div id="fileList" class="my-5"></div>
							
					<div class="mb-3">
						<button class="my btn btn-danger" type="button"><a href="./update">글수정</a></button>
					</div>
					<div class="mb-3">
						<button class="my btn btn-danger" type="submit" id="btn-delete">글삭제</button>
					</div>
			
			</form>
		</div>
	</div>



	
