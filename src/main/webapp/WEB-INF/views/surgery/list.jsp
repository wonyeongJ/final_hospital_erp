<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link rel="stylesheet" href="/vendors/styles/equipment/list.css">
<link rel="stylesheet" href="/vendors/styles/surgery/list.css">

<h1>수술실/비품관리</h1>
	<br>
<h2>수술실 예약</h2>
<div class="clearfix mb-20">
	<div class="pull-right">
		<input type="button" class="btn btn-outline-primary" value="나의 예약" onclick="location.href='scheduleList'">
	</div>
</div>
<div class="pd-20 card-box mb-30">
	<table class="table hover multiple-select-row data-table-export nowrap dataTable no-footer dtr-inline" id="DataTables_Table_2" role="grid">
		<thead>
			<tr role="row">
				<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" aria-label="no: activate to sort column ascending">no</th>
				<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" aria-label="항목: activate to sort column ascending">호수</th>
				<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" aria-label="시리얼 넘버: activate to sort column ascending">운영 시간</th>
				<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" aria-label="대여자: activate to sort column ascending">예약하기</th>
		</thead>
		<tbody>
			<tr role="row" class="">
				<td>1</td>
				<td>201</td>
				<td>09:00 ~ 21:00</td>
				<td><span class="badge badge-primary"><a onclick="location.href='scheduleInsert'" id="a2">예약하기</a></span></td>
			</tr>
			<tr role="row" class="">
				<td>2</td>
				<td>202</td>
				<td>09:00 ~ 21:00</td>
				<td><span class="badge badge-primary"><a onclick="location.href='scheduleInsert'" id="a2">예약하기</a></span></td>
			</tr>
			<tr role="row" class="">
				<td>3</td>
				<td>203</td>
				<td>09:00 ~ 21:00</td>
				<td><span class="badge badge-primary"><a onclick="location.href='scheduleInsert'" id="a2">예약하기</a></span></td>
			</tr>
			<tr role="row" class="">
				<td>4</td>
				<td>204</td>
				<td>09:00 ~ 21:00</td>
				<td><span class="badge badge-primary"><a onclick="location.href='scheduleInsert'" id="a2">예약하기</a></span></td>
			</tr>
			<tr role="row" class="">
				<td>5</td>
				<td>203</td>
				<td>09:00 ~ 21:00</td>
				<td><span class="badge badge-primary"><a onclick="location.href='scheduleInsert'" id="a2">예약하기</a></span></td>
			</tr>
		</tbody>
	</table>
	<div class="collapse collapse-box" id="basic-table">
		<div class="code-box">
			<div class="clearfix">
				<a href="javascript:;" class="btn btn-primary btn-sm code-copy pull-left" data-clipboard-target="#basic-table-code"><i class="fa fa-clipboard"></i> Copy Code</a>
				<a href="#basic-table" class="btn btn-primary btn-sm pull-right" rel="content-y" data-toggle="collapse" role="button"><i class="fa fa-eye-slash"></i> Hide Code</a>
			</div>
			<pre><code class="xml copy-pre hljs" id="basic-table-code">
				<span class="hljs-tag">&lt;<span class="hljs-name">table</span> <span class="hljs-attr">class</span>=<span class="hljs-string">"table"</span>&gt;</span>
				<span class="hljs-tag">&lt;<span class="hljs-name">thead</span>&gt;</span>
					<span class="hljs-tag">&lt;<span class="hljs-name">tr</span>&gt;</span>
					<span class="hljs-tag">&lt;<span class="hljs-name">th</span> <span class="hljs-attr">scope</span>=<span class="hljs-string">"col"</span>&gt;</span>#<span class="hljs-tag">&lt;/<span class="hljs-name">th</span>&gt;</span>
					<span class="hljs-tag">&lt;/<span class="hljs-name">tr</span>&gt;</span>
				<span class="hljs-tag">&lt;/<span class="hljs-name">thead</span>&gt;</span>
				<span class="hljs-tag">&lt;<span class="hljs-name">tbody</span>&gt;</span>
					<span class="hljs-tag">&lt;<span class="hljs-name">tr</span>&gt;</span>
					<span class="hljs-tag">&lt;<span class="hljs-name">th</span> <span class="hljs-attr">scope</span>=<span class="hljs-string">"row"</span>&gt;</span>1<span class="hljs-tag">&lt;/<span class="hljs-name">th</span>&gt;</span>
					<span class="hljs-tag">&lt;/<span class="hljs-name">tr</span>&gt;</span>
				<span class="hljs-tag">&lt;/<span class="hljs-name">tbody</span>&gt;</span>
				<span class="hljs-tag">&lt;/<span class="hljs-name">table</span>&gt;</span>
			</code></pre>
		</div>
	</div>	
		<br>
</div>
<div class="clearfix mb-20">
	<div class="pull-right">
		<a href="#" class="btn-block" data-toggle="modal" data-target="#Medium-modal" type="button">
			<button class="btn btn-outline-primary">수술실 관리</button>
		</a>
		<div class="modal fade" id="Medium-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myLargeModalLabel">수술실 관리</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					</div>
					<div class="modal-body">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th scope="row"><input class="form-control" type="text" name="" value="201호"></th>
									<td><button class="btn btn-outline-primary header-white">수정</button></td>
								</tr>
								<tr>
									<th scope="row"><input class="form-control" type="text" name="" value="202호"></th>
									<td><button class="btn btn-outline-primary header-white">수정</button></td>
								</tr>
								<tr>
									<th scope="row"><input class="form-control" type="text" name="" value="203호"></th>
									<td><button class="btn btn-outline-primary header-white">수정</button></td>
								</tr>
								<tr>
									<th scope="row"><input class="form-control" type="text" name="" value="204호"></th>
									<td><button class="btn btn-outline-primary header-white">수정</button></td>
								</tr>
								<tr>
									<th scope="row"><input class="form-control" type="text" name="" value="205호"></th>
									<td><button class="btn btn-outline-primary header-white">수정</button></td>
								</tr>
								<tr>
									<th scope="row"><input type="text" placeholder="호수 입력" class="form-control" style="width: 120px;"></th>
									<td><button class="btn btn-outline-primary header-white">수술실 등록</button></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script src="/src/plugins/switchery/switchery.min.js"></script>