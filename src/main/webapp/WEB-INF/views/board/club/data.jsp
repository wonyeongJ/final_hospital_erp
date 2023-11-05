<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

                        <div class="contents" style="text-align: center; margin-top: 20px">${data.clubContents}</div>
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
                    <button id="joinClub" class="btn btn-success">참가하기</button>
                </div>
                 
                 	 <c:choose>
			        
			        <c:when test="${memCd eq data.memCd}">
			            <button class="btn btn-primary action-button">
			                <a href="../update/${data.clubCd}" style="color: white;">글 수정</a>    
			            </button>
			            <button class="btn btn-primary action-button" id="btn-delete">
			           <a href="../delete/${data.clubCd}" style="color: white;"> 글 삭제
			           </button>
			        </c:when>
			        </c:choose>
                 
            </div>
        </div>
    </div>
</div>
