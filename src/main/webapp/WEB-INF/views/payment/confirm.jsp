<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <style type="text/css">
		div.left{
			width:30%;
			height:100%;
			background-color:yellow;
			float:left;
			margin:5px;
		}
		div.center{
			width:20%;
			height:100%;
			background-color:red;
			float:left;
			margin:5px;
		}
		div.right{
			width:30%;
			height:100%;
			background-color:green;
			float:left;
			margin:5px;
		}
	</style>
    <form>
		<div class="modal-header">
			<h4 class="modal-title" id="myLargeModalLabel">결재선지정</h4>
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		</div>
		<div class="modal-body">
			<div>
				<input type="radio" id="pRadio1" name="pRadio">
				<label for="pRadio1">기안->최종결재</label>
			</div>
			<div>
				<input type="radio" id="pRadio2" name="pRadio">
				<label for="pRadio2">기안->1차결재->최종결재</label>
			</div>
			<div>
				<input type="radio" id="pRadio3" name="pRadio" checked>
				<label for="pRadio3">기안->1차결재->2차결재->최종결재</label>
			</div>
	    	<div class="left">
	    		<c:forEach items="${departmentList}" var="vo">
					<ul>
						<li id="${vo.depCd}">${vo.depName}</li>
							<c:forEach items="${memberList}" var="vo2">
								<ul>
									<c:if test="${vo.depCd eq vo2.depCd}">
										<li id="${vo2.memCd}" class="members" data-vo2name="${vo2.memName}">
											${vo2.memName}
										</li>
									</c:if>
								</ul>
							</c:forEach>
					</ul>
				</c:forEach>
	    	</div>
	    	
	    	<div class="center">
	    		<div class="1stPayment">
	    			<input type="button" value="remove" id="1stConRemove">
	    			<input type="button" value="1차결재">
	    			<input type="button" value="add" id="1stConAdd">
	    		</div>
	    			
	    		<div class="2ndPayment">
	    			<input type="button" value="remove" id="2ndConRemove">
	    			<input type="button" value="2차결재">
	    			<input type="button" value="add" id="2ndConAdd">
	    		</div>
	    		
	    		<div>
	    			<input type="button" value="remove" id="3thConRemove">
	    			<input type="button" value="최종결재">
	    			<input type="button" value="add" id="3thConAdd">
	    		</div>
	    		
	    		<div>
	    			<input type="button" value="remove" id="refRemove">
	    			<input type="button" value="참조">
	    			<input type="button" value="add" id="refAdd">
	    		</div>
	    	</div>
	    	
	    	<div class="right">
	
	    		<div class="1stPayment">
	    			<h5>1차결재</h5>
					<p id="1stCon"></p>
	    		</div>
	    		
	    		<div class="2ndPayment">
	    			<h5>2차결재</h5>
					<p id="2ndCon"></p>
	    		</div>
	    		
	    		<div>
	    			<h5>최종결재</h5>
					<p id="3thCon"></p>
	    		</div>
	    		
	    		<div>
	    			<h5>참조</h5>
	    			<p id="ref"></p>
	    		</div>
	    	</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary" data-dismiss="modal" id="confirmSave">저장하기</button>
		</div>
    	
    </form>
    
    

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script> -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- <script>
$('#tree').jstree({ 
  'core' : {
    'data' : [
      { "id" : "ajson1", "parent" : "#", "text" : "Simple root node" },
      { "id" : "ajson2", "parent" : "#", "text" : "Root node 2" },
      { "id" : "ajson3", "parent" : "ajson2", "text" : "Child 1" },
      { "id" : "ajson4", "parent" : "ajson2", "text" : "Child 2" },
    ]
  }
});
</script> -->
<script>

  	
  	$(document).ready(function () {
  		let memCd = 0;
  		let memName = "";
  		let conStep = 0;
  		let con1 = "";
  		let con2 = "";
  		let con3 = "";
  		let conArr = []; //결재자'들'의 정보를 담을 배열
  		let refArr = [];
  		let conArr1 = {}; //conArr[]에 담을 결재자의 정보 배열
  		let conArr2 = {};
  		let conArr3 = {};
  		
  		
  		//기안->최종결재
    	$("#pRadio1").on("click", function () {
    		console.log("아무거나")
      		if ($(this).prop("checked")) {
        		console.log(this);
        		$('.1stPayment').hide();
        		$('.2ndPayment').hide();
      		}else {
      			$('.1stPayment').show();
        		$('.2ndPayment').show();
      		}
    	});
    	
    	//기안->1차결재->최종결재
    	$("#pRadio2").on("click", function () {
      		if ($(this).prop("checked")) {
        		console.log(this);
        		$('.1stPayment').show();
        		$('.2ndPayment').hide();
      		}else {
      			$('.1stPayment').show();
        		$('.2ndPayment').show();
      		}
    	});
    	
    	//기안->1차결재->2차결재->최종결재
    	$("#pRadio3").on("click", function () {
      		if ($(this).prop("checked")) {
        		console.log(this);
        		$('.1stPayment').show();
        		$('.2ndPayment').show();
      		}else {
      			$('.1stPayment').show();
        		$('.2ndPayment').show();
      		}
    	});
		
    	
    	//클릭한 사람 이름/사번가져오기
    	$('.members').on("click", function () {
    		memCd = $(this).attr("id");
      	 	memName = $(this).attr("data-vo2name");
    	});
      	
    	//1차결재
      	$('#1stConAdd').on("click", function(){
      		console.log("1차결재add작동");
			$('#1stCon').empty();
			con1 = "<span class='1stConClass' data-1stConCd="+memCd+" data-1stConName="+memName+" data-step=2>"+memName+"</span>";
			$('#1stCon').append(con1);

			conArr1 = {};
			
			conArr1 = {
						memCd:memCd,
						memName:memName,
						conStep:2
						};
			console.log(conArr1); 
			
 			memCd = "";
 			memName = "";
			
      	});
    	
      	$('#1stConRemove').on("click", function(){
      		console.log("1차결재remove작동");
			$('#1stCon').empty();
			
			conArr1 = {};
			console.log(conArr1); 
			
			memCd = "";
 			memName = "";
			
      	});
    	
      	//2차결재
      	$('#2ndConAdd').on("click", function(){
      		console.log("2차결재add작동");
			$('#2ndCon').empty();
			con2 = "<span class='2ndConClass' data-2ndConCd="+memCd+" data-2ndConName="+memName+" data-step=3>"+memName+"</span>";
			$('#2ndCon').append(con2);
			
			conArr2 = {};
			
			conArr2 = {
					memCd:memCd,
					memName:memName,
					conStep:3
					};
			console.log(conArr2); 
			
			memCd = "";
 			memName = "";

      	});
      	
      	$('#2ndConRemove').on("click", function(){
      		console.log("2차결재remove작동");
			$('#2ndCon').empty();
			
			conArr2 = {};
			console.log(conArr2); 
			
			memCd = "";
 			memName = "";
			
      	});
    	
      	//최종결재
      	$('#3thConAdd').on("click", function(){
      		console.log("3차결재add작동");
			$('#3thCon').empty();
			con3 = "<span class='3thConClass' data-3thConCd="+memCd+" data-3thConName="+memName+" data-step=4>"+memName+"</span>";
			$('#3thCon').append(con3);
			
			conArr3 = {};
			
			conArr3 = {
					memCd:memCd,
					memName:memName,
					conStep:4
					};
			console.log(conArr3); 

			memCd = "";
 			memName = "";
			
      	});
      	
      	$('#3thConRemove').on("click", function(){
      		console.log("3차결재remove작동");
			$('#3thCon').empty();
			
			conArr3 = {};
			console.log(conArr3); 
			
			memCd = "";
 			memName = "";
 			
      	});
      	
      	$('#confirmSave').on("click", function(){
			console.log("작동동")
			$('#1stConMem').empty();
			$('#2ndConMem').empty();
			$('#3thConMem').empty();
			let confirm1 = $('#1stCon').children('.1stConClass');
			let confirm2 = $('#2ndCon').children('.2ndConClass');
			let confirm3 = $('#3thCon').children('.3thConClass');
 			$('#1stConMem').append(confirm1);
			$('#2ndConMem').append(confirm2);
			$('#3thConMem').append(confirm3);
			
			
			conArr.push(conArr1);
			conArr.push(conArr2);
			conArr.push(conArr3);
			
			console.log(conArr);
      	}); 
  	});
  	
  	
  	
  	

</script>
