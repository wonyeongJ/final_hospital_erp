<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/summernote.jsp"></c:import>


		<div class="container-fluid">
		    <div class="row">
			    <form class="col-md-12" action="./update" method="post" id="frm" enctype="multipart/form-data">
			       <div>
			       		<div class="col-md-7 pull-left">
			            	<div class="mb-3">
			                	<h3>동호회 정보</h3>
			                	<span class="input-group-text">작성자 : 홍길동${member.memName}</span>
			            	</div>
			            		<div class="mb-3">
			                		<label for="not_title" class="form-label">제목</label>
			                		<div class="input-group">
			                    		<input type="text" name="not_title" class="form-control" id="not_title" placeholder="제목 입력">
			                		</div>
			            		</div>
			            	
			            		<div>
				            		<!-- 게시글 내용 -->
						    		<div class="mb-3">
						        		<h3>게시글 내용</h3>
						        		<textarea name="proContents" class="form-control" id="not_contents" placeholder="내용입니다" rows="7"></textarea>
						    		</div>
						    		<div class="mb-3">
									    <label for="maxParticipants" class="form-label">최대 모집 인원:</label>
									    <div class="d-flex align-items-center">
									        <button class="btn btn-outline-secondary" type="button" id="decrease">-</button>
									        <input type="number" class="form-control" id="maxParticipants" name="maxParticipants" min="2" value="2" style="width: 70px">
									        <button class="btn btn-outline-secondary" type="button" id="increase">+</button>
									    </div>
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
							        </div>
								</div>
							</div>
							<div class="mb-3">
								<button class="my btn btn-primary" type="submit">수정완료</a></button>
							</div>	
					</div>
				</form>
		    </div>	
    


<script>
    // 썸머노트 초기화
    $('.summernote').summernote({
        height: 150
    });
</script>		
					