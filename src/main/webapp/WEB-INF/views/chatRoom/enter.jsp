<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 



    	
    	
    	 <div id="content-wrapper" class="d-flex flex-column">
    	 	<div id="content">
    	 		
    	 		
    	 		
    	 		
    	 		<div class="container-fluid">
    	 			<div id="messages" data-chat-num="${roomnum}"></div>
    	 		
    	 			<div class="input-group mb-3">
					  <input type="text" id="inputmsg" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
					  <button class="btn btn-outline-secondary" type="button" id="btnSend">Button</button>
					</div>
    	 			
    	 		</div>
    	 	
    	 	</div>
    	 	
    	 	
    	 
    	 </div>
    	
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery 라이브러리 로드 -->
    
     <sec:authorize access="isAuthenticated()">
    <script src="/vendors/scripts/chat/chat.js"></script>
    </sec:authorize>
    

   