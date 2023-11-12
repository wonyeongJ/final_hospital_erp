<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/vendors/styles/board/clubData.css">



<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <div class="card-body" style=" align-items: flex-start;">
                    <div style="flex: 1;">
                        <h1 class="title" style="font-size: 2.0rem; text-align: center;">${data.clubTitle}</h1>
                        <div class="author-info" style="margin-left: auto; text-align: right;">
                        <span class="author-icon">${data.depName} : ${data.memName}</span>
                        <div class="author-icon">조회수: ${data.clubHit}</div>
                    	</div>

                        <!-- 줄 추가: 구분선 -->
                        <hr>

                        <div class="contents" style="text-align: center; margin-top: 20px;">${data.clubContents}</div>
                        <div>
                            <c:forEach items="${data.list}" var="f">
                                <a href="./fileDown?bfCd=${f.bfCd}" class="file-link">
                                    <li><i class="icon-copy fi-download"></i>${f.bfOname}</li>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                    
                </div>
            </div>
            <div style="display: flex; align-items: center;">
                <textarea id="commContents" rows="3" cols="50" placeholder="댓글을 입력하세요"
                         ></textarea>
                <button id="commentInsert" class="btn btn-primary" style="height: 80px; width: 65px; font-size: 10px">댓글등록</button>
                <input type="hidden" name="memCd" value="${memCd}">
                <input type="hidden" name="clubCd" value="${data.clubCd}">
            </div>
           <div id="commentList" style="height: 700px; overflow-y: scroll;">
			    <c:forEach items="${commentList}" var="com">
			        <div class="card mb-2">
			            <div class="card-body" style="height: auto">
			                <h5 class="card-title">댓글</h5>
			                <p class="card-text">${com.commContents}</p>
			                <p class="card-subtitle text-muted">${com.memName} | 작성 시간: ${com.commRdate}</p>
			                
			                <!-- 댓글 수정, 삭제 버튼 추가 -->
				            <c:if test="${memCd eq com.memCd}">
				                <button class="updateBtn btn btn-outline-secondary" data-commcd="${com.commCd}" data-commContents="${com.commContents}">수정</button>
				                <button class="deleteBtn btn btn-outline-danger" data-commcd="${com.commCd}">삭제</button>
				            </c:if>
			            </div>
			        </div>
			    </c:forEach>
			</div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">모집 현황</h4>
                    <p class="card-text">현재: ${data.currentMembers} / 목표: ${data.clubPersonnel}</p>
                    <h4 class="card-title">모집 상태</h4>
                    <p class="card-text">${data.clubStatus == 0 ? '모집 중' : '모집 완료'}</p>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><strong>참가자 목록</strong></li>
                    <c:forEach items="${data.memberList}" var="m">
                        <li class="list-group-item">${m.depName} : ${m.memName}</li>
                    </c:forEach>
                </ul>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${memCd eq data.memCd}">
                            <button class="btn btn-primary action-button" id="clubStatusUpdate">
                                모집상태 변경
                            </button>
                            <button class="btn btn-primary action-button">
                                <a href="./update/${data.clubCd}" style="color: white;">글 수정</a>
                            </button>
                            <button class="btn btn-danger action-button" id="btn-delete" onclick="confirmDelete(${data.clubCd})">글 삭제</button>
                        </c:when>
                        <c:otherwise>
                           <c:choose>
							    <c:when test="${!userIsParticipant && data.clubStatus == 0 && data.currentMembers < data.clubPersonnel}">
							        <!-- 첫 번째 조건: 가입되어 있지 않고 모집 중인 경우 -->
							        <button id="joinClub" class="btn btn-success">참가하기</button>
							    </c:when>
							    <c:when test="${userIsParticipant}">
							        <!-- 두 번째 조건: 가입되어 있는 경우 -->
							        <button id="dropClub" class="btn btn-success">탈퇴하기</button>
							    </c:when>
							    <c:when test="${!userIsParticipant && data.clubStatus == 1}">
							        <!-- 세 번째 조건: 가입되어 있지 않고 모집 완료인 경우 (아무 버튼도 없음) -->
							    </c:when>
							    <c:when test="${userIsParticipant && data.clubStatus == 1}">
							        <!-- 네 번째 조건: 가입되어 있고 모집 완료인 경우 (아무 버튼도 없음) -->
							    </c:when>
							    <c:when test="${data.currentMembers == data.clubPersonnel}">
							        <!-- 다섯 번째 조건: 최대 모집 인원에 도달한 경우 (아무 버튼도 없음) -->
							    </c:when>
							</c:choose>

                        </c:otherwise>
                    </c:choose>
                </div>
                <a href="/board/club/list" class="btn btn-primary action-button">목록</a>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery 라이브러리 로드 -->

<script>
	$(document).ready(function() {
	    const clubCd = ${data.clubCd};
	    const userIsParticipant = ${userIsParticipant};
	    
	
	    if (userIsParticipant) {
	        // 사용자가 모임에 가입한 경우
	        $("#joinClub").hide();
	        $("#dropClub").show();
	    } else {
	        // 사용자가 모임에 가입하지 않은 경우
	        $("#joinClub").show();
	        $("#dropClub").hide();
	    }
	
	    // "참가하기" 버튼 클릭 시
	    $("#joinClub").click(function(e) {
	        e.preventDefault(); // 기본 동작 방지 (링크 클릭 방지)
	
	        // Ajax 요청을 보냄
	        $.ajax({
	            type: "POST", // POST 요청
	            url: `/board/club/clubMemberInsert/${clubCd}`, // 요청 URL
	            success: function(data, status, xhr) {
	                if (xhr.status === 200) {
	                    // 가입 성공 메시지
	                    alert("모임의 참가가 완료되었습니다.");
	                } else {
	                    // 가입 실패 메시지
	                    alert("모임 가입에 실패했습니다.");
	                }
	
	                // 페이지 리로드
	                location.reload();
	            },
	            error: function(xhr, status, error) {
	                // 에러 처리
	                alert("오류 발생: " + error);
	            }
	        });
	    });
	
	    // "탈퇴하기" 버튼 클릭 시
	    $("#dropClub").click(function(e) {
	        e.preventDefault(); // 기본 동작 방지 (링크 클릭 방지)
	
	        // Ajax 요청을 보냄
	        $.ajax({
	            type: "POST", // POST 요청
	            url: `/board/club/clubMemberDrop`, // 요청 URL (탈퇴 처리를 수행할 컨트롤러 )
	            data: { clubCd: clubCd }, // 탈퇴 처리에 필요한 데이터 전달 (clubCd)
	            success: function(data, status, xhr) {
	                if (xhr.status === 200) {
	                    // 탈퇴 성공 메시지
	                    alert("모임 탈퇴가 완료되었습니다.");
	                } else {
	                    // 탈퇴 실패 메시지
	                    alert("모임 탈퇴에 실패했습니다.");
	                }
	
	                // 페이지 리로드
	                location.reload();
	            },
	            error: function(xhr, status, error) {
	                // 에러 처리
	                alert("오류 발생: " + error);
	            }
	        });
	    });
	 	
	 // "모집상태 변경" 버튼 클릭 시
	    $("#clubStatusUpdate").click(function(e) {
	        e.preventDefault(); // 기본 동작 방지 (링크 클릭 방지)
	
	        const clubStatus = ${data.clubStatus} === 0 ? 1 : 0; // 현재 모집 상태의 반대 값
	
	        // AJAX 요청을 보냄
	        $.ajax({
	            type: "POST", // POST 요청
	            url: `/board/club/clubStatusUpdate`, // 요청 URL
	            data: { clubCd: ${data.clubCd}, clubStatus: clubStatus }, // clubStatus 값을 요청 데이터에 추가
	            success: function(data, status, xhr) {
	                if (xhr.status === 200) {
	                    // 모집상태 변경 성공 메시지
	                    alert("모집 상태가 업데이트되었습니다.");
	                } else {
	                    // 모집상태 변경 실패 메시지
	                    alert("모집 상태 업데이트에 실패했습니다.");
	                }
	
	                // 페이지 리로드
	                location.reload();
	            },
	            error: function(xhr, status, error) {
	                // 에러 처리
	                alert("오류 발생: " + error);
	            }
	        });
	    });
	
	 
	
	    // 댓글 작성 시
	   $("#commentInsert").click(function(e) {
	    e.preventDefault();
	
	    const clubCd = ${data.clubCd}; 
	    const commContents = $("#commContents").val();
	
	    $.ajax({
	        type: "POST",
	        url: "/board/club/commentInsert",
	        data: {
	            clubCd: clubCd,
	            commContents: commContents
	        },
	        success: function(data, status, xhr) {
	        	console.log("댓글 등록 결과:", data.result); // 결과 확인
	            if (data.result === 1) {
	                alert("댓글이 등록되었습니다.");
	                location.reload();
	            } else {
	                alert("댓글 등록에 실패했습니다.");
	            }
	            // 댓글 목록 업데이트
	            updateCommentList();
	        }
	    });
	});
	   
	// 댓글 Update 이벤트 (이벤트 위임 적용)
	   $("#commentList").on("click", ".updateBtn", function () {
	       let cardBody = $(this).closest(".card-body");
	       let commContents = cardBody.find(".card-text").text(); // text() 대신 val() 사용
	       let commCd = this.dataset.commcd;

	       console.log(commContents);
	       console.log(commCd);

	       // 기존 텍스트를 인풋 태그로 변경
	       cardBody.find(".card-text").html('<textarea class="form-control" id="updateContents">' + commContents + '</textarea>');

	       // 수정 버튼 클래스 및 데이터 속성 변경
	       $(this).removeClass("updateBtn").addClass("updateBtn2 btn btn-outline-secondary");
	       $(this).attr("data-commcd", commCd);
	   });


	   // 댓글 Update 완료 이벤트 (이벤트 위임 적용)
	   $("#commentList").on("click", ".updateBtn2", function () {
	       let contentsElement = $(this).closest(".card-body").find("#updateContents");
	       let commContents = contentsElement.length > 0 ? contentsElement.val().trim() : "";

	       let commCd = this.dataset.commcd;

	       if (commContents.trim() == "") {
	           alert("내용을 입력해 주세요.");
	       } else {
	           $.ajax({
	               type: "post",
	               url: "/board/club/commentUpdate",
	               data: {
	                   commCd: commCd,
	                   commContents: commContents,
	               },
	               success: function (result) {
	            	   alert("댓글 수정이 완료되었습니다")
	            	   location.reload();
	               },
	               error: function () {
	                   console.log("error");
	               },
	           });
	       }
	   });
	// 댓글 삭제 이벤트
	   $("#commentList").on("click", ".deleteBtn", function () {
	       let commCd = this.dataset.commcd;

	       // 삭제를 확인하는 대화 상자 표시
	       let isConfirmed = confirm("삭제하면 복구 할 수 없습니다. 삭제하시겠습니까?");

	       // 사용자가 삭제를 확인했는지 확인
	       if (isConfirmed) {
	           // 사용자가 확인하면 AJAX 요청 진행
	           $.ajax({
	               type: "POST",
	               url: "/board/club/commentDelete",
	               data: { commCd: commCd },
	               success: function (result) {
	                   // 서버에서 반환된 결과 확인
	                   if (result === 1) {
	                       alert("댓글이 삭제되었습니다.");
	                       // 페이지 리로드
	   	                location.reload();
	                   } else {
	                       alert("댓글 삭제에 실패했습니다.");
	                   }
	               },
	               error: function (xhr, status, error) {
	                   alert("오류 발생: " + error);
	               }
	           });
	       }
	       // 사용자가 삭제를 취소하면 아무 일도 일어나지 않음
	   });
});
</script>





<script src="/vendors/scripts/board/ClubDelete.js"></script>
