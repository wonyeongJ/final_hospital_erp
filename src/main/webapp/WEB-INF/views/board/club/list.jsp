<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
	

<!--  Datatable start -->
<div class="card-box mb-30">
    <div class="pd-20">
        <h4 class="text-blue h4">사내동호회게시판</h4>
    </div>
    <div class="pb-20">
        <table class="datatable table nowrap">
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
                <tr>
                    <td>1</td>
                    <td>족구모임</td>
                    <td>김아무개</td>
                    <td>1/10</td>
                    <td>모집중</td>
                    <td>2023년10월11일</td>
                    <td>31</td>
                    
                </tr>
                <tr>
                    <td>2</td>
                    <td>축구모임</td>
                    <td>김유신</td>
                    <td>1/11</td>
                    <td>모집중</td>
                    <td>2023년10월12일</td>
                    <td>3</td>
                    
                </tr>
                 <tr>
                    <td>3</td>
                    <td>야구모임</td>
                    <td>김승엽</td>
                    <td>1/12</td>
                    <td>모집중</td>
                    <td>2023년10월14일</td>
                    <td>22</td>
                    
                </tr>
                 <tr>
                    <td>4</td>
                    <td>삽겹살모임</td>
                    <td>김돼지</td>
                    <td>5/5</td>
                    <td>모집완료</td>
                    <td>2023년10월17일</td>
                    <td>102</td>
                    
                </tr>
            </tbody>
        </table>
        <div><button class="my btn btn-primary" type="button"><a href="./insert" style="color: white;">글쓰기</a></button></div>
    </div>
</div>
<!-- Datatable End -->
	
