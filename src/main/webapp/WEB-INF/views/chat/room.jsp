<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<style>
	  	h3 {
		    margin-top: 40px !important;
		    text-align: center;
		}
		.col-xl1 {
	    	flex: 0.4 0 0%;
	    }
	    .card .card-header + .card-body, .card .card-header + .card-content > .card-body:first-of-type {
		    padding-top: 0;
		    height: 550px;
		}
		#msgArea{
			width: 100%;
		    height: 90%;
		    background-color: #E7E7FF;
		    padding: 0.8rem 0 1.5rem;
		}
		.alert-primary{
			background-color: #696CFF;
			color: white;
		}
		.msg{
			padding: 1rem 2rem;
			margin: 0.7rem 1.5rem 0 1.5rem;
		}
		#chatDate{
			padding-left: 83%;
			font-size: 11px;
		}
		#msgArea::-webkit-scrollbar {
		    width: 10px;
		}
		#msgArea::-webkit-scrollbar-thumb {
		    background-color: #696CFF;
		    border-radius: 10px;
		}
		#msgArea::-webkit-scrollbar-track {
		    background-color: white;
		    border-radius: 10px;
		    box-shadow: inset 0px 0px 5px white;
		 }

	</style>
	
	<!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
       
        <div class="layout-page">
         

      

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h3>MESSENGER</h3>

              <!-- Basic Layout -->
              <div class="row">
                <div class="col-xl1">
                  <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                    	<sec:authorize access="isAuthenticated()">
                    	<sec:authentication property="principal" var="user"/>
                        	<h5 class="mb-0" id="my" data-user="${user.memCd}" data-name="${user.memName}">${user.memName}</h5>
						</sec:authorize>
                    </div>
                    <div class="card-body">
                    	<div class="input-group mb-4">
	                        <input
	                          id="searchName"
	                          type="text"
	                          class="form-control"
	                          aria-label="Recipient's username"
	                          aria-describedby="button-addon2"
	                        />
	                        <button class="btn btn-outline-primary" type="button" id="search">조회</button>
                      	</div>
                    	<div id="listBox">
	                    	<c:forEach items="${list}" var="li">
	                        <a href="#" class="chatList" data-empNum="${li.memCd}" data-name="${li.memName}" >${li.memName}</a><br>                   		
	                    	</c:forEach>
                    	</div>
                    </div>
                  </div>
                </div>
                <div class="col-xl">
                  <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                      <h5 id="someone" class="mb-0" data-name="">채팅하려는 대상을 선택해 주세요</h5>
               		
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
	                                >보내기</button>
                      	</div>
                    </div>
                  </div>
                </div>
              </div>
              
            </div>
            <!-- / Content -->
            <!-- Footer -->
            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
	

	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="/vendors/scripts/chat/room.js"></script>