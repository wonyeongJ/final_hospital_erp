<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid">
	
		<div class="row justify-content-center my-4">
			<h1 class="col-md-7 text-center">공지사항 상세</h1>
		</div>
		
		<div class="row justify-content-center my-4">
				
				<div class="container-fluid">	  
	               
					  <div class="pull-right">
							<span class="input-group-text">작성자 : ${data.memCd}</span>					  
					  </div>
					
                
					
					<div class="mb-3">
					    <label for="not_title" class="form-label">제목</label>
					    <div>
					        ${data.notTitle}
					    </div>
					</div>


					<!-- 내용 필수 조건 -->
					<div class="mb-3">
						<label for="not_contents" class="form-label">내용</label>
						<div>
							${data.notTitle}
						</div>	
					</div>
					</div>
	 				<!-- <div class="mb-3">
	                    <label for="pic" class="form-label">첨부파일</label>
	                    <div type="file" name="photos" class="form-control" id="pic" placeholder="+"></div>
	                </div>
					
               
					<div id="fileList" class="my-5"></div>
					 -->
					<!-- 글수정,삭제는 인사과만 버튼이 보여진다 -->	
					<div class="mb-3">
						<button class="my btn btn-primary" type="button"><a href="./update" style="color: white;">글수정</a></button>
						<button class="my btn btn-primary" type="submit" id="btn-delete">글삭제</button>
					</div>
		</div>
	</div>

</div>
