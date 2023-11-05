<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <div class="row">
        <div class="col-md-7">
            <div class="card mb-4">
                <div class="card-body" style="display: flex; align-items: flex-start;">
                    <div style="flex: 1;">
                        <h1 class="title" style="font-size: 2.0rem; text-align: center;">${data.clubTitle}</h1>
                        
                        <!-- 줄 추가: 구분선 -->
                        <hr>

                        <div class="contents" style="text-align: center; margin-top: 20px;">${data.clubContents}</div>
                        <div>
                            <c:forEach items="${data.list}" var="f">
                                <a href="../fileDown?bfCd=${f.bfCd}" class="file-link">
                                    <li><i class="icon-copy fi-download"></i>${f.bfOname}</li>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="author-info" style="margin-left: auto; text-align: right;">
                        <span class="author-icon">${data.depName} : ${data.memName}</span>
                        <div class="author-icon">조회수: ${data.clubHit}</div>
                    </div>
                </div>
            </div>
            <div style="display: flex; align-items: center;">
                <textarea rows="3" cols="50" placeholder="댓글을 입력하세요" style="width: 950px; height: 80px;"></textarea>
                <button id="addComment" class="btn btn-primary" style="height: 80px; width: 65px; font-size: 10px">댓글등록</button>
            </div>
            <div id="commentList">
                <!-- 댓글 리스트가 여기에 동적으로 표시될 것입니다 -->
            </div>
        </div>
        <div class="col-md-5">
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
						        <button class="btn btn-primary action-button">
						            <a href="../clubStatusUpdate/${data.clubCd}" style="color: white;">모집상태 변경</a>
						        </button>
						        <button class="btn btn-primary action-button">
						            <a href="../update/${data.clubCd}" style="color: white;">글 수정</a>
						        </button>
						        <button class="btn btn-danger action-button" id="btn-delete" onclick="confirmDelete(${data.clubCd})">글 삭제</button>
						    </c:when>
						    <c:otherwise>
						        <c:choose>
						            <c:when test="${userIsParticipant}">
						                <button id="dropClub" class="btn btn-success">탈퇴하기</button>
						                <button id="joinClub" class="btn btn-success" style="display: none;">참가하기</button>
						            </c:when>
						            <c:otherwise>
						                <button id="joinClub" class="btn btn-success">참가하기</button>
						                <button id="dropClub" class="btn btn-success" style="display: none;">탈퇴하기</button>
						            </c:otherwise>
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
});
</script>




<script src="/vendors/scripts/board/ClubDelete.js"></script>
