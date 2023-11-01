<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/vendors/styles/board/board.css">
   
   	 	 	
 	<div class="containerBoard">
        <div class="author-info">
            <span class="author-icon">작성자: ${data.memCd}</span>
        </div>
        <h1 class="title">제목 : ${data.compTitle}</h1>
        <div class="contents">${data.compContents}</div>
        <div>
            <c:forEach items="${data.list}" var="f">
                <a href="./fileDown?bfCd=${f.bfCd}" class="file-link"><i class="icon-copy fi-download"></i>${f.bfOname}</a>
            </c:forEach>
        </div>
        <div class="action-buttons">
            <a href="/board/complaints/list" class="btn btn-primary action-button">목록</a>
            <button class="btn btn-primary action-button"><a href="../update/${data.compCd}" style="color: white;">글 수정</a></button>
            <button class="btn btn-danger action-button" id="btn-delete" onclick="confirmDelete(${data.compCd})">글 삭제</button>
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

	
