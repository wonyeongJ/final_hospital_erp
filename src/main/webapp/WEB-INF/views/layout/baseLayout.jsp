<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>

</head>

<body>
	<!-- preloader -->
	<tiles:insertAttribute name="preloader"/>
	
	<!-- Page Wrapper -->
    <div id="wrapper">
    
		<!-- sidebar -->
		<tiles:insertAttribute name="sidebar"/>
		
		<div id="content-wrapper" class="d-flex flex-column">
    		<div id="content">
    		<!-- topbar -->
    		<tiles:insertAttribute name="topbar"/>
    		
    		<%-- <!-- rSidebar -->
			<tiles:insertAttribute name="rSidebar"/> --%>
			
			<!-- Begin Page Content -->
	        	<div class="main-container">
	                <!-- page 내용 -->
	                <tiles:insertAttribute name="body"/>
	                
	                
	                
	            </div>
	        </div>
	        <!-- footer -->
	        <tiles:insertAttribute name="footer"/>
	    </div>
	</div>
<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>
</body>
</html>