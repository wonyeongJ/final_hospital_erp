<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Datatable start -->
<div class="card-box mb-30">
    <div class="pd-20">
        <h4 class="text-blue h4">공지사항</h4>
    </div>
    <div class="pb-20">
        <table class="datatable table nowrap">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성날짜</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${data}" var="notice">
                    <tr>
                        <td>
                        <c:choose>
			                <c:when test="${notice.notImportant eq 1}">
			                   <span style="color: red;">중요 <i class="icon-copy ion-alert" style="color: red"></i></span>
			                </c:when>
			                <c:otherwise>
			                   ${notice.notCd}
			                </c:otherwise>
			            </c:choose>
			            </td>
                        <td><a href="./data/${notice.notCd}">${notice.notTitle}</a></td>
                        <td>${notice.memCd}</td>
                        <td>${notice.notRdate}</td>
                        <td>${notice.notHit}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <c:choose>
            <c:when test="${sessionScope.depCd == 2}">
                <div>
                    <button class="my btn btn-primary" type="button">
                        <a href="./insert" style="color: white;">글쓰기</a>
                    </button>
                </div>
            </c:when>
        </c:choose>
    </div>
</div>
<!-- Datatable End -->
