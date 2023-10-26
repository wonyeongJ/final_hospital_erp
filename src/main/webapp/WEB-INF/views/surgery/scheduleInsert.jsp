<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link rel="stylesheet" href="/vendors/styles/surgery/scheduleInsert.css">

<h1>수술실/비품관리</h1>
	<br>
<h2>수술실 예약</h2>
	<br><br>
<div id="schedule-insert-all-component">
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label" style="font-weight: bold; font-size: large; text-align: center;">조회 날짜</label>
        <div>
            <input class="form-control date-picker" placeholder="Select Reservation Date" type="text">
        </div>
    </div>
    <br><br>
    <table class="time-table-1">
        <tr id="table-top">
            <th scope="col">선택한 날짜</th>
            <th scope="col">수술실 호수</th>
            <th scope="col">예약자</th>
        </tr>
        <tr>
            <th scope="row">2023.10.25</th>
            <th>201호</th>
            <th>주홍일</th>
        </tr>
    </table>
        <br><br><br>
    <table class="time-table-1">
        <tr>
            <th>9:00 ~ 9:30</th>
            <th>9:30 ~ 10:00</th>
            <th>10:00 ~ 10:30</th>
            <th>10:30 ~ 11:00</th>
            <th>11:00 ~ 11:30</th>
            <th>11:30 ~ 12:00</th>
            <th>12:00 ~ 12:30</th>
            <th>12:30 ~ 13:00</th>
        </tr>
        <tr>
            <th id="time-area-1" class="t"></th>
            <th id="time-area-2" class="t"></th>
            <th id="time-area-3" class="t"></th>
            <th id="time-area-4" class="t"></th>
            <th id="time-area-5" class="t"></th>
            <th id="time-area-6" class="t"></th>
            <th id="time-area-7" class="t"></th>
            <th id="time-area-8" class="t"></th>
        </tr>
    </table>
        <br>
    <table class="time-table-1">
        <tr>
            <th>13:00 ~ 13:30</th>
            <th>13:30 ~ 14:00</th>
            <th>14:00 ~ 14:30</th>
            <th>14:30 ~ 15:00</th>
            <th>15:00 ~ 15:30</th>
            <th>15:30 ~ 16:00</th>
            <th>16:00 ~ 16:30</th>
            <th>16:30 ~ 17:00</th>
        </tr>
        <tr>
            <th id="time-area-9" class="f">주홍일</th>
            <th id="time-area-10" class="f"></th>
            <th id="time-area-11" class="f"></th>
            <th id="time-area-12" class="f"></th>
            <th id="time-area-13" class="f"></th>
            <th id="time-area-14" class="f"></th>
            <th id="time-area-15" class="f"></th>
            <th id="time-area-16" class="t"></th>
        </tr>
    </table>
        <br>
    <table class="time-table-1">
        <tr>
            <th>17:00 ~ 17:30</th>
            <th>17:30 ~ 18:00</th>
            <th>18:00 ~ 18:30</th>
            <th>18:30 ~ 19:00</th>
            <th>19:00 ~ 19:30</th>
            <th>19:30 ~ 20:00</th>
            <th>20:00 ~ 20:30</th>
            <th>20:30 ~ 21:00</th>
        </tr>
        <tr>
            <th id="time-area-17" class="t"></th>
            <th id="time-area-18" class="t"></th>
            <th id="time-area-19" class="t"></th>
            <th id="time-area-20" class="f">최경묵</th>
            <th id="time-area-21" class="f"></th>
            <th id="time-area-22" class="f"></th>
            <th id="time-area-23" class="t"></th>
            <th id="time-area-24" class="t"></th>
        </tr>
    </table>
        <br>
    <span class="description"><span class="green-dot">●</span><span> : 예약 가능</span></span>
        <br>
    <span class="description"><span class="red-dot">●</span><span> : 예약 불가</span></span>
        <br><br>

    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label" style="font-weight: bold; font-size: large; text-align: center;">시작 시간</label>
        <div>
            <select class="custom-select col-12">
                <option selected="">Select Start-time</option>
                <option value="">09:00</option>
                <option value="">09:30</option>
                <option value="">10:00</option>
                <option value="">10:30</option>
                <option value="">11:00</option>
                <option value="">11:30</option>
                <option value="">12:00</option>
                <option value="">12:30</option>
                <option value="">13:00</option>
                <option value="">13:00</option>
                <option value="">14:30</option>
                <option value="">14:00</option>
                <option value="">15:00</option>
                <option value="">15:30</option>
                <option value="">16:00</option>
                <option value="">16:00</option>
                <option value="">17:30</option>
                <option value="">18:00</option>
                <option value="">18:00</option>
                <option value="">19:30</option>
                <option value="">19:00</option>
                <option value="">20:00</option>
                <option value="">20:30</option>
            </select>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label" style="font-weight: bold; font-size: large; text-align: center;">종료 시간</label>
        <div>
            <select class="custom-select col-12">
                <option selected="">&nbsp;Select End-time&nbsp;</option>
                <option value="">09:30</option>
                <option value="">10:00</option>
                <option value="">10:30</option>
                <option value="">11:00</option>
                <option value="">11:30</option>
                <option value="">12:00</option>
                <option value="">12:30</option>
                <option value="">13:00</option>
                <option value="">13:00</option>
                <option value="">14:30</option>
                <option value="">14:00</option>
                <option value="">15:00</option>
                <option value="">15:30</option>
                <option value="">16:00</option>
                <option value="">16:00</option>
                <option value="">17:30</option>
                <option value="">18:00</option>
                <option value="">18:00</option>
                <option value="">19:30</option>
                <option value="">19:00</option>
                <option value="">20:00</option>
                <option value="">20:30</option>
                <option value="">21:00</option>
            </select>
        </div>
    </div>
        <br>
    <div class="clearfix mb-20">
        <div id="schedule-insert-btn">
            <input type="button" class="btn btn-outline-primary header-white" value="수술실 예약"></button>
        </div>
    </div>
        <br>
</div>