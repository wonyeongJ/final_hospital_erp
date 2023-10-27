<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

	<style type="text/css">
	.tg  {border-collapse:collapse;border-spacing:0; background: white; table-layout: fixed;}
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
	
	<form>
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
					<td class="tg-baqh-b tg-baqh" colspan="5">
						<input class="form-control" type="text" placeholder="문서양식의 이름을 입력하세요">
				    </td>
					<td class="tg-baqh">
						기안
					</td>
					<td class="tg-baqh">
						1차결재
					</td>
					<td class="tg-baqh">
						2차결재
					</td>
					<td class="tg-baqh">
						최종결재
					</td>
				</tr>
				<tr>
					<td class="tg-baqh-t tg-baqh" colspan="5">
					
					</td>
					<td class="tg-baqh tg-height">
						<img alt="" src="">
					</td>
					<td class="tg-baqh tg-height">
						<img alt="" src="">
					</td>
					<td class="tg-baqh tg-height">
						<img alt="" src="">
					</td>
					<td class="tg-baqh tg-height">
						<img alt="" src="">
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
				    <td class="tg-baqh">내선번호</td>
				    <td class="tg-baqh" colspan="2">
				    	<input class="form-control" type="text" disabled="">
				    </td>
				    <td class="tg-baqh-r tg-baqh"></td>
				    <td class="tg-baqh-l tg-baqh" colspan="2"></td>
			  	</tr>
			  	<tr>
				    <td class="tg-baqh">휴가종류</td>
				    <td class="tg-baqh" colspan="8">
				    	<input type="radio" id="customRadio4" name="customRadio" disabled="">
						<label for="customRadio4">연차</label>
						<input type="radio" id="customRadio5" name="customRadio" disabled="">
						<label for="customRadio5">반차</label>
						<input type="radio" id="customRadio6" name="customRadio" disabled="">
						<label for="customRadio6">병가</label>
						<input type="radio" id="customRadio7" name="customRadio" disabled="">
						<label for="customRadio7">특별</label>
				    </td>
			  	</tr>
			  	<tr>
				    <td class="tg-baqh">출타종류</td>
				    <td class="tg-baqh" colspan="8">
				    	<input type="radio" id="customRadio8" name="customRadio" disabled="">
						<label for="customRadio8">파견</label>
						<input type="radio" id="customRadio9" name="customRadio" disabled="">
						<label for="customRadio9">출장</label>
						<input type="radio" id="customRadio10" name="customRadio" disabled="">
						<label for="customRadio10">세미나</label>
						<input type="radio" id="customRadio11" name="customRadio" disabled="">
						<label for="customRadio11">교육</label>
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
			  	<tr>
				    <td class="tg-baqh">
				    	<input class="form-control" type="text" placeholder="항목 입력">
				    </td>
				    <td class="tg-baqh" colspan="8">
				    	<input class="form-control" type="text" disabled="">
				    </td>
			  	</tr>
			  	<tr>
				    <td class="tg-baqh">
				    	<input class="form-control" type="text" placeholder="항목 입력">
				    </td>
				    <td class="tg-baqh" colspan="8">
				    	<input class="form-control" type="text" disabled="">
				    </td>
			  	</tr>
			  	<tr>
				    <td class="tg-baqh">
				    	<input class="form-control" type="text" placeholder="항목 입력">
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
			    		<input class="form-control" type="text" placeholder="위와 같이 휴가를 신청하오니 허락하여 주시기 바랍니다.">
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


</script>
