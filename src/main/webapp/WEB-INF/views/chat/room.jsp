<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<link rel="stylesheet" href="/vendors/styles/chat/Room.css">
	

 <div class="content-wrapper">
    <!-- 내용 -->
    <div class="container-xxl flex-grow-1 container-p-y">
        <!-- 기본 레이아웃 -->
        <div class="row">
            <!-- 왼쪽 열 - 채팅 리스트 -->
			<div class="col-md-3">
				<div class="card mb-4">
					<div
						class="card-header d-flex justify-content-between align-items-center">
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal" var="user" />
							<h5 class="mb-0" id="my" data-user="${user.memCd}"
								data-name="${user.memName}">
								<i class="icon-copy fa fa-user-circle" aria-hidden="true"></i>
								${user.depName}(${user.jobName}) : ${user.memName}
							</h5>
						</sec:authorize>
					</div>
					<div class="card-body">
						<div class="input-group mb-4" style="margin-top: 7%;">
							<input id="searchName" type="text" class="form-control"
								aria-label="Recipient's username"
								aria-describedby="button-addon2" />
							<button class="btn btn-outline-primary" type="button" id="search">
								<i class="icon-copy fa fa-search" aria-hidden="true"></i>
							</button>
						</div>
						<div id="listBox" style="max-height: 450px; overflow-y: auto;">

							<div class="accordion" id="depAccordion">
								<!-- 인사과 -->
								<div class="card">
									<div class="card-header" id="headingInsa">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left"
												type="button" data-toggle="collapse"
												data-target="#collapseInsa" aria-expanded="false"
												aria-controls="collapseInsa">인사과</button>
										</h2>
									</div>
									<div id="collapseInsa" class="collapse"
										aria-labelledby="headingInsa" data-parent="#depAccordion">
										<div class="card-body">
											<ul class="list-unstyled">
												<c:forEach items="${list}" var="member">
													<c:if test="${member.depName eq '인사과'}">
														<li><a href="#" class="chatList"
															data-empNum="${member.memCd}"
															data-name="${member.memName}"> <i
																class="icon-copy fa fa-user-circle" aria-hidden="true"></i>
																${member.depName}(${member.jobName}) : ${member.memName}
														</a></li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
								<!-- 내과 -->
								<div class="card">
									<div class="card-header" id="headingNaegwa">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left"
												type="button" data-toggle="collapse"
												data-target="#collapseNaegwa" aria-expanded="false"
												aria-controls="collapseNaegwa">내과</button>
										</h2>
									</div>
									<div id="collapseNaegwa" class="collapse"
										aria-labelledby="headingNaegwa" data-parent="#depAccordion">
										<div class="card-body">
											<ul class="list-unstyled">
												<c:forEach items="${list}" var="member">
													<c:if test="${member.depName eq '내과'}">
														<li><a href="#" class="chatList"
															data-empNum="${member.memCd}"
															data-name="${member.memName}"> <i
																class="icon-copy fa fa-user-circle" aria-hidden="true"></i>
																${member.depName}(${member.jobName}) : ${member.memName}
														</a></li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
								<!-- 외과 -->
								<div class="card">
									<div class="card-header" id="headingWaegwa">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left"
												type="button" data-toggle="collapse"
												data-target="#collapseWaegwa" aria-expanded="false"
												aria-controls="collapseWaegwa">외과</button>
										</h2>
									</div>
									<div id="collapseWaegwa" class="collapse"
										aria-labelledby="headingWaegwa" data-parent="#depAccordion">
										<div class="card-body">
											<ul class="list-unstyled">
												<c:forEach items="${list}" var="member">
													<c:if test="${member.depName eq '외과'}">
														<li><a href="#" class="chatList"
															data-empNum="${member.memCd}"
															data-name="${member.memName}"> <i
																class="icon-copy fa fa-user-circle" aria-hidden="true"></i>
																${member.depName}(${member.jobName}) : ${member.memName}
														</a></li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
								<!-- 마취과 -->
								<div class="card">
									<div class="card-header" id="headingMachigwa">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left"
												type="button" data-toggle="collapse"
												data-target="#collapseMachigwa" aria-expanded="false"
												aria-controls="collapseMachigwa">마취과</button>
										</h2>
									</div>
									<div id="collapseMachigwa" class="collapse"
										aria-labelledby="headingMachigwa" data-parent="#depAccordion">
										<div class="card-body">
											<ul class="list-unstyled">
												<c:forEach items="${list}" var="member">
													<c:if test="${member.depName eq '마취과'}">
														<li><a href="#" class="chatList"
															data-empNum="${member.memCd}"
															data-name="${member.memName}"> <i
																class="icon-copy fa fa-user-circle" aria-hidden="true"></i>
																${member.depName}(${member.jobName}) : ${member.memName}
														</a></li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
								<!-- 가발령 -->
								<div class="card">
									<div class="card-header" id="headingGaballyeong">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left"
												type="button" data-toggle="collapse"
												data-target="#collapseGaballyeong" aria-expanded="false"
												aria-controls="collapseGaballyeong">가발령</button>
										</h2>
									</div>
									<div id="collapseGaballyeong" class="collapse"
										aria-labelledby="headingGaballyeong"
										data-parent="#depAccordion">
										<div class="card-body">
											<ul class="list-unstyled">
												<c:forEach items="${list}" var="member">
													<c:if test="${member.depName eq '가발령'}">
														<li><a href="#" class="chatList"
															data-empNum="${member.memCd}"
															data-name="${member.memName}" style=""> <i
																class="icon-copy fa fa-user-circle" aria-hidden="true"></i>
																${member.depName}(${member.jobName}) : ${member.memName}
														</a></li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 오른쪽 열 - 채팅 영역 -->
		            <div class="col-md-9">
		                <div class="card mb-4">
		                    <div class="card-header d-flex justify-content-between align-items-center">
		                        <h5 id="someone" class="mb-0" data-name=""><i class="icon-copy fa fa-user-circle" aria-hidden="true"></i></h5>
		                    </div>
		                    <div class="card-body">
		                        <div id="msgArea" class="card mb-4" style="overflow-y: scroll"></div>
		                        <div class="input-group">
		                            <input
			                          id="msg"
			                          type="text"
			                          class="form-control"
			                          aria-label="Recipient's username"
			                          aria-describedby="button-addon2"
			                        />
			                        <button class="btn btn-outline-primary"
			                                type="button"
			                                id="button-send"
			                                data-room=""
			                                data-receiver=""
			                                ><i class="icon-copy fa fa-send-o" aria-hidden="true"></i></button>
		                        </div>
		                    </div>
		                </div>
		            </div>
                </div>
            </div>   
        </div>
   
                
                

    
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="/vendors/scripts/chat/room.js"></script>