<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- sidebar -->
	<div class="left-side-bar">
		<div class="brand-logo">
			<a href="/">
				<img src="/vendors/images/deskapp-logo.svg" alt="" class="dark-logo">
				<img src="/vendors/images/deskapp-logo-white.svg" alt="" class="light-logo">
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
		<div class="menu-block customscroll">
			<div class="sidebar-menu icon-style-1 icon-list-style-6"">
				<ul id="accordion-menu">
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw fi-torsos-all"></span><span class="mtext">직원관리</span>
						</a>
						<ul class="submenu">
							<li><a href="/member/list">직원조회</a></li>
							<li><a href="/member/insert">직원등록</a></li>
							<li><a href="/member/list">퇴사자조회</a></li>
						</ul>
					</li>
					
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-diagram"></span><span class="mtext">부서관리</span>
						</a>
						<ul class="submenu">
							<li><a href="/department/chart">조직도</a></li>
							<li><a href="/department/list">부서등록/변경</a></li>
						</ul>
					</li>
					
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-apartment"></span><span class="mtext">수술실/비품관리</span>
						</a>
						<ul class="submenu">
							<li><a href="/surgery/list">수술실예약</a></li>
							<li><a href="/equipment/list">비품예약</a></li>
						</ul>
					</li>
					
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-edit2"></span><span class="mtext">접수관리</span>
						</a>
						<ul class="submenu">
							<li><a href="/patient/list">환자관리</a></li>
							<li><a href="/reservation/list">진료관리</a></li>
						</ul>
					</li>
					
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-library"></span><span class="mtext">게시판</span>
						</a>
						<ul class="submenu">
							<li><a href="/board/notice/list">공지사항</a></li>
							<li><a href="/board/complaints/list">민원게시판</a></li>
							<li><a href="/board/club/list">사내동호회</a></li>
						</ul>
					</li>
					
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-calendar1"></span><span class="mtext">일정관리</span>
						</a>
						<ul class="submenu">
							<li><a href="/schedule/teamList">과일정</a></li>
							<li><a href="/schedule/personalList">개인일정</a></li>
						</ul>
					</li>
					
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw fi-page-export"></span><span class="mtext">전자결재</span>
						</a>
						<ul class="submenu">
							<li><a href="/payment/list">내결재함</a></li>
							<li><a href="/payment/allList">전체결재문서</a></li>
						</ul>
					</li>
					
					<li>
						<a href="/chat/room" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-chat3"></span><span class="mtext">메신저</span>
						</a>
					</li>
					
					<li>
						<a href="#" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-settings2"></span><span class="mtext">SETTING</span>
						</a>
					</li>
					

					
				</ul>
			</div>
		</div>
	</div>