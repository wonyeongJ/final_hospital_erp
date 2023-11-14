<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<!-- Datatable start -->
<div class="card-box mb-30">
    <div class="pd-20">
        <h4 class="text-blue h4">공지사항</h4>
    </div>
    <div class="pb-20">
    	
       <c:choose>
		       <c:when test="${member == 2}">
		         <table class="datatable table nowrap">
		        </c:when>
		   <c:otherwise>
		          <table class="datatable3 table nowrap">
		     </c:otherwise>
		</c:choose>
            <thead>
                <tr>
                    <th>NO</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성날짜</th>
                    <th>조회수</th>
                    <c:choose>
                        <c:when test="${member == 2}">
                            <th>상태변경</th>
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </thead>
           <tbody>
			    <c:forEach items="${data}" var="notice" varStatus="loop">
			        <tr style="${notice.notImportant eq 1 ? 'background-color: #f9f9f8;' : ''}">
			            <td>
			                <c:choose>
			                    <c:when test="${notice.notImportant eq 1}">
			                        <span style="border: 2px solid #ffc6c9;
											    background-color: #ffe3e4;
											    color: #ff4e59;">  중요공지  </span>
			                    </c:when>
			                    <c:otherwise>
			                        ${loop.index + (-2)}
			                    </c:otherwise>
			                </c:choose>
			            </td>
			            <td><a style="color: black;" href="./data/${notice.notCd}">${notice.notTitle}</a></td>
			            <td>${notice.depName} : ${notice.memName}</td>
			            <td>${notice.notRdate}</td>
			            <td>${notice.notHit}</td>
			
			            <!-- 멤버가 2일 때만 보여질 <td> -->
			            <c:if test="${member == 2}">
			                <td style="width: 120px">
			                    <c:choose>
			                        <c:when test="${notice.notImportant eq 1}">
			                            <button class="my btn btn-primary" type="button" id="btn" data-notcd="${notice.notCd}" data-notimportant="0" style="color: white; width: 100px; height: 40px; font-size: 12px">
			                                (일반)상태변경
			                            </button>
			                        </c:when>
			                        <c:otherwise>
			                            <button class="my btn btn-danger" type="button" id="btn" data-notcd="${notice.notCd}" data-notimportant="1" style="color: white; width: 100px; height: 40px; font-size: 12px">
			                                (중요)상태변경
			                            </button>
			                        </c:otherwise>
			                    </c:choose>
			                </td>
			            </c:if>
			        </tr>
			    </c:forEach>
			</tbody>
        </table>
        <c:choose>
            <c:when test="${member == 2}">
                <div>
                    <button class="my btn btn-primary" type="button">
                        <a href="./insert" style="color: white;">글쓰기</a>
                    </button>
                </div>
            </c:when>
            <c:otherwise>
                <!-- 멤버가 2가 아닌 경우에는 추가 액션 없음 -->
            </c:otherwise>
        </c:choose>
    </div>
</div>
<!-- Datatable End -->

<script>
$(document).ready(function() {
    // 버튼 클릭 이벤트를 처리
    $(document).on('click', '#btn', function() {
        var notCd = $(this).data('notcd'); // 공지사항 코드
        var notImportant = $(this).data('notimportant'); // 중요 여부 (0 또는 1)
        console.log("notCd: " + notCd); // 디버깅을 위해 콘솔에 로그 출력
        console.log("notImportant: " + notImportant); // 디버깅을 위해 콘솔에 로그 출력

        $.ajax({
            type: "POST",
            url: "/board/notice/noticeChangeStatus",
            data: {
                notCd: notCd,
                notImportant: notImportant
            },
            success: function (result) {
                console.log("Result: " + result); // 디버깅을 위해 콘솔에 로그 출력
                if (result === "success") {
                    // 성공 메시지를 처리
                    alert("상태가 성공적으로 변경되었습니다.");
                    // 페이지 다시 로드 또는 다른 작업 수행
                    location.reload();
                } else if (result === "failure") {
                    // 실패 메시지를 처리
                    alert("중요 공지사항은 3개까지 등록 가능합니다. 등록되어 있는 중요 공지사항을 일반 공지사항으로 수정 후 다시 등록해주세요.");
                }
            },
            error: function () {
                // 오류 처리
                alert("요청 중 오류가 발생했습니다.");
                location.reload();
            }
        });
    });
});

</script>

