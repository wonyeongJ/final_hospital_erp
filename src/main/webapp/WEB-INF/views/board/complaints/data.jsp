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
                <a href="../fileDown?bfCd=${f.bfCd}" class="file-link"><i class="icon-copy fi-download"></i>${f.bfOname}</a>
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

    <script>
        function confirmDelete(compCd) {
            if (confirm("삭제하면 복구할 수 없습니다. 정말로 삭제하시겠습니까?")) {
                $.ajax({
                    type: "POST",
                    url: "/board/complaints/delete/" + compCd,
                    data: { compCd: compCd },
                    success: function (response) {
                        if (response === "success") {
                            alert("삭제가 완료되었습니다.");
                            window.location.href = "/board/complaints/list";
                        } else {
                            alert("삭제에 실패했습니다.");
                        }
                    },
                    error: function () {
                        alert("서버 오류로 삭제에 실패했습니다.");
                    }
                });
            }
        }
    </script>
    <script>
	    function updateAction(compCd, newCodeCdAction) {
	        if (confirm('조치 상태를 변경하시겠습니까?')) {
	            $.ajax({
	                type: "GET",
	                url: `../actionUpdate/${compCd}`,
	                data: {
	                    codeCdAction: newCodeCdAction
	                },
	                success: function (response) {
	                    // 성공 시 실행할 작업
	                    alert("수정이 완료되었습니다")
	                    location.reload(); // 페이지 새로고침
	                },
	                error: function () {
	                    // 오류 발생 시 실행할 작업
	                    alert("수정 실패");
	                }
	            });
	        }
	    }
	</script>


	
