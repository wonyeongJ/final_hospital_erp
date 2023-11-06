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
                <c:forEach items="${data}" var="notice" varStatus="loop">
                    <tr>
                        <td>
                        <c:choose>
			                <c:when test="${notice.notImportant eq 1}">
			                   <span style="color: red;">중요 <i class="icon-copy ion-alert" style="color: red"></i></span>
			                </c:when>
			                <c:otherwise>
			                   ${loop.index + (-2)}
			                </c:otherwise>
			            </c:choose>
			            </td>
                        <td><a href="./data/${notice.notCd}">${notice.notTitle}</a></td>
                        <td>${notice.depName} : ${notice.memName}</td>
                        <td>${notice.notRdate}</td>
                        <td>${notice.notHit}</td>
                        
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
		        <!-- DEP_CD가 1이 아닌 경우 버튼을 보이지 않도록 합니다. -->
		    </c:otherwise>
		</c:choose>
    </div>
</div>
<!-- Datatable End -->
