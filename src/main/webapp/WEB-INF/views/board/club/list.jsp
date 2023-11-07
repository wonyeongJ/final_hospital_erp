<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
	

<!--  Datatable start -->
<div class="card-box mb-30">
    <div class="pd-20">
        <h4 class="text-blue h4">사내동호회게시판</h4>
    </div>
    <div class="pb-20">
        <table class="datatable2 table nowrap">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>모집인원</th>
                    <th>모집상태</th>
                    <th>작성날짜</th>
                    <th>조회수</th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${data}" var="club" varStatus="loop">
				    <tr>
				        <td>${loop.index + 1}</td>
				        <td><a href="./data/${club.clubCd}">${club.clubTitle}</td>
				        <td>${club.depName} : ${club.memName}</td>
				       	<td>${club.currentMembers} / ${club.clubPersonnel}</td>
				        <td>${club.clubStatus == 0 ? '모집 중' : '모집 완료'}</td>
				        <td>${club.clubRdate}</td>
				        <td>${club.clubHit}</td>
				    </tr>
				</c:forEach>
            </tbody>
        </table>
        <div><button class="my btn btn-primary" type="button"><a href="./insert" style="color: white;">글쓰기</a></button></div>
    </div>
</div>
<!-- Datatable End -->
	
