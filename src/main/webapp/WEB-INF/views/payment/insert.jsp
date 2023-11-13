<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

	<style type="text/css">
	.tg  {border-collapse:collapse;border-spacing:0; background: white; table-layout: fixed; align-self: center;}
	.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:18px;
	  overflow:hidden;padding:10px 5px;word-break:normal;font-weight:bold;}
	.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
	  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg .tg-baqh{text-align:center;width:120px;}
	.tg .tg-text-r{text-align:right;width:120px;}
	.tg .tg-text-l{text-align:left;width:120px;}
	.tg .tg-d1le{border-color:inherit;font-size:26px;font-weight:bold;text-align:center;width:120px;}
	.tg .tg-baqh-b{border-bottom:none;}
	.tg .tg-baqh-t{border-top:none;}
	.tg .tg-baqh-l{border-left:none;}
	.tg .tg-baqh-r{border-right:none;}
	.tg .tg-height{height: 80px; table-layout: fixed;}
	.tg .tg-font-b{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:30px;
	  font-weight:bold;overflow:hidden;padding:10px 5px;word-break:normal;}
	  
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
	
	<form action="/payment/insert" method="post" enctype="multipart/form-data">
		<input class="form-control" type="hidden" name="dfCd" value="${documentFormVO.dfCd}">
		
		<!-- 모달 -->
		<div>
			<div class="col-md-4 col-sm-12 mb-30">
				<div class="pd-20 card-box height-100-p">
					<h5 class="h4">결재선지정</h5>
					<a href="#" class="btn-block" data-toggle="modal" data-target="#bd-example-modal-lg" type="button">
						<img src="vendors/images/modal-img1.jpg" alt="modal" id="confirmResult">

					</a>
					<div class="modal fade bs-example-modal-lg" id="bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" style="display: none;" aria-hidden="true">
						<div class="modal-dialog modal-lg modal-dialog-centered">
							<div class="modal-content">
								<div id="confirmAjaxResult">
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
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<c:forEach items="${conArr}" var="voCon">
		<input type="text" name="" value="${voCon.memCd}">
		<input type="text" name="" value="${voCon.memName}">
		<input type="text" name="" value="${voCon.data-step}">
		</c:forEach>
		<!--  -->
		<table class="tg">
			<thead>
			  	<tr>
			    	<th class="tg-d1le tg-baqh-b tg-font-b" colspan="9">
			    		<input class="form-control" type="text" name="epTitle" placeholder="제목을 입력하세요">
			    	</th>
			  	</tr>
			</thead>
			<tbody>
				<tr>
					<td class="tg-baqh-r tg-baqh" colspan="5">
						<h2>${documentFormVO.dfKind}</h2>
						<input type="hidden" name="dfKind" value="${documentFormVO.dfKind}">
				    </td>
				    
				    <td class="tg-baqh-l tg-baqh" colspan="4">
				    	<table align="right">
				    		<tr>
				    			<td class="tg-baqh">
									기안
								</td>
								<td class="tg-baqh 1stPayment">
									1차결재
								</td>
								<td class="tg-baqh 2ndPayment">
									2차결재
								</td>
								<td class="tg-baqh">
									최종결재
								</td>
				    		</tr>
				    		<tr>
				    			<td class="tg-baqh">
									${memberVO.memName}
								</td>
								<td class="tg-baqh 1stPayment">
									<p id="1stConMem"></p>
								</td>
								<td class="tg-baqh 2ndPayment">
									<p id="2ndConMem"></p>
								</td>
								<td class="tg-baqh">
									<p id="3thConMem"></p>
								</td>
				    		</tr>
				    		<tr>
								<td class="tg-baqh tg-height">
									<img alt="" src="">
								</td>
								<td class="tg-baqh tg-height 1stPayment">
									<img alt="" src="">
								</td>
								<td class="tg-baqh tg-height 2ndPayment">
									<img alt="" src="">
								</td>
								<td class="tg-baqh tg-height">
									<img alt="" src="">
								</td>
							</tr>
				    	</table>
				    </td>
				</tr>
				
			  	<tr>
				    <td class="tg-baqh">소속</td>
				    <td class="tg-baqh" colspan="2">
				    	<input class="form-control" type="text" value="${memberVO.depName}" readonly>
				    </td>
				    <td class="tg-baqh">직무</td>
				    <td class="tg-baqh" colspan="2">
				    	<input class="form-control" type="text" value="${memberVO.jobCd}" readonly>
				    </td>
				    <td class="tg-baqh">사번</td>
				    <td class="tg-baqh" colspan="2">
				    	<input class="form-control" type="text" name="memCd" value="${memberVO.memCd}" readonly>
				    </td>
			  	</tr>
			  	<tr>
			    	<td class="tg-baqh">이름</td>
				    <td class="tg-baqh" colspan="2">
				    	<input class="form-control" type="text" value="${memberVO.memName}" readonly>
				    </td>
				    <td class="tg-baqh">연락처</td>
				    <td class="tg-baqh tg-baqh-r" colspan="3">
				    	<input class="form-control" type="text" value="${memberVO.memPnum}" readonly>
				    </td>
				    <td class="tg-baqh-r tg-baqh-l tg-baqh"></td>
				    <td class="tg-baqh-l tg-baqh"></td>
			  	</tr>
			  	
			  	<c:if test="${documentFormVO.dfVTab eq '1'}">
				  	<tr id="vTab">
					    <td class="tg-baqh">휴가종류</td>
					    <td class="tg-baqh" colspan="8">
					    	<input type="radio" id="vRadio1" name="epVType" value="연차">
							<label for="vRadio1">연차</label>
							<input type="radio" id="vRadio2" name="epVType" value="반차">
							<label for="vRadio2">반차</label>
							<input type="radio" id="vRadio3" name="epVType" value="병가">
							<label for="vRadio3">병가</label>
							<input type="radio" id="vRadio4" name="epVType" value="특별">
							<label for="vRadio4">특별</label>
					    </td>
				  	</tr>
				</c:if>
			  	
			  	<c:if test="${documentFormVO.dfOTab  eq '1'}">
				  	<tr id="oTab">
					    <td class="tg-baqh">출타종류</td>
					    <td class="tg-baqh" colspan="8">
					    	<input type="radio" id="oRadio1" name="epOType" value="파견">
							<label for="oRadio1">파견</label>
							<input type="radio" id="oRadio2" name="epOType" value="출장">
							<label for="oRadio2">출장</label>
							<input type="radio" id="oRadio3" name="epOType" value="세미나">
							<label for="oRadio3">세미나</label>
							<input type="radio" id="oRadio4" name="epOType" value="교육">
							<label for="oRadio4">교육</label>
					    </td>
				  	</tr>
				</c:if>
			  	
			  	<c:if test="${documentFormVO.dfDTab  eq '1'}">
				  	<tr id="dTab">
					    <td class="tg-baqh">
					    	<label>기간</label>
					    </td>
					    <td class="tg-baqh tg-baqh-r">
					    	<label>시작날짜</label>
					    </td>
					    <td class="tg-baqh tg-baqh-l" colspan="2">
					    	<input class="form-control" type="date" name="epSDate">
					    </td>
					    <td class="tg-baqh tg-baqh-r">
					    	<label>종료날짜</label>
					    </td>
					    <td class="tg-baqh tg-baqh-l" colspan="2">
					    	<input class="form-control" type="date" name="epEDate">
					    </td>
					    <td class="tg-baqh tg-baqh-r">
					    	<input class="form-control" type="text" name="epDays">
					    </td>
					    <td class="tg-text-l tg-baqh-l" colspan="2">일</td>
				
				  	</tr>
				</c:if>
				  	
				<c:if test="${documentFormVO.dfPTab  eq '1'}">
				  	<tr id="pTab">
					    <td class="tg-baqh">금액</td>
					    <td class="tg-baqh-r tg-baqh" colspan="3">
					    	<input class="form-control" type="text" name="epPrice">
					    </td>
					    <td class="tg-baqh-l tg-baqh tg-text-l">원</td>
					    <td class="tg-baqh" colspan="4">
					    	*금액은 '원'단위로 작성하여 주시기 바랍니다.
					    </td>
				  	</tr>
				</c:if>

			  	<c:if test="${not empty documentFormVO.dfIn1Tab}">
				  	<tr id="i1Tab">
					    <td class="tg-baqh">
					    	${documentFormVO.dfIn1Tab}
					    </td>
					    <td class="tg-baqh" colspan="8">
					    	<input class="form-control" type="text" name="epInput1">
					    </td>
				  	</tr>
			  	</c:if>
			  	
			  	<c:if test="${not empty documentFormVO.dfIn2Tab}">
				  	<tr id="i2Tab">
					    <td class="tg-baqh">
					    	${documentFormVO.dfIn2Tab}
					    </td>
					    <td class="tg-baqh" colspan="8">
					    	<input class="form-control" type="text" name="epInput2">
					    </td>
				  	</tr>
			  	</c:if>
			  	
			  	<c:if test="${not empty documentFormVO.dfIn3Tab}">
				  	<tr id="i3Tab">
					    <td class="tg-baqh">
					    	${documentFormVO.dfIn3Tab}
					    </td>
					    <td class="tg-baqh" colspan="8">
					    	<input class="form-control" type="text" name="epInput3">
					    </td>
				  	</tr>
			  	</c:if>
			  	
			  	<tr>
				    <td class="tg-baqh">사유</td>
				    <td class="tg-baqh" colspan="8">
				    	<input class="form-control" type="text" name="epReason">
				    </td>
			  	</tr>
			  	
			  	
			  	<tr>
					<td class="tg-baqh" colspan="9">
						<div class="html-editor pd-20 card-box mb-30">
							<ul class="wysihtml5-toolbar" style="">
								<li class="dropdown"><a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-font"></i>&nbsp;<span class="current-font">Normal text</span>&nbsp;<b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li><a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="div" href="javascript:;" unselectable="on">Normal text</a></li>
										<li><a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h1" href="javascript:;" unselectable="on">Heading 1</a></li>
										<li><a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h2" href="javascript:;" unselectable="on">Heading 2</a></li>
										<li><a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h3" href="javascript:;" unselectable="on">Heading 3</a></li>
									</ul>
								</li>
								<li>
									<div class="btn-group">
										<a class="btn" data-wysihtml5-command="bold" title="CTRL+B" href="javascript:;" unselectable="on">Bold</a>
										<a class="btn" data-wysihtml5-command="italic" title="CTRL+I" href="javascript:;" unselectable="on">Italic</a>
										<a class="btn" data-wysihtml5-command="underline" title="CTRL+U" href="javascript:;" unselectable="on">Underline</a>
									</div>
								</li>
								<li>
									<div class="btn-group">
										<a class="btn" data-wysihtml5-command="insertUnorderedList" title="Unordered list" href="javascript:;" unselectable="on"><i class="fa fa-list"></i></a>
										<a class="btn" data-wysihtml5-command="insertOrderedList" title="Ordered list" href="javascript:;" unselectable="on"><i class="fa fa-th-list"></i></a>
										<a class="btn" data-wysihtml5-command="Outdent" title="Outdent" href="javascript:;" unselectable="on"><i class="fa fa-outdent"></i></a>
										<a class="btn" data-wysihtml5-command="Indent" title="Indent" href="javascript:;" unselectable="on"><i class="fa fa-indent"></i></a>
									</div>
								</li>
								<li>
									<div class="btn-group">
										<a class="btn" data-wysihtml5-action="change_view" title="Edit HTML" href="javascript:;" unselectable="on"><i class="fa fa-pencil"></i></a>
									</div>
								</li>
								<li>
									<div class="bootstrap-wysihtml5-insert-link-modal modal fade bs-example-modal-lg">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-header">
													<a class="close" data-dismiss="modal"></a>
													<h3>Insert link</h3>
												</div>
												<div class="modal-body">
													<div class="form-group">
														<input value="http://" class="bootstrap-wysihtml5-insert-link-url form-control" type="text">
													</div>
												</div>
												<div class="modal-footer">
													<a href="#" class="btn btn-inverse" data-dismiss="modal">Cancel</a>
													<a href="#" class="btn btn-primary" data-dismiss="modal">Insert link</a>
												</div>
											</div>
										</div>
									</div>
									<a class="btn" data-wysihtml5-command="createLink" title="Insert link" href="javascript:;" unselectable="on"><i class="fa fa-link"></i></a>
								</li>
								<li>
									<div class="bootstrap-wysihtml5-insert-image-modal modal fade bs-example-modal-lg">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-header">
													<a class="close" data-dismiss="modal"></a>
													<h3>Insert image</h3>
												</div>
												<div class="modal-body">
													<div class="form-group">
														<input value="http://" class="bootstrap-wysihtml5-insert-image-url  m-wrap large form-control" type="text">
													</div>
												</div>
												<div class="modal-footer">
													<a href="#" class="btn" data-dismiss="modal">Cancel</a>
													<a href="#" class="btn  green btn-primary" data-dismiss="modal">Insert image</a>
												</div>
											</div>
										</div>
									</div>
									<a class="btn" data-wysihtml5-command="insertImage" title="Insert image" href="javascript:;" unselectable="on"><i class="fa fa-image "></i></a>
								</li>
							</ul>
							<textarea class="textarea_editor form-control border-radius-0" style="display: none;" placeholder="Enter text ..."></textarea>
							<input type="hidden" name="_wysihtml5_mode" value="1">
							<iframe class="wysihtml5-sandbox" security="restricted" allowtransparency="true" frameborder="0" width="0" height="0" marginwidth="0" marginheight="0" style="display: block; background-color: rgb(255, 255, 255); border-collapse: separate; border-color: rgb(212, 212, 212); border-style: solid; border-width: 0.8px; clear: none; float: none; margin: 0px; outline: rgb(19, 30, 34) none 0px; outline-offset: 0px; padding: 6px 12px; position: static; inset: auto; z-index: auto; vertical-align: baseline; text-align: start; box-sizing: border-box; box-shadow: none; border-radius: 0px; width: 1119.2px; height: 300px;"></iframe>
						</div>
					</td>
			  	</tr>
			  	
			  	<tr>
			    	<td class="tg-baqh" colspan="9">
			    		${documentFormVO.dfContents}
			    	</td>
			  	</tr>
			  	
			  	<tr>
			    	<td class="tg-baqh tg-baqh-b" colspan="9">
						<%Date now = new Date();%>
						<%SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");String today = sf.format(now);%>
						<%=today %>
			    	</td>
			  	</tr>
			  		
			  	<tr>
			    	<td class="tg-text-r tg-baqh-r tg-baqh-b tg-baqh-t" colspan="7">성명 : </td>
			    	<td class="tg-baqh-l tg-baqh-r tg-baqh tg-baqh-b tg-baqh-t" colspan="1">
			    		<p>${memberVO.memName}</p>
			    	</td>
			    	<td class="tg-baqh-l tg-baqh-b tg-baqh-t tg-baqh" colspan="1">(인)</td>
			  	</tr>
			  	
			  	<tr>
			    	<td class="tg-baqh tg-font-b tg-baqh-t" colspan="9">구디병원 병원장 귀하</td>
			  	</tr>
			  	
			</tbody>
		</table>
		<div>
			<button type="reset" class="btn btn-danger">다시작성</button>
			<button type="submit" class="btn btn-danger" name="epDStatus" value="2">임시저장</button>
			<button type="submit" class="btn btn-success" name="epDStatus" value="0">기안상신</button>
		</div>
	</form>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

/*   	$(document).ready(function () {
  		$("#confirmResult").on("click", function () {
			$.ajax({
			    type : 'get', // 타입 (get, post, put 등등)
			    url : '/payment/confirm/insertForm', // 요청할 서버url

			    
			    success : function(result) { // 결과 성공 콜백함수
			        $('#confirmAjaxResult').empty();
			    	$('#confirmAjaxResult').append(result);
			    },
			    error : function(request, status, error) { // 결과 에러 콜백함수
			        console.log(error)
			    }
			})
		});
  		

  		
	}); */
  	
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
