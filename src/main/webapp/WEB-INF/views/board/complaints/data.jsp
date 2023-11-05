<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/vendors/styles/board/board.css">
   
   	 	 	
 	<div class="containerBoard">
        <div class="author-info">
            <span class="author-icon">${data.depName} : ${data.memName}</span>
            <div class="author-icon">조치상태 : ${data.actionTypeName}</div>
        </div>
        <h1 class="title" style="font-size: 2.0rem;">${data.compTitle}</h1>
        <div class="contents">${data.compContents}</div>
        <div>
            <c:forEach items="${data.list}" var="f">
                <a href="../fileDown?bfCd=${f.bfCd}" class="file-link">
                	<li><i class="icon-copy fi-download"></i>${f.bfOname}</li>
                </a>
            </c:forEach>
        </div>
       <div class="action-buttons">
			    <a href="/board/complaints/list" class="btn btn-primary action-button">목록</a>
			
			    <c:choose>
			        
			        <c:when test="${memCd eq data.memCd}">
			            <button class="btn btn-primary action-button">
			                <a href="../update/${data.compCd}" style="color: white;">글 수정</a>    
			            </button>
			            <button class="btn btn-primary action-button" id="btn-delete">
			           <a href="../delete/${data.compCd}" style="color: white;"> 글 삭제
			           </button>
			        </c:when>
			
			        
				    <c:when test="${depCd eq 2 && data.codeCdAction eq 22}">
				        <button class="btn btn-primary action-button" onclick="updateAction(${data.compCd}, 23)">조치중으로 변경</button>
				    </c:when>
				    
				    
				    <c:when test="${depCd eq 2 && data.codeCdAction eq 23}">
				        <button class="btn btn-primary action-button" onclick="updateAction(${data.compCd}, 24)">조치완료로 변경</button>
				    </c:when>
				</c:choose>
		</div>

   </div>

   

<script src="/vendors/scripts/board/ComplaintsData.js"></script>
	
