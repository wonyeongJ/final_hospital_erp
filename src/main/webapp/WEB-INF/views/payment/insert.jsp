<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	</style>
	
	<form action="/payment/insert" method="post" enctype="multipart/form-data">
		<input class="form-control" type="hidden" name="dfCd" value="${documentFormVO.dfCd}">
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
				    	<input class="form-control" type="text" value="${memberVO.depName}" disabled="">
				    </td>
				    <td class="tg-baqh">직무</td>
				    <td class="tg-baqh" colspan="2">
				    	<input class="form-control" type="text" value="${memberVO.jobCd}" disabled="">
				    </td>
				    <td class="tg-baqh">사번</td>
				    <td class="tg-baqh" colspan="2">
				    	<input class="form-control" type="text" name="memCd" value="${memberVO.memCd}">
				    </td>
			  	</tr>
			  	<tr>
			    	<td class="tg-baqh">이름</td>
				    <td class="tg-baqh" colspan="2">
				    	<input class="form-control" type="text" value="${memberVO.memName}" disabled="">
				    </td>
				    <td class="tg-baqh">연락처</td>
				    <td class="tg-baqh" colspan="2">
				    	<input class="form-control" type="text" value="${memberVO.memPnum}" disabled="">
				    </td>
				    <td class="tg-baqh-r tg-baqh"></td>
				    <td class="tg-baqh-l tg-baqh" colspan="2"></td>
			  	</tr>
			  	
			  	<c:if test="${not empty documentFormVO.dfVTab}">
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
			  	
			  	<c:if test="${not empty documentFormVO.dfOTab}">
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
			  	
			  	<c:if test="${not empty documentFormVO.dfDTab}">
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
					    	<input class="form-control" type="text">
					    </td>
					    <td class="tg-text-l tg-baqh-l" colspan="2">일</td>
				
				  	</tr>
				</c:if>
				  	
				<c:if test="${not empty documentFormVO.dfPTab}">
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
			    		${documentFormVO.dfContents}
			    	</td>
			  	</tr>
			  	<tr>
			    	<td class="tg-baqh tg-baqh-b" colspan="9">2023년 10월 25일</td>
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
			<button type="submit" class="btn btn-success">기안상신</button>
		</div>
	</form>



<script>
  	//기안->최종결재
  	$(document).ready(function () {
    	$("#pRadio1").on("click", function () {
      		if ($(this).prop("checked")) {
        		console.log(this);
        		$('.1stPayment').hide();
        		$('.2ndPayment').hide();
      		}else {
      			$('.1stPayment').show();
        		$('.2ndPayment').show();
      		}
    	});
  	});
  	
  	//기안->1차결재->최종결재
  	$(document).ready(function () {
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
  	});
  	
  	//기안->1차결재->2차결재->최종결재
  	$(document).ready(function () {
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
  	});
  	
  	
</script>
