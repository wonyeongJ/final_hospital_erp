<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script src="/vendors/scripts/topbar/topbar.js"></script>
 
 <style>
   #topbarNoticeContainer {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100%; /* 높이를 100%로 설정하여 세로 중앙 정렬 */
	}

	.notice-table {
	    width: 100%;
	    border-collapse: collapse;
	}

    .notice-cell {
        padding: 10px;
        text-align: left;
    }

    .notice-row {
        border-bottom: 1px solid #ddd;
    }

    .notice-row:last-child {
        border-bottom: none;
    }

    .important-notice {
        border: 2px solid #ffc6c9;
        background-color: #ffe3e4;
        color: #ff4e59;
        padding: 5px;
    }

    .notice-cell a {
    color: black;
    font-size: 15px; /* Set font size for titles */
    width: 440px; /* Set a fixed width for the title */
    display: inline-block;
    white-space: nowrap;
    overflow: hidden;
    margin-top: 6px;
    text-overflow: ellipsis;
	}
</style>
    
    
    
    
<!-- header -->
<div class="header">
    <div class="header-left" style="width: 10%">
        <div class="menu-icon dw dw-menu"></div>
    </div>
    <div class="header-right" style="width: 90%">

        <div id="topbarNoticeContainer" style="margin-right: 2%;">
            <!-- 중요 공지사항을 담을 컨테이너 -->
            <table class="notice-table">
                <tbody>
                    <!-- 각 행이 여기에 동적으로 추가됩니다 -->
                </tbody>
            </table>
        </div>
        <div class="dashboard-setting user-notification">
            <div class="dropdown">
                <a class="dropdown-toggle no-arrow" href="javascript:;" data-toggle="right-sidebar">
                    <i class="dw dw-settings2"></i>
                </a>
            </div>
        </div>

        <div class="user-info-dropdown">
            <div class="dropdown">
                <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                    <span class="user-icon">
                        <img src="<sec:authentication property="principal.memPath" />" alt="">
                    </span>
                    <span class="user-name">
                        <sec:authentication property="principal.memName" />
                    </span>
                </a>
                <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                    <a class="dropdown-item" href="/member/mypage"><i class="dw dw-user1"></i> My Page</a>
                    <a class="dropdown-item" href="/logout"><i class="dw dw-logout"></i> Log Out</a>
                </div>
            </div>
        </div>
        <div class="github-link">
            <a href="https://github.com/BottleBear-github/final_hospital_erp" target="_blank"><img
                    src="/vendors/images/github.svg" alt=""></a>
        </div>
    </div>
</div>