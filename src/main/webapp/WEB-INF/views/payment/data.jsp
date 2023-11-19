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
	</style>
	
		<table class="tg">
			<thead>
			  	<tr>
			    	<th class="tg-d1le tg-baqh-b tg-font-b" colspan="9">
			    		<h2>${paymentVO.epTitle}</h2>
			    	</th>
			  	</tr>
			</thead>
			<tbody>
				<tr>
					<td class="tg-baqh-r tg-baqh" colspan="5">
						<h2>${paymentVO.documentFormVOs.dfKind}</h2>
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
				    				<c:forEach items="${conList}" var="conVo">
										<c:if test="${conVo.conStep eq 1}">
											${conVo.memName}
										</c:if>
									</c:forEach>
								</td>
								<td class="tg-baqh 1stPayment">
									<c:forEach items="${conList}" var="conVo">
										<c:if test="${conVo.conStep eq 2}">
											${conVo.memName}
										</c:if>
									</c:forEach>
								</td>
								<td class="tg-baqh 2ndPayment">
									<c:forEach items="${conList}" var="conVo">
										<c:if test="${conVo.conStep eq 3}">
											${conVo.memName}
										</c:if>
									</c:forEach>
								</td>
								<td class="tg-baqh">
									<c:forEach items="${conList}" var="conVo">
										<c:if test="${conVo.conStep eq 4}">
											${conVo.memName}
										</c:if>
									</c:forEach>
								</td>
				    		</tr>
				    		<tr>
								<td class="tg-baqh tg-height">
									<c:forEach items="${conList}" var="conVo">
										<c:if test="${conVo.conStep eq 1}">
											<c:if test="${conVo.conPStatus eq 2}">
												<c:forEach items="${memberAllList}" var="memberAllVo">
													<c:if test="${conVo.memCd eq memberAllVo.memCd}">
														<img alt="" src="${memberAllVo.memSPath}">
											
													</c:if>
												</c:forEach>												
											</c:if>
										</c:if>
									</c:forEach>
								</td>
								<td class="tg-baqh tg-height 1stPayment">
									<c:forEach items="${conList}" var="conVo">
										<c:if test="${conVo.conStep eq 2}">
											<c:if test="${conVo.conPStatus eq 2}">
												<c:forEach items="${memberAllList}" var="memberAllVo">
													<c:if test="${conVo.memCd eq memberAllVo.memCd}">
														<img alt="" src="${memberAllVo.memSPath}">
											
													</c:if>
												</c:forEach>												
											</c:if>
										</c:if>
									</c:forEach>
								</td>
								<td class="tg-baqh tg-height 2ndPayment">
									<c:forEach items="${conList}" var="conVo">
										<c:if test="${conVo.conStep eq 3}">
											<c:if test="${conVo.conPStatus eq 2}">
												<c:forEach items="${memberAllList}" var="memberAllVo">
													<c:if test="${conVo.memCd eq memberAllVo.memCd}">
														<img alt="" src="${memberAllVo.memSPath}">
											
													</c:if>
												</c:forEach>												
											</c:if>
										</c:if>
									</c:forEach>
								</td>
								<td class="tg-baqh tg-height">
									<c:forEach items="${conList}" var="conVo">
										<c:if test="${conVo.conStep eq 4}">
											<c:if test="${conVo.conPStatus eq 2}">
												<c:forEach items="${memberAllList}" var="memberAllVo">
													<c:if test="${conVo.memCd eq memberAllVo.memCd}">
														<img alt="" src="${memberAllVo.memSPath}">
											
													</c:if>
												</c:forEach>												
											</c:if>
										</c:if>
									</c:forEach>
								</td>
							</tr>
				    	</table>
				    </td>
				</tr>

			  	<tr>
				    <td class="tg-baqh">소속</td>
				    <td class="tg-baqh" colspan="2">
				    	${paymentVO.departmentVOs.depName}
				    </td>
				    <td class="tg-baqh">직무</td>
				    <td class="tg-baqh" colspan="2">
				    	${paymentVO.memberVOs.jobCd}
				    </td>
				    <td class="tg-baqh">사번</td>
				    <td class="tg-baqh" colspan="2">
				    	${paymentVO.memberVOs.memCd}
				    </td>
			  	</tr>
			  	<tr>
			    	<td class="tg-baqh">이름</td>
				    <td class="tg-baqh" colspan="2">
				    	${paymentVO.memberVOs.memName}
				    </td>
				    <td class="tg-baqh">연락처</td>
				    <td class="tg-baqh tg-baqh-r" colspan="3">
				    	${paymentVO.memberVOs.memPnum}
				    </td>
				    <td class="tg-baqh-r tg-baqh-l tg-baqh"></td>
				    <td class="tg-baqh-l tg-baqh"></td>
			  	</tr>
			  	
			  	<c:if test="${paymentVO.documentFormVOs.dfVTab eq '1'}">
				  	<tr id="vTab">
					    <td class="tg-baqh">휴가종류</td>
					    <td class="tg-baqh" colspan="8">
					    	${paymentVO.epVType}
					    </td>
				  	</tr>
				</c:if>
			  	
			  	<c:if test="${paymentVO.documentFormVOs.dfOTab  eq '1'}">
				  	<tr id="oTab">
					    <td class="tg-baqh">출타종류</td>
					    <td class="tg-baqh" colspan="8">
					    	${paymentVO.epOType}
					    </td>
				  	</tr>
				</c:if>
			  	
			  	<c:if test="${paymentVO.documentFormVOs.dfDTab  eq '1'}">
				  	<tr id="dTab">
					    <td class="tg-baqh">
					    	<label>기간</label>
					    </td>
					    <td class="tg-baqh tg-baqh-r">
					    	<label>시작날짜</label>
					    </td>
					    <td class="tg-baqh tg-baqh-l" colspan="2">
					    	${paymentVO.epSDate}
					    </td>
					    <td class="tg-baqh tg-baqh-r">
					    	<label>종료날짜</label>
					    </td>
					    <td class="tg-baqh tg-baqh-l" colspan="2">
					    	${paymentVO.epEDate}
					    </td>
					    <td class="tg-baqh tg-baqh-r">
					    	${paymentVO.epDays}
					    </td>
					    <td class="tg-text-l tg-baqh-l" colspan="2">일</td>
				
				  	</tr>
				</c:if>
				  	
				<c:if test="${documentFormVO.dfPTab  eq '1'}">
				  	<tr id="pTab">
					    <td class="tg-baqh">금액</td>
					    <td class="tg-baqh-r tg-baqh" colspan="3">
					    	${paymentVO.epPrice}
					    </td>
					    <td class="tg-baqh-l tg-baqh tg-text-l">원</td>
					    <td class="tg-baqh" colspan="4">
					    	*금액은 '원'단위입니다.
					    </td>
				  	</tr>
				</c:if>

			  	<c:if test="${not empty documentFormVO.dfIn1Tab}">
				  	<tr id="i1Tab">
					    <td class="tg-baqh">
					    	${paymentVO.documentFormVOs.dfIn1Tab}
					    </td>
					    <td class="tg-baqh" colspan="8">
					    	${paymentVO.epInput1}
					    </td>
				  	</tr>
			  	</c:if>
			  	
			  	<c:if test="${not empty documentFormVO.dfIn2Tab}">
				  	<tr id="i2Tab">
					    <td class="tg-baqh">
					    	${paymentVO.documentFormVOs.dfIn2Tab}
					    </td>
					    <td class="tg-baqh" colspan="8">
					    	${paymentVO.epInput2}
					    </td>
				  	</tr>
			  	</c:if>
			  	
			  	<c:if test="${not empty documentFormVO.dfIn3Tab}">
				  	<tr id="i3Tab">
					    <td class="tg-baqh">
					    	${paymentVO.documentFormVOs.dfIn3Tab}
					    </td>
					    <td class="tg-baqh" colspan="8">
					    	${paymentVO.epInput3}
					    </td>
				  	</tr>
			  	</c:if>
			  	
			  	<tr>
				    <td class="tg-baqh">사유</td>
				    <td class="tg-baqh" colspan="8">
				    	${paymentVO.epReason}
				    </td>
			  	</tr>
			  	
			  	<tr>
					<td class="tg-baqh" colspan="9">
						
					</td>
			  	</tr>
			  	
			  	<tr>
			    	<td class="tg-baqh" colspan="9">
			    		${paymentVO.documentFormVOs.dfContents}
			    	</td>
			  	</tr>
			  	
			  	<tr>
			    	<td class="tg-baqh tg-baqh-b" colspan="9">
						${paymentVO.epRDate}
			    	</td>
			  	</tr>
			  		
			  	<tr>
			    	<td class="tg-text-r tg-baqh-r tg-baqh-b tg-baqh-t" colspan="8">성명 : </td>
			    	<td class="tg-baqh-l tg-baqh tg-baqh-b tg-baqh-t" colspan="1">
			    		<c:forEach items="${conList}" var="conVo">
										<c:if test="${conVo.conStep eq 1}">
											${conVo.memName}
										</c:if>
									</c:forEach>
			    	</td>
			  	</tr>
			  	
			  	<tr>
			    	<td class="tg-baqh tg-font-b tg-baqh-t" colspan="9">구디병원 병원장 귀하</td>
			  	</tr>
			  	
			</tbody>
		</table>
		<form action="/payment/data" method="post" enctype="multipart/form-data">
			<input type="hidden" name="memCd" value="${memberVO.memCd}">
			<input type="hidden" name="epCd" value="${paymentVO.epCd}">
			<c:forEach items="${conList}" var="conVo">
				<c:if test="${conVo.memCd eq memberVO.memCd}">
					<c:if test="${conVo.conPStatus eq '0'}">
						<c:if test="${conVo.conStep eq '4'}">
							<div>
								<c:if test="${paymentVO.documentFormVOs.dfCd eq 16}">
									<input type="hidden" name="epMemCd" value="${paymentVO.memberVOs.memCd}">
									<input type="hidden" name="epDays" value="${paymentVO.epDays}">
								</c:if>
								<input type="hidden" name="conStep" value="${conVo.conStep}">
								<input type="hidden" name="epDStatus" value="2">
								<button type="submit" class="btn btn-danger" name="conPStatus" value="1">반려</button>
								<button type="submit" class="btn btn-success" name="conPStatus" value="2">승인</button>
							</div>		
						</c:if>
						<c:if test="${conVo.conStep ne '4'}">
							<div>
								<input type="hidden" name="conStep" value="${conVo.conStep}">
								<button type="submit" class="btn btn-danger" name="conPStatus" value="1">반려</button>
								<button type="submit" class="btn btn-success" name="conPStatus" value="2">승인</button>
							</div>		
						</c:if>
					</c:if>
				</c:if>
			</c:forEach>
		</form>



<script src="http://code.jquery.com/jquery-latest.min.js"></script>
