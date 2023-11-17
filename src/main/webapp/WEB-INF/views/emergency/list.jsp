<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
    .dot {
        overflow:hidden;
        float:left;
        width:12px;
        height:12px;
        background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
    }
    .dotOverlay {
        position:relative;
        bottom:10px;
        border-radius:6px;
        border: 1px solid #ccc;
        border-bottom:2px solid #ddd;
        float:left;
        font-size:12px;
        padding:5px;
        background:#fff;
    }
    .dotOverlay:nth-of-type(n) {
        border:0;
        box-shadow:0px 1px 2px #888;
    }
    .number {
        font-weight:bold;
        color:#ee6152;
    }
    .dotOverlay:after {
        content:'';
        position:absolute;
        margin-left:-6px;
        left:50%;
        bottom:-8px;
        width:11px;
        height:8px;
        background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')
    }
    .distanceInfo {
        position:relative;
        top:5px;
        left:5px;
        list-style:none;
        margin:0;
    }
    .distanceInfo .label {
        display:inline-block;
        width:50px;
    }
    .distanceInfo:after {
        content:none;
    }
</style>
<div id="map" style="width:100%;height:350px; display:none">

</div>
<!--  Datatable start -->
<div class="card-box mb-30">
    <!--
    <form action="list" method="get">
        <select class="select" name="gu">
            <option selected="" value="금천구">금천구</option>
            <option value="구로구">구로구</option>
        </select>
    <form>
    <button class="btn btn-outline-primary filter-btn">조회</button>
    -->
    <div class="pd-20">
        <h4 class="text-blue h4">실시간 응급실 가용 현황</h4>
    </div>
    <div class="pb-20">
        <table class="datatable table nowrap">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>병원명</th>
                    <th>가용 응급실</th>
                    <th>구급차 가용 여부</th>
                    <!-- <th>응급실 연락처</th> -->
                    <th>병원 주소</th>
                    <th>지도</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="v" varStatus="s">
				    <tr>
				        <td>${s.count}</td>
				        <td>${v.dutyname}</td>
				        <td>${v.hvec}</td>
				       	<td>${v.hvamyn}</td>
				        <!-- <td>${v.dutytel3}</td> -->
				        <td>${v.dutyAddr}</td>
				        <td>
                            <input type="button" id="openMap" value="지도" data-ad="${v.dutyAddr}" data-nm="${v.dutyname}" data-tel="${v.dutytel3}">
				        </td>
				    </tr>
				</c:forEach>
            </tbody>
        </table>
    </div>
</div>
<!-- Datatable End -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${key}&libraries=services"></script>
<script src="/vendors/scripts/emergency/list.js"></script>
