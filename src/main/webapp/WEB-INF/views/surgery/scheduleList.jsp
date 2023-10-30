<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link rel="stylesheet" href="/vendors/styles/equipment/list.css">

<h1>수술실/비품관리</h1>
	<br>
<h2>나의 수술실 예약 내역</h2>
	<br><br>

<table class="table table-bordered">
    <thead>
        <tr id="table-top">
            <th scope="col">수술실</th>
			<th scope="col">날짜</th>
            <th scope="col">시작 시간</th>
            <th scope="col">종료 시간</th>
			<th scope="col">취소</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">201호</th>
            <td>2023.10.25</td>
            <td>12:00</td>
			<td>15:00</td>
			<td>
                <span class="badge badge-primary"><a onclick="location.href='scheduleUpdate'" id="a2">수정하기</a></span>
				<span class="badge badge-primary"><a onclick="window.open('#', '수술실 예약 취소', 'width=100, height=100')" id="a2">취소하기</a></span>
			</td>
        </tr>
    </tbody>
</table>
    <br>