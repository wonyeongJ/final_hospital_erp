<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


	<h1>직원상세(재직자)</h1>
	<h3></h3>
	<form action="update" method="post">
		<div class="form-group row">
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" name="memCd" value="${memberVO.memCd}" hidden>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">이름</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" name="memName" value="${memberVO.memName}" >
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">주민등록번호</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text"  value="${memberVO.memRnum}" readonly >
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">이메일</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="email" name="memEmail" value="${memberVO.memEmail}" >
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">직무</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" value="${memberVO.jobName}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">입사일</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="date" value="${memberVO.memHdate}" readonly>
			</div>
		</div>
			<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">연봉</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="number" name="memSalary" value="${memberVO.memSalary}">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">부서</label>
			<div class="col-sm-12 col-md-10">
				<select name="depCd" class="custom-select">
					<c:forEach items="${departmentAr}" var="departmentVO">
						<c:choose>
							<c:when test="${departmentVO.depCd eq memberVO.depCd}">
								<option value="${departmentVO.depCd }" selected="selected">${departmentVO.depName }</option>
							</c:when>
							<c:otherwise>
								<option value="${departmentVO.depCd }" >${departmentVO.depName }</option>
							</c:otherwise>
						</c:choose>
			
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">연차</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="number" name="memAnnual" value="${memberVO.memAnnual}">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">직책</label>
			<div class="col-sm-12 col-md-10">
				<select name="posCd" class="custom-select">
					<c:forEach items="${codeAr}" var="codeVO">
						<c:if test="${codeVO.codeGname eq 'POSITION'}">
							<c:choose>
								<c:when test="${codeVO.codeCd eq memberVO.posCd}">
									<option value="${codeVO.codeCd }" selected="selected">${codeVO.codeName }</option>
								</c:when>
								<c:otherwise>
									<option value="${codeVO.codeCd }" >${codeVO.codeName }</option>
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-12 col-md-2 col-form-label">성별</label>
			<div class="col-sm-12 col-md-10">
				<input class="form-control" type="text" name="memCodeCd" value="${memberVO.codeName}" readonly>
			</div>
		</div>
		
		<div style="display: flex; justify-content: flex-end;">
			<button type="submit" class="btn btn-primary">수정완료</button>
		</div>
	</form>
