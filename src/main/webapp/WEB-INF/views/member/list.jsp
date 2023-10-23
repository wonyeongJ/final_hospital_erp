<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title>직원조회</title>

	<!-- Site favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="vendors/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="vendors/images/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="vendors/images/favicon-16x16.png">

	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="vendors/styles/core.css">
	<link rel="stylesheet" type="text/css" href="vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="src/plugins/datatables/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="src/plugins/datatables/css/responsive.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="vendors/styles/style.css">

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-119386393-1');
	</script>
</head>
<body>
	<h1>직원관리</h1>
	<h3>직원조회</h3>
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
	
				<!-- Export Datatable start -->
				<div class="card-box mb-30">
					<div class="pd-20">
						<h4 class="text-blue h4">Data Table with Export Buttons</h4>
					</div>
					<div class="pb-20">
						<table class="table hover multiple-select-row data-table-export nowrap">
							<thead>
								<tr>
									<th class="table-plus datatable-nosort">Name</th>
									<th>Age</th>
									<th>Office</th>
									<th>Address</th>
									<th>Start Date</th>
									<th>Salart</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="table-plus">Gloria F. Mead</td>
									<td>25</td>
									<td>Sagittarius</td>
									<td>2829 Trainer Avenue Peoria, IL 61602 </td>
									<td>29-03-2018</td>
									<td>$162,700</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>30</td>
									<td>Gemini</td>
									<td>1280 Prospect Valley Road Long Beach, CA 90802 </td>
									<td>29-03-2018</td>
									<td>$162,700</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>20</td>
									<td>Gemini</td>
									<td>2829 Trainer Avenue Peoria, IL 61602 </td>
									<td>29-03-2018</td>
									<td>$162,700</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>30</td>
									<td>Sagittarius</td>
									<td>1280 Prospect Valley Road Long Beach, CA 90802 </td>
									<td>29-03-2018</td>
									<td>$162,700</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>25</td>
									<td>Gemini</td>
									<td>2829 Trainer Avenue Peoria, IL 61602 </td>
									<td>29-03-2018</td>
									<td>$162,700</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>20</td>
									<td>Sagittarius</td>
									<td>1280 Prospect Valley Road Long Beach, CA 90802 </td>
									<td>29-03-2018</td>
									<td>$162,700</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>18</td>
									<td>Gemini</td>
									<td>1280 Prospect Valley Road Long Beach, CA 90802 </td>
									<td>29-03-2018</td>
									<td>$162,700</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>30</td>
									<td>Sagittarius</td>
									<td>1280 Prospect Valley Road Long Beach, CA 90802 </td>
									<td>29-03-2018</td>
									<td>$162,700</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>30</td>
									<td>Sagittarius</td>
									<td>1280 Prospect Valley Road Long Beach, CA 90802 </td>
									<td>29-03-2018</td>
									<td>$162,700</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>30</td>
									<td>Gemini</td>
									<td>1280 Prospect Valley Road Long Beach, CA 90802 </td>
									<td>29-03-2018</td>
									<td>$162,700</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>30</td>
									<td>Gemini</td>
									<td>1280 Prospect Valley Road Long Beach, CA 90802 </td>
									<td>29-03-2018</td>
									<td>$162,700</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>30</td>
									<td>Gemini</td>
									<td>1280 Prospect Valley Road Long Beach, CA 90802 </td>
									<td>29-03-2018</td>
									<td>$162,700</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- Export Datatable End -->
			</div>
		</div>
	</div>
	<!-- js -->
	<script src="vendors/scripts/core.js"></script>
	<script src="vendors/scripts/script.min.js"></script>
	<script src="vendors/scripts/process.js"></script>
	<script src="vendors/scripts/layout-settings.js"></script>
	<script src="src/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script src="src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script src="src/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script src="src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
	<!-- buttons for Export datatable -->
	<script src="src/plugins/datatables/js/dataTables.buttons.min.js"></script>
	<script src="src/plugins/datatables/js/buttons.bootstrap4.min.js"></script>
	<script src="src/plugins/datatables/js/buttons.print.min.js"></script>
	<script src="src/plugins/datatables/js/buttons.html5.min.js"></script>
	<script src="src/plugins/datatables/js/buttons.flash.min.js"></script>
	<script src="src/plugins/datatables/js/pdfmake.min.js"></script>
	<script src="src/plugins/datatables/js/vfs_fonts.js"></script>
	<!-- Datatable Setting js -->
	<script src="vendors/scripts/datatable-setting.js"></script></body>
</html>