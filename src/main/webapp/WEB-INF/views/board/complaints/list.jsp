<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>


<!--  Datatable start -->
<div class="card-box mb-30">
    <div class="pd-20">
        <h4 class="text-blue h4">민원게시판</h4>
    </div>
    <div class="pb-20">
        <table class="datatable2 table nowrap">
            <thead>
                <tr>
                	<th>#</th>
                    <th>NO</th>
                    <th>민원종류</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성날짜</th>
                    <th>조치여부</th>
                    
                </tr>
            </thead>
            <tbody>
                <tr>
                	<td>공개글</td>
                    <td>1</td>
                    <td>사내민원</td>
                    <td>힘들어요</td>
                    <td>홍길동</td>
                    <td>2023년01월11일</td>
                    <td>조치중</td>
                    
                </tr>
                 <tr>
                	<td>비공개글</td>
                    <td>2</td>
                    <td>비밀글입니다</td>
                    <td>비밀글입니다</td>
                    <td>비밀글입니다</td>
                    <td>비밀글입니다</td>
                    <td>조치중</td>
                    
                </tr>
            </tbody>
        </table>
        <div><button class="my btn btn-primary" type="button"><a href="./insert" style="color: white;">글쓰기</a></button></div>
    </div>
</div>
<!-- Datatable End -->


	
