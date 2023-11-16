<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<link rel="stylesheet" href="/vendors/styles/schedule/teamList.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- main -->
<h1>일정관리</h1>
	<br>
<h2>과 일정</h2>
    <br><br>

<c:forEach items="${scheduleList}" var="schedule">
    <input type="hidden" class="sch" codeCd="${schedule.codeCd}" memCd="${schedule.memCd}" startNum="${schedule.startNum}" endNum="${schedule.endNum}">
</c:forEach>

<div class="pd-20 card-box mb-30">
    <div class="pull-left"><h3 style="display: inline;">${ldt}</h3>&nbsp;&nbsp;&nbsp;&nbsp;<h4 style="display: inline;">${department} 일정</h4></div>
    <div class="pull-right">
        <input class="date-picker" id="datepicker" placeholder=" Select Date" type="text" value="" readonly style="background-color: white;">

        <select class="select" name="">
            <option selected="" value="0">전체 팀</option>
            <c:forEach items="${teams}" var="team">
                <option value="${team.depCd}">${team.depName}</option>
            </c:forEach>
        </select>
        <button class="btn btn-outline-primary filter-btn">조회</button>
        <a id="hidden-link" href=""></a>
    </div>
        <br><br><br>
    <div class="pull-right">
        총 ${total}명
    </div>
    <div class="pull-left">
        <span class="description"><span class="red-dot">●</span><span>: 연차</span></span>&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="description"><span class="green-dot">●</span><span>: 수술</span></span>&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="description"><span class="yellow-dot">●</span><span>: 진료</span></span>&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="description"><span class="purple-dot">●</span><span>: 개인 일정</span></span>
            <br><br>
    </div>
    <c:forEach items="${members}" var="member">
        <table class="time-table-1 teamList">
            <tr class="teamList">
                <th class="teamList" rowspan="3"><span style="color: dimgrey; font-size: smaller;">${member.depName}</span><br><span class="${member.memCd}" id="off">${member.memName}</span></th>
                <th class="topper teamList">01</th>
                <th class="topper teamList">02</th>
                <th class="topper teamList">03</th>
                <th class="topper teamList">04</th>
                <th class="topper teamList">05</th>
                <th class="topper teamList">06</th>
                <th class="topper teamList">07</th>
                <th class="topper teamList">08</th>
                <th class="topper teamList">09</th>
                <th class="topper teamList">10</th>
                <th class="topper teamList">11</th>
                <th class="topper teamList">12</th>
                <th class="topper teamList">13</th>
                <th class="topper teamList">14</th>
                <th class="topper teamList">15</th>
                <th class="topper teamList">16</th>
                <th class="topper teamList">17</th>
                <th class="topper teamList">18</th>
                <th class="topper teamList">19</th>
                <th class="topper teamList">20</th>
                <th class="topper teamList">21</th>
                <th class="topper teamList">22</th>
                <th class="topper teamList">23</th>
                <th class="topper teamList">24</th>
            </tr>
            <tr class="teamList">
                <th id="${member.memCd}-1" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-2" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-3" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-4" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-5" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-6" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-7" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-8" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-9" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-10" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-11" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-12" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-13" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-14" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-15" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-16" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-17" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-18" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-19" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-20" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-21" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-22" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-23" time="" class="bottom n teamList" rowspan="2"></th>
                <th id="${member.memCd}-24" time="" class="bottom n teamList" rowspan="2"></th>
            </tr>
            <tr class="teamList">
            </tr>
        </table>
            <br>
    </c:forEach>
</div>

<script src="/vendors/scripts/schedule/teamList.js"></script>