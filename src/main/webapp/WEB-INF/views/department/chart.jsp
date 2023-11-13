<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/orgchart/3.8.0/css/jquery.orgchart.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/orgchart/3.8.0/css/jquery.orgchart.min.css">
	<style>
	.orgchart .top-level .title {
 background-color: #006699;
}
.orgchart .top-level content{
 background-color: #006699;
}
.orgchart .middle-level .title {
 background-color: #009933;
}
.orgchart .middle-level content{
 background-color: #009933;
}
.orgchart .botton-level .title {
 background-color: #993366;
}
.orgchart .botton-level content{
 background-color: #993366;
}
	</style>
	<div class="pd-ltr-20 xs-pd-20-10">
		<div class="min-height-200px">
			<div class="card-box mb-30">
				<div id="chart-container" style="text-align: center;">
					<div id="orgchart">
					
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	

	<script type="text/javascript" src="/js/department/chart.js"></script>