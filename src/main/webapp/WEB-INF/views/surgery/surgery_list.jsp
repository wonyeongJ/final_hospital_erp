<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link rel="stylesheet" href="/vendors/styles/equipment/list.css">
<link rel="stylesheet" href="/vendors/styles/surgery/list.css">

<h1>수술실/비품관리</h1>
	<br>
<h2>수술실 예약</h2>
<div class="clearfix mb-20">
	<div class="pull-right">
		<input type="button" class="btn btn-outline-primary header-white" value="나의 예약" onclick="window.open('myReservation', '나의 수술실 예약 내역', 'width=800, height=750')">
	</div>
</div>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th scope="col" class="th-1">no</th>
				<th scope="col">호수</th>
				<th scope="col">운영 시간</th>
				<th scope="col">예약하기</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row" class="th-1">1</th>
				<td>201</td>
				<td>09:00 ~ 21:00</td>
				<td>
					<span class="badge badge-primary"><a onclick="window.open('reservation', '수술실 예약', 'width=800, height=750')" id="a2">예약하기</a></span>
				</td>
			</tr>
			<tr>
				<th scope="row" class="th-1">2</th>
				<td>202</td>
				<td>09:00 ~ 21:00</td>
				<td><span class="badge badge-primary"><a onclick="window.open('reservation', '수술실 조회/예약', 'width=800, height=750')" id="a2">예약하기</a></span></td>
			</tr>
			<tr>
				<th scope="row" class="th-1">3</th>
				<td>203</td>
				<td>09:00 ~ 21:00</td>
				<td><span class="badge badge-primary"><a onclick="window.open('reservation', '수술실 조회/예약', 'width=800, height=750')" id="a2">예약하기</a></span></td>
			</tr>
			<tr>
				<th scope="row" class="th-1">4</th>
				<td>204</td>
				<td>09:00 ~ 21:00</td>
				<td><span class="badge badge-primary"><a onclick="window.open('reservation', '수술실 조회/예약', 'width=800, height=750')" id="a2">예약하기</a></span></td>
			</tr>
			<tr>
				<th scope="row" class="th-1">5</th>
				<td>205</td>
				<td>09:00 ~ 21:00</td>
				<td><span class="badge badge-primary"><a onclick="window.open('reservation', '수술실 조회/예약', 'width=800, height=750')" id="a2">예약하기</a></span></td>
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
	<div class="clearfix mb-20">
		<div class="pull-right">
			<input type="button" class="btn btn-outline-primary header-white" value="수술실 관리" onclick="window.open('roomList', '수술실 관리', 'width=800, height=750')">
		</div>
	</div>
</div>

<script src="/src/plugins/switchery/switchery.min.js"></script>