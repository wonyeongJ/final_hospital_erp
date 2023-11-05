<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/vendors/styles/board/board.css">

    	 	
 	<div class="containerBoard">
        <div class="author-info">
            <span class="author-icon">${data.depName} : ${data.memName}</span>
        </div>
        <div class="notHit">조회수: ${data.notHit}</div>
        <h1 class="title" style="font-size: 2.0rem; margin-top: 20px;">${data.notTitle}</h1>
         <!-- 줄 추가: 구분선 -->
                        <hr>
        <div class="contents" style="font-size: 1.2rem">${data.notContents}</div>
        <div>
            <c:forEach items="${data.list}" var="f">
                <a href="../fileDown?bfCd=${f.bfCd}" class="file-link">
                	<li><i class="icon-copy fi-download"></i>${f.bfOname}</li>
                </a>
            </c:forEach>
        </div>
        <div class="action-buttons">
            <a href="/board/notice/list" class="btn btn-primary action-button">목록</a>
            <c:choose>
        <c:when test="${member == 2}">
            <button class="btn btn-primary action-button"><a href="../update/${data.notCd}" style="color: white;">글 수정</a></button>
            <button class="btn btn-danger action-button" id="btn-delete" onclick="confirmDelete(${data.notCd})">글 삭제</button>
        </c:when>
    </c:choose>
        </div>
    </div>
<script src="/vendors/scripts/board/NoticeDelete.js"></script>
    

