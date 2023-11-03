<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

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
	
	
	<form action="insert" method="post" enctype="multipart/form-data">
		<div>
			<input type="checkbox" id="checkVTab" value="1" name="dfVTab" checked />
			<label for="checkVTab">휴가종류탭 활성화</label>
			
			<input type="checkbox" id="checkOTab" value="1" name="dfOTab" checked />
			<label for="checkOTab">출타종류탭 활성화</label>
			
			<input type="checkbox" id="checkDTab" value="1" name="dfDTab" checked />
			<label for="checkDTab">날짜탭 활성화</label>
			
			<input type="checkbox" id="checkPTab" value="1" name="dfPTab" checked />
			<label for="checkPTab">금액탭 활성화</label>
			
			<input type="checkbox" id="checkLTab" value="1" name="dfLTab" checked />
			<label for="checkLTab">장소탭 활성화</label>
			
			<input type="checkbox" id="checkI1Tab" checked />
			<label for="checkI1Tab">Input1탭 활성화</label>
			
			<input type="checkbox" id="checkI2Tab" checked />
			<label for="checkI2Tab">Input2탭 활성화</label>
			
			<input type="checkbox" id="checkI3Tab" checked />
			<label for="checkI3Tab">Input3탭 활성화</label>
		</div>
	
		<table class="tg">
			<thead>
			  	<tr>
			    	<th class="tg-d1le tg-baqh-b tg-font-b" colspan="9">
			    		<input class="form-control" type="text" disabled="" placeholder="제목을 입력하세요">
			    	</th>
			  	</tr>
			</thead>
			<tbody>
				<tr>
					<td class="tg-baqh-r tg-baqh" colspan="5">
						<input class="form-control" type="text" name="dfKind" placeholder="문서양식의 이름을 입력하세요">
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
				    	<input class="form-control" type="text" disabled="">
				    </td>
				    <td class="tg-baqh">직무</td>
				    <td class="tg-baqh" colspan="2">
				    	<input class="form-control" type="text" disabled="">
				    </td>
				    <td class="tg-baqh">사번</td>
				    <td class="tg-baqh" colspan="2">
				    	<input class="form-control" type="text" disabled="">
				    </td>
			  	</tr>
			  	<tr>
			    	<td class="tg-baqh">이름</td>
				    <td class="tg-baqh" colspan="2">
				    	<input class="form-control" type="text" disabled="">
				    </td>
				    <td class="tg-baqh">연락처</td>
				    <td class="tg-baqh" colspan="2">
				    	<input class="form-control" type="text" disabled="">
				    </td>
				    <td class="tg-baqh-r tg-baqh"></td>
				    <td class="tg-baqh-l tg-baqh" colspan="2"></td>
			  	</tr>
			  	<tr id="vTab">
				    <td class="tg-baqh">휴가종류</td>
				    <td class="tg-baqh" colspan="8">
				    	<input type="radio" id="vRadio1" name="vRadio" disabled="">
						<label for="vRadio1">연차</label>
						<input type="radio" id="vRadio2" name="vRadio" disabled="">
						<label for="vRadio2">반차</label>
						<input type="radio" id="vRadio3" name="vRadio" disabled="">
						<label for="vRadio3">병가</label>
						<input type="radio" id="vRadio4" name="vRadio" disabled="">
						<label for="vRadio4">특별</label>
				    </td>
			  	</tr>
			  	<tr id="oTab">
				    <td class="tg-baqh">출타종류</td>
				    <td class="tg-baqh" colspan="8">
				    	<input type="radio" id="oRadio1" name="oRadio" disabled="">
						<label for="oRadio1">파견</label>
						<input type="radio" id="oRadio2" name="oRadio" disabled=""> 
						<label for="oRadio2">출장</label>
						<input type="radio" id="oRadio3" name="oRadio" disabled="">
						<label for="oRadio3">세미나</label>
						<input type="radio" id="oRadio4" name="oRadio" disabled="">
						<label for="oRadio4">교육</label>
				    </td>
			  	</tr>
			  	<tr id="dTab">
				    <td class="tg-baqh">
				    	<label>기간</label>
				    </td>
				    <td class="tg-baqh">
				    	<label>시작날짜</label>
				    </td>
				    <td class="tg-baqh" colspan="2">
				    	<input class="form-control" type="date" disabled="">
				    </td>
				    <td class="tg-baqh">
				    	<label>종료날짜</label>
				    </td>
				    <td class="tg-baqh" colspan="2">
				    	<input class="form-control" type="date" disabled="">
				    </td>
				    <td class="tg-baqh tg-baqh-r">
				    	<input class="form-control" type="text" disabled="">
				    </td>
				    <td class="tg-text-l tg-baqh-l" colspan="2">일</td>
				    
			  	</tr>
			  	<tr id="pTab">
				    <td class="tg-baqh">금액</td>
				    <td class="tg-baqh-r tg-baqh" colspan="3">
				    	<input class="form-control" type="text" disabled="">
				    </td>
				    <td class="tg-baqh-l tg-baqh tg-text-l">원</td>
				    <td class="tg-baqh" colspan="4">
				    	*금액은 '원'단위로 작성하여 주시기 바랍니다.
				    </td>
			  	</tr>
			  	<tr id="lTab">
				    <td class="tg-baqh">장소</td>
				    <td class="tg-baqh" colspan="8">
				    	<input class="form-control" type="text" disabled="">
				    </td>
			  	</tr>
			  	<tr id="i1Tab">
				    <td class="tg-baqh">
				    	<input class="form-control" type="text" name="dfIn1Tab" placeholder="항목 입력">
				    </td>
				    <td class="tg-baqh" colspan="8">
				    	<input class="form-control" type="text" disabled="">
				    </td>
			  	</tr>
			  	<tr id="i2Tab">
				    <td class="tg-baqh">
				    	<input class="form-control" type="text" name="dfIn2Tab" placeholder="항목 입력">
				    </td>
				    <td class="tg-baqh" colspan="8">
				    	<input class="form-control" type="text" disabled="">
				    </td>
			  	</tr>
			  	<tr id="i3Tab">
				    <td class="tg-baqh">
				    	<input class="form-control" type="text" name="dfIn3Tab" placeholder="항목 입력">
				    </td>
				    <td class="tg-baqh" colspan="8">
				    	<input class="form-control" type="text" disabled="">
				    </td>
			  	</tr>
			  	<tr>
				    <td class="tg-baqh">사유</td>
				    <td class="tg-baqh" colspan="8">
				    	<input class="form-control" type="text" disabled="">
				    </td>
			  	</tr>
			  	<tr>
			    	<td class="tg-baqh" colspan="9">
			    		<input class="form-control" type="text" name="dfContents" placeholder="위와 같이 문서를 상신하오니 확인하여 주시기 바랍니다.">
			    	</td>
			  	</tr>
			  	<tr>
			    	<td class="tg-baqh tg-baqh-b" colspan="9">2023년 10월 25일</td>
			  	</tr>
			  	<tr>
			    	<td class="tg-text-r tg-baqh-r tg-baqh-b tg-baqh-t" colspan="7">성명 : </td>
			    	<td class="tg-baqh-l tg-baqh-r tg-baqh tg-baqh-b tg-baqh-t" colspan="1">
			    		<input class="form-control" type="text" disabled="">
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
			<button type="submit" class="btn btn-success">작성완료</button>
		</div>
	</form>



<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

	//휴가종류탭 활성화
	$(document).ready(function () {
	$("#checkVTab").on("click", function () {
  		if ($(this).prop("checked")) {
    		$('#vTab').show();
  		}else {
			$('#vTab').hide();
  		}
	});
	});
	
	//출타종류탭 활성화
  	$(document).ready(function () {
    	$("#checkOTab").on("click", function () {
      		if ($(this).prop("checked")) {
        		$('#oTab').show();
      		}else {
    			$('#oTab').hide();
      		}
    	});
  	});

	//날짜탭 활성화
  	$(document).ready(function () {
    	$("#checkDTab").on("click", function () {
      		if ($(this).prop("checked")) {
        		$('#dTab').show();
      		}else {
    			$('#dTab').hide();
      		}
    	});
  	});
  	
  	//금액탭 활성화
  	$(document).ready(function () {
    	$("#checkPTab").on("click", function () {
      		if ($(this).prop("checked")) {
        		$('#pTab').show();
      		}else {
    			$('#pTab').hide();
      		}
    	});
  	});
  	
  	//장소탭 활성화
  	$(document).ready(function () {
    	$("#checkLTab").on("click", function () {
      		if ($(this).prop("checked")) {
        		$('#lTab').show();
      		}else {
    			$('#lTab').hide();
      		}
    	});
  	});
  	
  	//input1탭 활성화
  	$(document).ready(function () {
    	$("#checkI1Tab").on("click", function () {
      		if ($(this).prop("checked")) {
        		$('#i1Tab').show();
      		}else {
    			$('#i1Tab').hide();
      		}
    	});
  	});
  	
  	//input2탭 활성화
  	$(document).ready(function () {
    	$("#checkI2Tab").on("click", function () {
      		if ($(this).prop("checked")) {
        		console.log(this);
        		$('#i2Tab').show();
      		}else {
    			$('#i2Tab').hide();
      		}
    	});
  	});
  
  	//input3탭 활성화
  	$(document).ready(function () {
    	$("#checkI3Tab").on("click", function () {
      		if ($(this).prop("checked")) {
        		console.log(this);
        		$('#i3Tab').show();
      		}else {
    			$('#i3Tab').hide();
      		}
    	});
  	});
  	
  	
  	
</script>
